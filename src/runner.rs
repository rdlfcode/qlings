use crate::exercise::Exercise;
use anyhow::{Context, Result};
use serde::Deserialize;
use std::io::Read;
use std::path::{Path, PathBuf};
use std::process::{Command, Stdio};
use std::sync::mpsc;
use std::time::{Duration, Instant};

/// One assertion, as reported by the q-side harness.
#[derive(Debug, Deserialize)]
pub struct Check {
    pub name: String,
    pub ok: bool,
    #[allow(dead_code)]
    pub err: String,
    pub expected: String,
    pub actual: String,
}

#[derive(Debug)]
pub struct Outcome {
    pub checks: Vec<Check>,
    /// Anything the learner's own code printed.
    pub output: String,
    /// Set when the run never produced a result line.
    pub fatal: Option<String>,
}

impl Outcome {
    pub fn passed(&self) -> bool {
        self.fatal.is_none() && !self.checks.is_empty() && self.checks.iter().all(|c| c.ok)
    }
}

/// The seam. Today there is one implementation, which starts a fresh q
/// process per check; a persistent-IPC implementation can be dropped in
/// here without touching the CLI or the reporter.
pub trait Runner {
    fn run(&self, ex: &Exercise) -> Result<Outcome>;
}

pub struct ProcessRunner {
    pub q: PathBuf,
    pub root: PathBuf,
    pub timeout: Duration,
}

const MARKER: &str = "QLINGS_JSON ";

impl ProcessRunner {
    pub fn new(root: PathBuf, q: PathBuf, timeout: Duration) -> Self {
        Self { q, root, timeout }
    }
}

impl Runner for ProcessRunner {
    fn run(&self, ex: &Exercise) -> Result<Outcome> {
        let test = ex.test_path(&self.root);
        let exercise = ex.path(&self.root);
        anyhow::ensure!(test.exists(), "missing test file {}", test.display());
        anyhow::ensure!(exercise.exists(), "missing exercise file {}", exercise.display());

        // q resolves \l paths relative to its working directory, so run from
        // the project root and hand the exercise over by absolute path.
        let mut child = Command::new(&self.q)
            .arg(&test)
            .arg("-q")
            .current_dir(&self.root)
            .env("QLINGS_EXERCISE", abs(&exercise)?)
            .env("QLINGS_ROOT", abs(&self.root)?)
            .env("QLINGS_Q", &self.q)
            .stdin(Stdio::null())
            .stdout(Stdio::piped())
            .stderr(Stdio::piped())
            .spawn()
            .with_context(|| format!("could not start q at {}", self.q.display()))?;

        let mut out = child.stdout.take().unwrap();
        let mut err = child.stderr.take().unwrap();
        let (tx, rx) = mpsc::channel();
        let tx2 = tx.clone();
        std::thread::spawn(move || {
            let mut s = String::new();
            let _ = out.read_to_string(&mut s);
            let _ = tx.send((0, s));
        });
        std::thread::spawn(move || {
            let mut s = String::new();
            let _ = err.read_to_string(&mut s);
            let _ = tx2.send((1, s));
        });

        let start = Instant::now();
        let mut timed_out = false;
        loop {
            match child.try_wait()? {
                Some(_) => break,
                None => {
                    if start.elapsed() > self.timeout {
                        let _ = child.kill();
                        let _ = child.wait();
                        timed_out = true;
                        break;
                    }
                    std::thread::sleep(Duration::from_millis(10));
                }
            }
        }

        let mut stdout = String::new();
        let mut stderr = String::new();
        for _ in 0..2 {
            match rx.recv_timeout(Duration::from_secs(2)) {
                Ok((0, s)) => stdout = s,
                Ok((_, s)) => stderr = s,
                Err(_) => break,
            }
        }

        if timed_out {
            return Ok(Outcome {
                checks: vec![],
                output: trim_block(&stdout, MARKER),
                fatal: Some(format!(
                    "timed out after {}s -- an infinite loop, or waiting on input?",
                    self.timeout.as_secs()
                )),
            });
        }

        let line = stdout
            .lines()
            .rev()
            .find(|l| l.starts_with(MARKER))
            .or_else(|| stderr.lines().rev().find(|l| l.starts_with(MARKER)));

        let Some(line) = line else {
            let mut detail = stderr.trim().to_string();
            if detail.is_empty() {
                detail = stdout.trim().to_string();
            }
            return Ok(Outcome {
                checks: vec![],
                output: String::new(),
                fatal: Some(if detail.is_empty() {
                    "q produced no result -- the test file did not finish".into()
                } else {
                    detail
                }),
            });
        };

        let checks: Vec<Check> = serde_json::from_str(&line[MARKER.len()..])
            .context("parsing the harness result line")?;
        Ok(Outcome {
            checks,
            output: trim_block(&stdout, MARKER),
            fatal: None,
        })
    }
}

fn abs(p: &Path) -> Result<String> {
    Ok(std::fs::canonicalize(p)
        .with_context(|| format!("resolving {}", p.display()))?
        .to_string_lossy()
        .into_owned())
}

/// Everything the learner printed, minus our protocol line.
fn trim_block(s: &str, marker: &str) -> String {
    s.lines()
        .filter(|l| !l.starts_with(marker))
        .collect::<Vec<_>>()
        .join("\n")
        .trim()
        .to_string()
}
