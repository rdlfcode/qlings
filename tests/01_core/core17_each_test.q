\l tests/harness.q
.qlings.load[];
.qlings.chk["count each";2 3 2;{lengths}];
.qlings.chk["reverse each";("ba";"edc";"gf");{flipped}];
.qlings.chk["first each gives a char list";"acf";{initials}];
.qlings.chk["arithmetic needs no each";2 4 6;{doubled}];
.qlings.done[];
