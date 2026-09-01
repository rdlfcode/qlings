\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the key has both grouping columns";`sym`big;{cols key counts}];
.qlings.chk["five distinct combinations";5;{groups}];
.qlings.chk["the counts themselves";2 2 1 1 2;{(0!counts)`cnt}];
.qlings.chk["filtering before grouping";([sym:`AAPL`MSFT] avgPrice:101.5 200f);{twoSyms}];
.qlings.done[];
