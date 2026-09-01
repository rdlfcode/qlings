\l tests/harness.q
.qlings.load[];
.qlings.chk["= compares item by item";110b;{elementwise}];
.qlings.chk["~ gives one boolean";1b;{same}];
.qlings.chk["~ is strict about type";0b;{strict}];
.qlings.chk["= ignores numeric type";1b;{loose}];
.qlings.chk["~ recurses into nested lists";1b;{nested}];
.qlings.chk["a symbol never matches a char";0b;{crossType}];
.qlings.done[];
