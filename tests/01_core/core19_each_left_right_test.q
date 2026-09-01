\l tests/harness.q
.qlings.load[];
.qlings.chk["each-left";110b;{membership}];
.qlings.chk["each-right";(1 2 3;1 2 4);{appended}];
.qlings.chk["each-both";11 22 33;{pairwise}];
.qlings.chk["each-prior keeps the first item as-is";1 2 3 4;{gaps}];
.qlings.done[];
