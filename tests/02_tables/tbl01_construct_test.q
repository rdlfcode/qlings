\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the table literal";([] a:1 2 3; b:`x`y`z);{t}];
.qlings.chk["flip of a column dictionary is the same table";1b;{t~t2}];
.qlings.chk["count counts rows";3;{rows}];
.qlings.chk["cols";`a`b;{names}];
.qlings.chk["a table is type 98h";98h;{tableType}];
.qlings.done[];
