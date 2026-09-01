\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["ascending by price";100 101 102 103 199 200 201 300f;{byPrice`price}];
.qlings.chk["descending by price";300 201 200 199 103 102 101 100f;{byPriceDesc`price}];
.qlings.chk["sym is the primary key of the sort";`AAPL`AAPL`AAPL`AAPL`GOOG`MSFT`MSFT`MSFT;{bySymThenPrice`sym}];
.qlings.chk["and price sorts within each sym";100 101 102 103 300 199 200 201f;{bySymThenPrice`price}];
.qlings.done[];
