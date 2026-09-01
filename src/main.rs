mod exercise;
mod report;
mod runner;

use anyhow::{bail, Context, Result};
use clap::{Parser, Subcommand};
use exercise::{Exercise, Info};
use notify::{Config, EventKind, RecommendedWatcher, RecursiveMode, Watcher};
use report::*;
use runner::{ProcessRunner, Runner};
use std::path::{Path, PathBuf};
use std::sync::mpsc;
use std::time::{Duration, Instant};

#[derive(Parser)]
#[command(name = "qlings", about = "Small q / kdb+ exercises you fix until they pass")]
struct Cli {
    /// Path to the q binary (default: $QLINGS_Q, then `q` on PATH, then ~/.kx/bin/q)
    #[arg(long, global = true)]
    q: Option<PathBuf>,
    /// Seconds any single exercise may run before it is killed
    #[arg(long, global = true, default_value_t = 20)]
    timeout: u64,
    #[command(subcommand)]
    cmd: Option<Cmd>,
}

#[derive(Subcommand)]
enum Cmd {
    /// Work through the exercises in order, stopping at the first unsolved one
    Verify,
    /// Re-run the current exercise every time you save a file
    Watch,
    /// List every exercise and whether it is done
    List,
    /// Run a single exercise by name
    Run { name: String },
    /// Show the hint for an exercise
    Hint { name: String },
    /// Restore an exercise to its original state, discarding your edits
    Reset { name: String },
    /// Print the reference solution for an exercise
    Solution { name: String },
    /// Copy any missing exercise files into place and build the sample database
    Setup,
}

fn main() {
    if let Err(e) = real_main() {
        eprintln!("{RED}error:{RESET} {e:#}");
        std::process::exit(1);
    }
}

fn real_main() -> Result<()> {
    let cli = Cli::parse();
    let root = find_root()?;
    let info = Info::load(&root)?;
    let q = find_q(cli.q)?;
    let runner = ProcessRunner::new(root.clone(), q, Duration::from_secs(cli.timeout));

    match cli.cmd.unwrap_or(Cmd::Verify) {
        Cmd::Setup => setup(&root, &info, &runner),
        Cmd::List => list(&root, &info),
        Cmd::Verify => {
            ensure_files(&root, &info)?;
            verify(&root, &info, &runner).map(|_| ())
        }
        Cmd::Watch => {
            ensure_files(&root, &info)?;
            watch(&root, &info, &runner)
        }
        Cmd::Run { name } => {
            ensure_files(&root, &info)?;
            let ex = info.find(&name)?;
            header(ex);
            let o = runner.run(ex)?;
            let ok = outcome(ex, &root, &o);
            if ok && ex.not_done(&root)? {
                still_marked(ex);
            }
            if !ok {
                std::process::exit(1);
            }
            Ok(())
        }
        Cmd::Hint { name } => {
            println!("{}", info.find(&name)?.hint);
            Ok(())
        }
        Cmd::Reset { name } => {
            let ex = info.find(&name)?;
            let from = template_path(&root, ex);
            let to = ex.path(&root);
            std::fs::create_dir_all(to.parent().unwrap())?;
            std::fs::copy(&from, &to)
                .with_context(|| format!("restoring {}", to.display()))?;
            println!("{YELLOW}reset{RESET} {}", to.display());
            Ok(())
        }
        Cmd::Solution { name } => {
            let ex = info.find(&name)?;
            let p = ex.solution_path(&root);
            let s = std::fs::read_to_string(&p)
                .with_context(|| format!("reading {}", p.display()))?;
            println!("{DIM}{}{RESET}\n{s}", p.display());
            Ok(())
        }
    }
}

/// exercises/ is a working copy; templates/ holds the pristine originals.
fn template_path(root: &Path, ex: &Exercise) -> PathBuf {
    root.join("templates").join(&ex.dir).join(format!("{}.q", ex.name))
}

fn ensure_files(root: &Path, info: &Info) -> Result<()> {
    for ex in &info.exercises {
        let dest = ex.path(root);
        if !dest.exists() {
            let src = template_path(root, ex);
            if !src.exists() {
                bail!("missing template {}", src.display());
            }
            std::fs::create_dir_all(dest.parent().unwrap())?;
            std::fs::copy(&src, &dest)?;
        }
    }
    Ok(())
}

