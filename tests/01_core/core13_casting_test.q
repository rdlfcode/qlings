\l tests/harness.q
.qlings.load[];
.qlings.chk["casting a float to a long ROUNDS";3;{rounded}];
.qlings.chk["`int$ gives an int";5i;{asInt}];
.qlings.chk["\"J\"$ parses a long";42;{parsed}];
.qlings.chk["\"D\"$ parses a date";2024.01.15;{theDate}];
.qlings.chk["9h is the float type code";3f;{asFloat}];
.qlings.done[];
