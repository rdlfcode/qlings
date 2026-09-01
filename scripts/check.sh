#!/usr/bin/env bash
# Author-side verification: every reference solution must pass all of its
# checks, and every template must NOT pass (otherwise the exercise is a no-op).
# Usage: scripts/check.sh [name ...]   (default: everything in info.toml)
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
Q="${QLINGS_Q:-$HOME/.kx/bin/q}"
cd "$ROOT"

names=("$@")
if [ ${#names[@]} -eq 0 ]; then
  mapfile -t names < <(grep -oP '^name\s*=\s*"\K[^"]+' info.toml)
fi

run() { # run <test_file> <exercise_file>
  QLINGS_EXERCISE="$2" QLINGS_Q="$Q" timeout 60 "$Q" "$1" -q 2>&1 | grep '^QLINGS_JSON '
}

fail=0
for n in "${names[@]}"; do
  dir=$(grep -A3 "^name = \"$n\"" info.toml | grep -oP '^dir\s*=\s*"\K[^"]+' | head -1)
  t="$ROOT/tests/$dir/${n}_test.q"
  s="$ROOT/solutions/$dir/$n.q"
  m="$ROOT/templates/$dir/$n.q"
  for f in "$t" "$s" "$m"; do
    [ -f "$f" ] || { echo "MISSING  $n  ($f)"; fail=1; continue 2; }
  done

  sol=$(run "$t" "$s")
  if [ -z "$sol" ]; then
    echo "BROKEN   $n  solution produced no result line"; fail=1; continue
  fi
  if grep -q '"ok":false' <<<"$sol"; then
    echo "SOLFAIL  $n"
    echo "$sol" | tr '{' '\n' | grep '"ok":false' | sed 's/^/           /'
    fail=1; continue
  fi

  tpl=$(run "$t" "$m")
  if [ -n "$tpl" ] && ! grep -q '"ok":false' <<<"$tpl"; then
    echo "NOOP     $n  template already passes -- nothing for the learner to do"
    fail=1; continue
  fi
  if ! grep -q "I AM NOT DONE" "$m"; then
    echo "NOMARK   $n  template is missing the I AM NOT DONE marker"; fail=1; continue
  fi
  nchk=$(grep -o '"name":' <<<"$sol" | wc -l)
  echo "ok       $n  ($nchk checks)"
done
exit $fail
