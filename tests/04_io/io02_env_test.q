\l tests/harness.q
.qlings.load[];
.qlings.chk["a date came back";-14h;{type today}];
.qlings.chk[".z.p is a timestamp";-12h;{stampType}];
.qlings.chk["the environment variable was read";1b;{0<count myPath}];
.qlings.chk["and it is a string, not a symbol";10h;{type myPath}];
.qlings.chk["ending in .q";1b;{looksRight}];
.qlings.done[];
