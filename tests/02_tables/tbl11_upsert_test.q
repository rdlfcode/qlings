\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["bob's salary was replaced, not appended";6;{count raised}];
.qlings.chk["and it is the new value";999;{raised[`bob;`salary]}];
.qlings.chk["a new key appends";7;{count hired}];
.qlings.chk["zed is there";50;{hired[`zed;`salary]}];
.qlings.chk["unkeyed upsert just appends";7;{count appended}];
.qlings.chk["appending left the original alone";6;{count emp}];
.qlings.done[];
