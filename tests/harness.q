/ qlings test harness -- loaded by every *_test.q file
/ Protocol: emits one line "QLINGS_JSON <json>" on stdout, then exits 0.
/ The Rust runner parses that line; everything else on stdout is the
/ learner's own output and is shown to them verbatim.

system"c 25 200";

.qlings.results:();

/ Render a value for the diff. Tables and dictionaries go through .Q.s, which
/ draws the readable grid; everything else through .Q.s1, which stays on one
/ line. Long values are truncated so a runaway result cannot flood the report.
.qlings.show:{[x]
  t:type x;
  s:$[t in 98 99h; -1_ .Q.s x; .Q.s1 x];
  $[600<count s;(600#s),"...";s]};

.qlings.add:{[name;ok;err;wanted;got]
  .qlings.results,:enlist `name`ok`err`expected`actual!(name;ok;err;wanted;got); ok};

/ did a protected eval trap? errors are tagged (`qlings_err;msg)
.qlings.trapped:{[r] $[0h<>type r;0b;2<>count r;0b;`qlings_err~first r]};

/ record one check. `f` is a nullary lambda so that a signal raised while
/ computing the actual value is caught rather than aborting the run.
.qlings.chk:{[name;expected;f]
  r:.[{x[]};enlist f;{(`qlings_err;x)}];
  bad:.qlings.trapped r;
  .qlings.add[name;$[bad;0b;expected~r];$[bad;last r;""];
    .qlings.show expected;
    $[bad;"signalled '",last[r];.qlings.show r]]};

/ assert that evaluating `f` signals an error whose text contains `msg`
.qlings.throws:{[name;msg;f]
  r:.[{x[]};enlist f;{(`qlings_err;x)}];
  bad:.qlings.trapped r;
  .qlings.add[name;$[bad;last[r] like "*",msg,"*";0b];"";
    "an error containing \"",msg,"\"";
    $[bad;"signalled '",last[r];"no error; returned ",.qlings.show r]]};

/ assert the learner actually defined a global
.qlings.defined:{[name;sym]
  ok:sym in key `.;
  .qlings.add[name;ok;"";"`",string[sym]," to be defined";
    $[ok;"defined";"undefined -- did you fill it in?"]]};

/ load the learner's exercise file, reporting load failures as a check
.qlings.load:{[]
  p:getenv`QLINGS_EXERCISE;
  r:.[{system"l ",x;`ok};enlist p;{(`qlings_err;x)}];
  if[not r~`ok;
    .qlings.add["load ",p;0b;last r;"the file to load cleanly";
      "signalled '",last r];
    .qlings.done[]];
  };

.qlings.servers:();

.qlings.done:{[]
  .qlings.reap each .qlings.servers;
  -1"QLINGS_JSON ",.j.j .qlings.results;
  exit 0};

/ ---- IPC support, used by the io/ipc chapter -------------------------------
/ Start one server on a specific port. Returns () if the port was already
/ taken by something else -- verified by asking the process for its own
/ pid, so a stale server from an earlier run is never mistaken for ours.
.qlings.spawn1:{[startup;port]
  qbin:$[count e:getenv`QLINGS_Q;e;"q"];
  cmd:qbin," ",startup," -p ",string[port]," -q </dev/null >/dev/null 2>&1 & echo $!";
  pid:"J"$first system cmd;
  h:0N; i:0;
  while[(null h) and i<100;
    i+:1;
    h:@[{hopen `$":localhost:",string x};port;0Ni];
    system"sleep 0.05"];
  if[null h; @[system;"kill -9 ",string pid;::]; :()];
  if[not pid~@[h;"`long$.z.i";0N];
    @[hclose;h;::];
    @[system;"kill -9 ",string pid;::];
    :()];
  `handle`pid`port!(h;pid;port)};

/ Every q process starts with the same random seed, so the generator has
/ to be seeded per process or two runs pick the same port and fight.
.qlings.spawn:{[startup]
  system"S ",string .z.i;
  r:(); i:0;
  while[(()~r) and i<20; i+:1; r:.qlings.spawn1[startup;5000+rand 5000]];
  if[()~r; '"could not start a q server on any port"];
  .qlings.servers,:enlist r;
  r};

.qlings.reap:{[s] @[hclose;s`handle;::]; @[system;"kill -9 ",string s`pid;::]; };
