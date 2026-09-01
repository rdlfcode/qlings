\l tests/harness.q
.qlings.load[];
.qlings.chk["the compact form of a table";"+`a`b!(1 2;3 4)";{compact}];
.qlings.chk["and of a keyed table";"(+(,`s)!,`x`y)!+(,`v)!,1 2";{compactKeyed}];
.qlings.chk["+ in that notation is flip";1b;{rebuilt~t}];
.qlings.chk[", is enlist";1b;{one~enlist 42}];
.qlings.chk["one item, not an atom";1;{count one}];
.qlings.chk["the compact form does not parse back";enlist "+";{cannotParse}];
.qlings.chk["but the binary form round-trips";1b;{roundTripped~t}];
.qlings.done[];
