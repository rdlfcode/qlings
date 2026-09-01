\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the early items average over what exists so far";1 1.5 2 3 4f;{ma}];
.qlings.chk["moving sum";1 3 6 9 12;{ms}];
.qlings.chk["moving max";1 5 5 8;{mx}];
.qlings.chk["the result is as long as the input";4;{count appleMa}];
.qlings.chk["moving average of the AAPL prices";100 100.5 101 102f;{appleMa}];
.qlings.done[];
