\l tests/harness.q
.qlings.load[];
.qlings.chk["a string is a list of chars";5;{len}];
.qlings.chk["a single char is an ATOM, -10h";-10h;{charType}];
.qlings.chk["string turns a symbol into chars";"abc";{asString}];
.qlings.chk["`$ turns chars into a symbol";`abc;{asSymbol}];
.qlings.chk["upper";"ABC";{shout}];
.qlings.chk["vs splits";("ab";"cd");{parts}];
.qlings.chk["sv joins";"ab,cd";{joined}];
.qlings.chk["like pattern-matches";1b;{matches}];
.qlings.done[];
