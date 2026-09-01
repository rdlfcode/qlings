#!/usr/bin/env bash
# Kill any q servers left behind by an interrupted test run.
# Matches only processes whose executable IS q, never the shell scanning them.
n=0
for p in $(ls /proc 2>/dev/null | grep -E '^[0-9]+$'); do
  [ "$p" = "$$" ] && continue
  exe=$(readlink /proc/$p/exe 2>/dev/null) || continue
  case "$exe" in */q) kill -9 "$p" 2>/dev/null && n=$((n+1));; esac
done
echo "killed $n"
