\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["all GOOG trades";([] time:enlist 09:32:00.000; sym:enlist `GOOG; price:enlist 300f; size:enlist 50i);{goog}];
.qlings.chk["two columns only";([] sym:`MSFT`GOOG; price:201 300f);{dear}];
.qlings.chk["two constraints";([] time:09:31:00.000 09:32:15.000; sym:`AAPL`AAPL; price:102 103f; size:300 400i);{bigApple}];
.qlings.chk["counting the result";4;{appleCount}];
.qlings.done[];
