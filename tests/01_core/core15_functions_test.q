\l tests/harness.q
.qlings.load[];
.qlings.chk["double 21";42;{double 21}];
.qlings.chk["double is atomic over a list for free";2 4 6;{double 1 2 3}];
.qlings.chk["larger picks x";9;{larger[9;2]}];
.qlings.chk["larger picks y";9;{larger[2;9]}];
.qlings.chk["times uses named parameters";12;{times[3;4]}];
.qlings.chk["square 5";25;{square 5}];
.qlings.chk["square returns 0 early when negative";0;{square -3}];
.qlings.done[];
