use anyhow::{Context, Result};
use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

/// Which exercises have been seen to pass.
///
/// Without this we would have to re-run every solved exercise on every save
/// just to find the current one, which is what the old `I AM NOT DONE` marker
/// bought at the cost of making the learner edit a line by hand.
#[derive(Debug, Default)]
pub struct State {
    done: BTreeSet<String>,
    path: PathBuf,
}

const HEADER: &str = "# Exercises qlings has seen pass. Delete a line to redo one,\n\
                      # or delete the file to start over.";

impl State {
    pub fn load(root: &Path) -> Result<State> {
        let path = root.join(".qlings-state");
        let mut done = BTreeSet::new();
        if path.exists() {
            let raw = std::fs::read_to_string(&path)
                .with_context(|| format!("reading {}", path.display()))?;
            for line in raw.lines() {
                let l = line.trim();
                if !l.is_empty() && !l.starts_with('#') {
                    done.insert(l.to_string());
                }
            }
        }
        Ok(State { done, path })
    }

    pub fn is_done(&self, name: &str) -> bool {
        self.done.contains(name)
    }

    pub fn count(&self) -> usize {
        self.done.len()
    }

    pub fn mark_done(&mut self, name: &str) -> Result<()> {
        if self.done.insert(name.to_string()) {
            self.save()?;
        }
        Ok(())
    }

    pub fn mark_todo(&mut self, name: &str) -> Result<()> {
        if self.done.remove(name) {
            self.save()?;
        }
        Ok(())
    }

    fn save(&self) -> Result<()> {
        let body: String = self
            .done
            .iter()
            .map(|n| format!("{n}\n"))
            .collect();
        std::fs::write(&self.path, format!("{HEADER}\n{body}"))
            .with_context(|| format!("writing {}", self.path.display()))
    }
}
