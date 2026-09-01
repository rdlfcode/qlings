# qlings

Small, broken q programs you fix until they pass — [Rustlings](https://github.com/rust-lang/rustlings), for kdb+/q.

77 exercises across four chapters. Each is a `.q` file with holes in it and a
hidden test file that checks your answer. A Rust CLI watches the files and
re-runs the current exercise every time you save.

```
core01_atoms -- atoms and the type system
OK   answer is the long 42
FAIL ratio is the float 2.5
       expected: 2.5
       actual:   0n
```

---

## Quick start

```sh
git clone <this repo> && cd qlings
./start.sh
```

`start.sh` finds your q, builds the runner if needed, stages the exercises,
generates the sample database, and drops you into watch mode. It is safe to run
every time — the setup work is skipped once it is done.

Requirements:

- **kdb+ Community Edition** — any recent build; developed against 5f
  (2026.07.23). Free for non-commercial use from
  [kx.com](https://kx.com/kdb-personal-edition-download/).
- **Rust** (2021 edition) to build the runner.

If q is not on your `PATH`:

```sh
QLINGS_Q=/path/to/q ./start.sh
```

The runner looks for q via `--q`, then `$QLINGS_Q`, then `PATH`, then
`~/.kx/bin/q`.

---

## How you use it

`./start.sh` runs the exercises in order and stops at the first one that does not
pass. Open the file it names and fix the `TODO`s. Save, and the checks re-run;
when they all pass it moves straight on to the next exercise.

Progress lives in `.qlings-state` (gitignored). Delete a line from it to redo an
exercise, or delete the file to start over. `qlings verify --all` ignores it and
re-runs the whole set from scratch.

Any subcommand can be passed through the launcher (`./start.sh list`), or run
the binary directly once built:

| command | what it does |
| --- | --- |
| `qlings watch` | re-run the current exercise on every save |
| `qlings verify` | run the list once, stop at the first failure |
| `qlings verify --all` | re-run every exercise, ignoring recorded progress |
| `qlings list` | every exercise and whether it is done |
| `qlings run <name>` | run a single exercise |
| `qlings hint <name>` | a nudge, not the answer |
| `qlings reset <name>` | discard your edits and start that one over |
| `qlings solution <name>` | print the reference solution |

---

## The curriculum

Aimed at an experienced programmer who is new to q. Terse comments, one idea per
exercise, hints on demand.

**1. `01_core` (24)** — types and atoms, lists, nulls and infinities, atomic
arithmetic, `=` versus `~`, indexing, amend, `where`, sorting and grouping,
search and set operations, strings versus symbols, casting, dictionaries,
lambdas, projection, the adverbs (`each`, `over`, `scan`, each-left/right/prior),
control flow, error trapping, `@`/`.`/`value`, and scope.

**2. `02_tables` (21)** — what a table really is, columns and rows,
`select`/`exec`/`update`/`delete`, computed columns, `by`, sorting, keyed tables,
`upsert`, `lj`/`ij`/`uj`, `xcol`/`xcols`, `meta`, attributes, the functional form
of select, `xgroup`/`ungroup`, the aggregation vocabulary, multi-column grouping,
and how to read q's compact one-line notation.

**3. `03_timeseries` (18)** — temporal types and arithmetic, extracting parts,
`xbar` bucketing, time windows, `prev`/`deltas`, moving and running
aggregations, `fills`, `bin`, OHLC bars, VWAP, `aj`, asof edge cases, `wj`, and
then real storage: splayed tables, a partitioned database, and what changes once
data is on disk.

**4. `04_io` (14)** — namespaces, `.z`, files and paths, text, CSV, q's binary
format, JSON, then IPC: handles, message forms, async sends, remote queries,
remote errors, one-shot connections, and a capstone that reads the on-disk
database, aggregates it, enriches it, and ships the result to another process.

### The curriculum is gotcha-driven

A deliberate share of the exercises exist because the bug bit *me* while
building this, and q gave no useful signal. Those are the ones worth your time:

- A line containing only `/` opens a **block comment** running to the next lone
  `\`. It silently ate the back half of the first three templates I wrote — no
  error, the definitions simply never happened.
- `exp`, `vs`, `sum` and `floor` are reserved. Using one as a parameter name or
  a column name fails with a bare `'match` or `'assign` pointing at the wrong
  thing.
- `.mm` is **minutes** on a time but **month** on a timestamp; `.uu` is minutes
  there. Get it wrong and you bucket a year of data into twelve buckets.
- `aj` and `wj` return *wrong answers rather than errors* if the right-hand
  table is not sorted with `` `p# `` on the matching column.
- Loading a partitioned database **changes your working directory**.
- `exec` on a partitioned table signals `'nyi`; `xkey` on a mapped splayed table
  signals `'type`. Select into memory first.
- Symbol columns from disk are enumerations (20h). They arrive at another
  process as plain symbols (11h), so a round-tripped table will not match what
  you sent.
- `sum` of a boolean list is an **int**, not a long — enough to fail a `~`.
- Casting a float to a long **rounds**; it does not truncate.

---

## Methodology

### Every claim is executed, not remembered

The rule while writing this was that no expected value gets committed unless a q
process produced it. That is enforced by `scripts/check.sh`, which runs the
whole set two ways:

1. every **reference solution** must pass all of its checks,
2. every **template** must fail at least one — otherwise the exercise asks
   nothing of the learner and would silently pass, and
3. no template contains a lone `/` line, which opens a block comment that
   swallows the rest of the file.

That third invariant exists because I shipped exactly that bug into 73 of the 76
templates and did not notice: an inert template fails its checks in precisely
the same way a correct one does, so invariant 2 could not see it. A learner
would have written a correct answer and still been told it was undefined. The
rule now is checked directly rather than inferred from behaviour.

This caught real mistakes repeatedly, and they were nearly always mine rather
than q's: an average I had worked out by hand as 175.75 when it was 163.25, a
time window I called three rows when it held four, a boolean mask written
backwards. Several of the gotchas listed above were discovered exactly this way
— the harness disagreed with me, and the harness was right.

Current state: **77 exercises, 386 checks, all passing.**

### Why Rust for the infrastructure

The exercises are q; nothing about the *content* needs Rust. It earns its place
in the harness:

- **A single binary with no runtime.** Learners install q and Rust once. There
  is no Python version, no virtualenv, no npm tree between them and the
  exercises.
- **Process supervision is the actual work.** Every check spawns a q process
  that might hang, print megabytes, or die. Rust gives non-blocking pipe reads,
  a real timeout that kills the child, and clean handling of the "no output at
  all" case, without shell quoting problems.
- **File watching is a solved problem there.** `notify` handles the
  cross-platform mess and the burst of events editors emit on save.
- **Typed parsing of results.** The harness protocol is JSON; serde turns it
  into a struct, so a malformed run is an error rather than a mis-rendered
  diff.
- **It matches the audience.** Someone working through q exercises is likely
  comfortable with `cargo build`.

The honest alternative was a shell script, and it would have worked. It would
have been worse at exactly the two things that matter when the learner's code is
broken: timing out a runaway, and telling a q syntax error apart from a failed
assertion.

### Why a fresh q process per check

The runner starts one q process per exercise run, rather than holding a
persistent q server and talking to it over IPC.

- **Isolation is free.** Every check starts from a clean interpreter. No globals
  leak between exercises, and there is no "passes only on the second run" class
  of bug.
- **The failure surface is tiny.** Either q is missing, or the script errored.
- **It is debuggable by hand.** The learner can run the exact same command.
- **It is fast enough.** q starts in tens of milliseconds. The heavy chapters
  read a database that `setup` builds once, so nothing is regenerated per run.

The persistent-IPC alternative buys ~1ms per check instead of ~40ms, and costs a
third-party IPC crate or a C FFI, port management, hung-pipe handling, and state
leakage between checks. It was not worth it — but the decision is not baked in.
Execution sits behind a `Runner` trait in `src/runner.rs`, so an IPC
implementation can be dropped in without touching the CLI or the reporter.

### Why templates and exercises are separate directories

`templates/` holds the pristine originals and is the source of truth for
authoring. `exercises/` is your working copy, created on first run and
gitignored. This means `reset` is a file copy rather than a git operation, the
repo has exactly one authored copy of each exercise, and your in-progress work
is never at risk from a `git pull`.

### Why the fixtures are hand-written

`data/fixtures.q` defines the shared `trade`, `quote`, `emp` and `dept` tables
as literals rather than generating them randomly, so every expected value in
every test is stable forever. The tables are deliberately shaped to teach:
`fay` works in a department missing from `dept`, which is what makes `lj` and
`ij` behave differently; the early MSFT trade precedes its first quote, which is
what shows you an asof join filling nulls.

The on-disk database (`data/gen.q` → `data/db`) is generated because it needs to
be a real partitioned kdb database — three date partitions, parted by sym, with
an enumerated splayed reference table — but it is fully deterministic too.

---

## How it works

### The test protocol

Each test file loads the shared harness, loads your exercise by the path in
`$QLINGS_EXERCISE`, runs its assertions, and prints one line of JSON:

```
QLINGS_JSON [{"name":"...","ok":true,"err":"","expected":"...","actual":"..."}]
```

The Rust side takes the last such line and shows everything else your code
printed, untouched. A run that produces no line at all is reported as a fatal
error with q's own message, which is what a syntax error in your file looks
like.

Tables and dictionaries are rendered with `.Q.s`, so a failing table check
shows two readable grids rather than q's one-line internal form; everything
else uses `.Q.s1` and stays inline. That compact form is worth being able to
read anyway, which is what `tbl21_notation` teaches.

A test reads like this:

```q
\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["exec gives a bare list";100 101 102 103f;{applePrices}];
.qlings.done[];
```

The harness gives you:

| function | purpose |
| --- | --- |
| `.qlings.load[]` | load the learner's file, reporting a load failure as a failed check |
| `.qlings.chk[name;expected;f]` | compare `f[]` against `expected` with `~` |
| `.qlings.throws[name;msg;f]` | assert `f[]` signals an error containing `msg` |
| `.qlings.defined[name;sym]` | assert a global exists |
| `.qlings.spawn[startup]` | start a throwaway q server for the IPC exercises |
| `.qlings.done[]` | reap servers, emit the JSON line, exit |

Two details matter. The value under test is passed as a **nullary lambda** so
that a signal raised while computing it is trapped and reported as a failed
check rather than aborting the whole run. And comparisons use `~` (match), not
`=`, so they are strict about type: `1` never matches `1h`, which is usually
the lesson.

### The IPC exercises

Chapter 4 talks to real q processes over real sockets. `.qlings.spawn` starts
one, waits for it to accept a connection, and hands your exercise the port in a
`PORT` variable. Servers are killed by `.qlings.done`, so they are cleaned up
even when your file fails to load and the run ends early.

Two things had to be got right there. Every q process starts with the **same
random seed**, so an unseeded `rand` picks the same port in every run and a
stale server from an earlier run gets connected to instead — the spawn seeds
from `.z.i` and then verifies the process it reached really is the one it just
started, by asking it for its own pid. (And that check compares as longs,
because `.z.i` is an int and `~` is strict.)

---

## Layout

```
start.sh          launcher: build, set up, watch
info.toml         the exercise list, order, descriptions and hints
.qlings-state     which exercises have passed (gitignored)
templates/        pristine exercises -- edit these to author
exercises/        your working copy, created by setup (gitignored)
tests/            the hidden test file for each exercise
tests/harness.q   assertions, the JSON protocol, IPC server management
tests/servers/    startup scripts for the q processes the IPC tests spawn
solutions/        reference answers
data/fixtures.q   shared in-memory tables, hand-written and deterministic
data/gen.q        builds the partitioned database (gitignored output)
src/              the Rust runner
scripts/check.sh  author-side verification of the whole set
scripts/killq.sh  kill q servers left behind by an interrupted run
```

---

## Authoring a new exercise

1. Write `templates/<chapter>/<name>.q` with `TODO`s and stub values. Separate
   comment paragraphs with blank lines, never a lone `/`.
2. Write `solutions/<chapter>/<name>.q`.
3. Write `tests/<chapter>/<name>_test.q`.
4. Add an entry to `info.toml` — `name`, `dir`, `about`, `hint`. Position in the
   file is the order learners meet it.
5. Verify:

```sh
QLINGS_Q=~/.kx/bin/q ./scripts/check.sh <name>   # or omit the name for all 77
```

Do not hand-write an expected value you have not seen a q process produce. Print
it first, then paste it in.
