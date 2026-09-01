use anyhow::{anyhow, Context, Result};
use serde::Deserialize;
use std::path::{Path, PathBuf};

/// The marker a learner deletes once they have solved an exercise.
pub const NOT_DONE: &str = "I AM NOT DONE";

#[derive(Debug, Deserialize)]
pub struct Info {
    pub exercises: Vec<Exercise>,
}

#[derive(Debug, Deserialize, Clone)]
pub struct Exercise {
    /// Unique, ordered name, e.g. "core01_atoms".
    pub name: String,
    /// Directory under exercises/ tests/ solutions/, e.g. "01_core".
    pub dir: String,
    /// One-line description of what the exercise teaches.
    pub about: String,
    /// Shown by `qlings hint <name>`.
    pub hint: String,
}

impl Exercise {
    pub fn path(&self, root: &Path) -> PathBuf {
        root.join("exercises").join(&self.dir).join(format!("{}.q", self.name))
    }
    pub fn test_path(&self, root: &Path) -> PathBuf {
        root.join("tests").join(&self.dir).join(format!("{}_test.q", self.name))
    }
    pub fn solution_path(&self, root: &Path) -> PathBuf {
        root.join("solutions").join(&self.dir).join(format!("{}.q", self.name))
    }

    /// True while the learner has not yet removed the marker line.
    pub fn not_done(&self, root: &Path) -> Result<bool> {
        let p = self.path(root);
        let src = std::fs::read_to_string(&p)
            .with_context(|| format!("reading {}", p.display()))?;
        Ok(src.contains(NOT_DONE))
    }
}

impl Info {
    pub fn load(root: &Path) -> Result<Info> {
        let p = root.join("info.toml");
        let raw = std::fs::read_to_string(&p)
            .with_context(|| format!("reading {}", p.display()))?;
        let info: Info = toml::from_str(&raw)
            .with_context(|| format!("parsing {}", p.display()))?;
        Ok(info)
    }

    pub fn find(&self, name: &str) -> Result<&Exercise> {
        self.exercises
            .iter()
            .find(|e| e.name == name)
            .ok_or_else(|| anyhow!("no exercise named `{name}` (try `qlings list`)"))
    }
}
