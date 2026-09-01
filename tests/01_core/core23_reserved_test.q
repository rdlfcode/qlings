\l tests/harness.q
.qlings.load[];
.qlings.chk["the renamed parameter works";10;{scale 5}];
.qlings.chk["the column was renamed";`name`level;{cols building}];
.qlings.chk["nothing was swallowed by a block comment";1b;{survived}];
.qlings.done[];
