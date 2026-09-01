\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["a computed column";([] notional:10000 40000 15150 30600 50250 15000 41200 69650f);{notional}];
.qlings.chk["a boolean column";([] sym:`AAPL`MSFT`AAPL`AAPL`MSFT`GOOG`AAPL`MSFT; big:00011011b);{flagged}];
.qlings.chk["i is the row index";2;{count firstTwo}];
.qlings.chk["and it kept the first two rows";09:30:00.000 09:30:05.000;{firstTwo`time}];
.qlings.done[];
