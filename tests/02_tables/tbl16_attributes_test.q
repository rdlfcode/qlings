\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the sorted attribute";`s;{sortedAttr}];
.qlings.chk["an attribute does not change the value";1b;{sorted~1 2 3}];
.qlings.chk["the unique attribute";`u;{attr uniq}];
.qlings.chk["a plain list has the null attribute";`;{plainAttr}];
.qlings.chk["xasc leaves `s on the sort column";`s;{symAttr}];
.qlings.done[];
