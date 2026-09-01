system"rm -rf data/scratch";
\l tests/harness.q
.qlings.load[];
.qlings.chk["the header line comes first";"a,b";{first csvLines}];
.qlings.chk["one line per row after it";("1,x";"2,y");{1_csvLines}];
.qlings.chk["the file round-trips into a table";1b;{loaded~src}];
.qlings.chk["with the types you asked for";"js";{exec t from meta loaded}];
.qlings.done[];
