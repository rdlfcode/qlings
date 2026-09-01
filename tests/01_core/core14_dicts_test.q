\l tests/harness.q
.qlings.load[];
.qlings.chk["the dictionary";`a`b`c!1 2 3;{d}];
.qlings.chk["indexing by key";2;{b}];
.qlings.chk["key";`a`b`c;{ks}];
.qlings.chk["value";1 2 3;{vals}];
.qlings.chk["@ amends a dictionary too";`a`b`c!9 2 3;{updated}];
.qlings.chk["on a clash the right-hand side wins";`a`b`c`e!1 2 30 50;{merged}];
.qlings.chk["d itself is unchanged";`a`b`c!1 2 3;{d}];
.qlings.done[];
