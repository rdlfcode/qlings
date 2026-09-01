\l tests/harness.q
.qlings.load[];
.qlings.chk["index 0 replaced";99 200 300 400 500;{replaced}];
.qlings.chk["5 added at index 1";100 205 300 400 500;{bumped}];
.qlings.chk["two indexes at once";0 200 300 400 0;{zeroed}];
.qlings.chk["every item doubled";200 400 600 800 1000;{doubled}];
.qlings.chk["the original list is unchanged";100 200 300 400 500;{untouched}];
.qlings.done[];
