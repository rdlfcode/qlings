\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["median";151f;{medPrice}];
.qlings.chk["size-weighted average price";1b;{0.001>abs vwap-151.0278}];
.qlings.chk["count distinct";3;{symCount}];
.qlings.chk["first and last";100 199f;{ends}];
.qlings.done[];
