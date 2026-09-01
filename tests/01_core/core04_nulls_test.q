\l tests/harness.q
.qlings.load[];
.qlings.chk["nothing is the null long";0N;{nothing}];
.qlings.chk["null detects it";1b;{isNothing}];
.qlings.chk["^ fills nulls with 0";0 2 0 4;{filled}];
.qlings.chk["huge is 0W";0W;{huge}];
.qlings.chk["sum skips nulls, giving 4";4;{total}];
.qlings.chk["the empty symbol is null";1b;{symIsNull}];
.qlings.done[];
