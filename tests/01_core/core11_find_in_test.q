\l tests/harness.q
.qlings.load[];
.qlings.chk["? finds the index";1;{at}];
.qlings.chk["a miss gives the count of the list";3;{notThere}];
.qlings.chk["in";1b;{present}];
.qlings.chk["in is atomic on the left";10b;{which}];
.qlings.chk["except";1 3;{without}];
.qlings.chk["inter";2 3;{common}];
.qlings.done[];
