\l tests/harness.q
srv:.qlings.spawn"tests/servers/mkt.q";
PORT:srv`port;
.qlings.load[];
.qlings.chk["the table arrived intact";`sym`size`price;{cols whole}];
.qlings.chk["all five rows";5;{wholeRows}];
.qlings.chk["the aggregate is keyed by sym";`AAPL`GOOG`MSFT;{(0!counts)`sym}];
.qlings.chk["and the counts are right";2 1 2;{(0!counts)`cnt}];
.qlings.chk["aggregating on the server ships less";1b;{countsRows<wholeRows}];
.qlings.reap srv;
.qlings.done[];
