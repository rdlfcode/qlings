\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["one row out per trade in";8;{count windowed}];
.qlings.chk["the aggregated bids";99.5 0w 99.5 100.5 199.5 299.5 101.5 198.5;{lows}];
.qlings.chk["an empty window gives min's identity, not a null";0w;{lows 1}];
.qlings.chk["which is NOT null -- a real trap";0b;{null lows 1}];
.qlings.done[];
