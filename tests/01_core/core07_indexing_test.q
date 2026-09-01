\l tests/harness.q
.qlings.load[];
.qlings.chk["xs 0";100;{head}];
.qlings.chk["indexing with a list";200 400;{picked}];
.qlings.chk["xs til 3";100 200 300;{firstThree}];
.qlings.chk["out of range gives a null, not an error";0N;{missing}];
.qlings.chk["-2# takes from the back";400 500;{tail}];
.qlings.chk["2_ drops from the front";300 400 500;{rest}];
.qlings.done[];
