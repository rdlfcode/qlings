\l tests/harness.q
.qlings.load[];
.qlings.chk["the last value is carried forward";1 1 1 4 4;{carried}];
.qlings.chk["a leading null survives fills";0N 2 2 3;{carriedLeading}];
.qlings.chk["^ mops up what is left";0 2 2 3;{zeroed}];
.qlings.done[];
