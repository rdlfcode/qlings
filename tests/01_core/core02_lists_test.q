\l tests/harness.q
.qlings.load[];
.qlings.chk["xs is 10 20 30";10 20 30;{xs}];
.qlings.chk["n is the count of xs";3;{n}];
.qlings.chk["lo is the first item";10;{lo}];
.qlings.chk["hi is the last item";30;{hi}];
.qlings.chk["grown appends 40";10 20 30 40;{grown}];
.qlings.chk["flipped reverses xs";30 20 10;{flipped}];
.qlings.chk["counted is til 5";0 1 2 3 4;{counted}];
.qlings.done[];
