use crate::exercise::Exercise;
use crate::runner::Outcome;
use std::path::Path;

pub const RESET: &str = "\x1b[0m";
pub const BOLD: &str = "\x1b[1m";
pub const DIM: &str = "\x1b[2m";
pub const RED: &str = "\x1b[31m";
pub const GREEN: &str = "\x1b[32m";
pub const YELLOW: &str = "\x1b[33m";
pub const BLUE: &str = "\x1b[34m";

pub fn header(ex: &Exercise) {
    println!("{BOLD}{}{RESET} {DIM}-- {}{RESET}", ex.name, ex.about);
}

/// Print the result of one run. Returns true if everything passed.
pub fn outcome(ex: &Exercise, root: &Path, o: &Outcome) -> bool {
    if !o.output.is_empty() {
        println!("{DIM}your output:{RESET}");
        for l in o.output.lines() {
            println!("  {l}");
        }
    }

    if let Some(f) = &o.fatal {
        println!("{RED}x{RESET} {}", f);
        println!("\n{DIM}file: {}{RESET}", ex.path(root).display());
        return false;
    }

    for c in &o.checks {
        if c.ok {
            println!("{GREEN}ok{RESET}   {}", c.name);
        } else {
            println!("{RED}FAIL{RESET} {}", c.name);
            println!("       expected: {GREEN}{}{RESET}", c.expected);
            println!("       actual:   {RED}{}{RESET}", c.actual);
        }
    }

    let passed = o.passed();
    if passed {
        println!("\n{GREEN}All checks passed.{RESET}");
    } else {
        let n = o.checks.iter().filter(|c| !c.ok).count();
        println!("\n{RED}{n} check(s) failing.{RESET}");
        println!("{DIM}file: {}{RESET}", ex.path(root).display());
        println!("{DIM}hint: qlings hint {}{RESET}", ex.name);
    }
    passed
}

pub fn still_marked(ex: &Exercise) {
    println!(
        "\n{YELLOW}!{RESET} Checks pass, but the {BOLD}{}{RESET} line is still in the file.",
        crate::exercise::NOT_DONE
    );
    println!("  Delete that line to move on to the next exercise.");
    let _ = ex;
}

pub fn progress(done: usize, total: usize) {
    let width = 40usize;
    let filled = if total == 0 { 0 } else { done * width / total };
    println!(
        "{BLUE}[{}{}]{RESET} {done}/{total}",
        "#".repeat(filled),
        "-".repeat(width - filled)
    );
}