fn setup(root: &Path, info: &Info, runner: &ProcessRunner) -> Result<()> {
    ensure_files(root, info)?;
    println!("{GREEN}ok{RESET}   exercise files in {}", root.join("exercises").display());

    let gen = root.join("data").join("gen.q");
    if gen.exists() {
        println!("{DIM}building the sample database (once) ...{RESET}");
        let st = std::process::Command::new(&runner.q)
            .arg(&gen)
            .arg("-q")
            .current_dir(root)
            .status()
            .context("running data/gen.q")?;
        if !st.success() {
            bail!("data/gen.q failed");
        }
        println!("{GREEN}ok{RESET}   sample database in {}", root.join("data/db").display());
    }
    println!("\nStart with: {BOLD}qlings watch{RESET}");
    Ok(())
}

fn list(root: &Path, info: &Info) -> Result<()> {
    let mut done = 0;
    for ex in &info.exercises {
        let state = if !ex.path(root).exists() {
            format!("{DIM}  -  {RESET}")
        } else if ex.not_done(root)? {
            format!("{YELLOW} todo{RESET}")
        } else {
            done += 1;
            format!("{GREEN} done{RESET}")
        };
        println!("{state}  {BOLD}{:<24}{RESET} {DIM}{}{RESET}", ex.name, ex.about);
    }
    println!();
    progress(done, info.exercises.len());
    Ok(())
}

/// Walk the list in order. Returns the first exercise that is not finished.
fn verify<'a>(root: &Path, info: &'a Info, runner: &dyn Runner) -> Result<Option<&'a Exercise>> {
    for (i, ex) in info.exercises.iter().enumerate() {
        let o = runner.run(ex)?;
        let passed = o.passed();
        let marked = ex.not_done(root)?;
        if passed && !marked {
            continue;
        }
        progress(i, info.exercises.len());
        println!();
        header(ex);
        outcome(ex, root, &o);
        if passed && marked {
            still_marked(ex);
        }
        return Ok(Some(ex));
    }
    progress(info.exercises.len(), info.exercises.len());
    println!("\n{GREEN}{BOLD}All exercises complete. Nicely done.{RESET}");
    Ok(None)
}

fn watch(root: &Path, info: &Info, runner: &dyn Runner) -> Result<()> {
    let (tx, rx) = mpsc::channel();
    let mut watcher = RecommendedWatcher::new(
        move |res: notify::Result<notify::Event>| {
            if let Ok(ev) = res {
                if matches!(ev.kind, EventKind::Create(_) | EventKind::Modify(_)) {
                    let _ = tx.send(());
                }
            }
        },
        Config::default(),
    )?;
    watcher.watch(&root.join("exercises"), RecursiveMode::Recursive)?;

    print!("\x1b[2J\x1b[H");
    verify(root, info, runner)?;
    println!("\n{DIM}watching exercises/ -- save a file to re-run, ctrl-c to stop{RESET}");

    let mut last = Instant::now() - Duration::from_secs(1);
    loop {
        if rx.recv().is_err() {
            break;
        }
        // editors emit bursts of events; collapse them
        while rx.recv_timeout(Duration::from_millis(120)).is_ok() {}
        if last.elapsed() < Duration::from_millis(150) {
            continue;
        }
        last = Instant::now();
        print!("\x1b[2J\x1b[H");
        if verify(root, info, runner)?.is_none() {
            break;
        }
        println!("\n{DIM}watching exercises/ -- save a file to re-run, ctrl-c to stop{RESET}");
    }
    Ok(())
}

fn find_root() -> Result<PathBuf> {
    if let Ok(r) = std::env::var("QLINGS_ROOT") {
        return Ok(PathBuf::from(r));
    }
    let mut d = std::env::current_dir()?;
    loop {
        if d.join("info.toml").exists() {
            return Ok(d);
        }
        if !d.pop() {
            bail!("run this from inside the qlings project (no info.toml found)");
        }
    }
}

fn find_q(explicit: Option<PathBuf>) -> Result<PathBuf> {
    if let Some(p) = explicit {
        return Ok(p);
    }
    if let Ok(p) = std::env::var("QLINGS_Q") {
        return Ok(PathBuf::from(p));
    }
    if let Ok(path) = std::env::var("PATH") {
        for dir in std::env::split_paths(&path) {
            let c = dir.join("q");
            if c.is_file() {
                return Ok(c);
            }
        }
    }
    if let Some(home) = std::env::var_os("HOME") {
        let c = PathBuf::from(home).join(".kx/bin/q");
        if c.is_file() {
            return Ok(c);
        }
    }
    bail!("could not find the q binary -- pass --q /path/to/q or set QLINGS_Q")
}
