\l tests/harness.q
.qlings.load[];
.qlings.chk["10 added to each item";11 12 13;{shifted}];
.qlings.chk["lists multiply item by item";4 10 18;{paired}];
.qlings.chk["% divides, giving a float";2.5;{quotient}];
.qlings.chk["div gives whole times";3;{whole}];
.qlings.chk["mod gives the remainder";1;{rest}];
.qlings.chk["sum";10;{total}];
.qlings.chk["avg";2.5;{mean}];
.qlings.chk["max";9;{biggest}];
.qlings.done[];
