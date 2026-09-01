system"rm -rf data/scratch";
\l tests/harness.q
.qlings.load[];
.qlings.chk["the lines came back";("alpha";"beta";"gamma");{lines}];
.qlings.chk["each line is a string";10h;{type first lines}];
.qlings.chk["three of them";3;{n}];
.qlings.chk["filtering the lines";enlist "alpha";{vowels}];
.qlings.done[];
