\l tests/harness.q
.qlings.load[];
.qlings.chk["the comparison mask";00111b;{mask}];
.qlings.chk["where gives indexes";2 3 4;{idx}];
.qlings.chk["filtering with where";300 400 500;{big}];
.qlings.chk["summing booleans gives an int";3i;{howMany}];
.qlings.chk["any";1b;{anyHuge}];
.qlings.chk["all";1b;{allPositive}];
.qlings.done[];
