\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["one row per sym";3;{count nested}];
.qlings.chk["price is now a list per sym";100 101 102 103f;{applePrices}];
.qlings.chk["ungroup flattens it back";8;{count flat}];
.qlings.chk["ungroup regroups the rows by sym";`AAPL`AAPL`AAPL`AAPL`MSFT`MSFT`MSFT`GOOG;{flat`sym}];
.qlings.done[];
