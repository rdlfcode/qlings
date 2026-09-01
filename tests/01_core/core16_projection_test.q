\l tests/harness.q
.qlings.load[];
.qlings.chk["add10 5";15;{add10 5}];
.qlings.chk["minus1 fixes the RIGHT argument";9;{minus1 10}];
.qlings.chk["a projection is atomic too";11 12 13;{shifted}];
.qlings.chk["value evaluates q source";5;{evaluated}];
.qlings.done[];
