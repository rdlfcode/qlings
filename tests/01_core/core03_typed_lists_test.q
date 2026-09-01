\l tests/harness.q
.qlings.load[];
.qlings.chk["simple is 1 2 3";1 2 3;{simple}];
.qlings.chk["a simple long list is type 7h";7h;{simpleType}];
.qlings.chk["mixed holds 1, 2.5 and `a";(1;2.5;`a);{mixed}];
.qlings.chk["a general list is type 0h";0h;{mixedType}];
.qlings.chk["one is a 1-item list, not an atom";enlist 42;{one}];
.qlings.chk["one has count 1";1;{count one}];
.qlings.chk["flat is 1 2 3 4";1 2 3 4;{flat}];
.qlings.done[];
