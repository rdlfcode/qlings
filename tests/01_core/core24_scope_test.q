\l tests/harness.q
.qlings.load[];
.qlings.chk["record returns its argument";7;{record 7}];
.qlings.chk[":: wrote through to the global";7;{record 7; total}];
.qlings.chk["shadow returns its local";99;{shadow[]}];
.qlings.chk["the global survived the local";7;{record 7; shadow[]; total}];
.qlings.chk["a function can read a global";15;{addBase 5}];
.qlings.done[];
