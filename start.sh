#!/usr/bin/env bash
# qlings launcher: build if needed, set up if needed, then start watching.
#
#   ./start.sh              build + setup if required, then `watch`
#   ./start.sh verify       same preparation, then run any other subcommand
#
# Override the q binary with QLINGS_Q=/path/to/q ./start.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

BIN="$ROOT/target/release/qlings"
say() { printf '\033[34m==>\033[0m %s\n' "$*"; }
die() { printf '\033[31merror:\033[0m %s\n' "$*" >&2; exit 1; }

# --- 1. find q -------------------------------------------------------------
find_q() {
  if [ -n "${QLINGS_Q:-}" ]; then printf '%s' "$QLINGS_Q"; return; fi
  if command -v q >/dev/null 2>&1; then command -v q; return; fi
  if [ -x "$HOME/.kx/bin/q" ]; then printf '%s' "$HOME/.kx/bin/q"; return; fi
  return 1
}

if ! Q="$(find_q)"; then
  die "no q binary found.
  Install kdb+ Community Edition from https://kx.com/kdb-personal-edition-download/
  then either put q on your PATH or run: QLINGS_Q=/path/to/q ./start.sh"
fi
[ -x "$Q" ] || die "q at '$Q' is not executable"
export QLINGS_Q="$Q"

# --- 2. build the runner if it is missing or out of date --------------------
newest_src="$(find src Cargo.toml -type f -newer "$BIN" 2>/dev/null | head -1 || true)"
if [ ! -x "$BIN" ] || [ -n "$newest_src" ]; then
  command -v cargo >/dev/null 2>&1 || die "cargo not found -- install Rust from https://rustup.rs"
  say "building the runner"
  cargo build --release --quiet
fi

# --- 3. set up once ---------------------------------------------------------
# `setup` is idempotent, but skip it entirely once both halves are in place so
# the common case starts instantly.
needs_setup=0
[ -d exercises ] || needs_setup=1
[ -d data/db ]   || needs_setup=1
if [ "$needs_setup" -eq 1 ]; then
  say "first run: staging exercises and building the sample database"
  "$BIN" setup
else
  # a newly added exercise still needs its file copied across
  "$BIN" setup >/dev/null
fi

# --- 4. go ------------------------------------------------------------------
exec "$BIN" "${@:-watch}"
