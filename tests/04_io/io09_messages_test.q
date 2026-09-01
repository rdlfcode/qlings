\l tests/harness.q
srv:.qlings.spawn"tests/servers/mkt.q";
PORT:srv`port;
.qlings.load[];
.qlings.chk["the string form works";102f;{viaString}];
.qlings.chk["so does the list form";102f;{viaList}];
.qlings.chk["and they agree";1b;{viaString~viaList}];
.qlings.chk["a no-argument call";`AAPL`GOOG`MSFT;{(0!vwaps)`sym}];
.qlings.chk["a lambda sent over the wire";5;{remoteCount}];
.qlings.reap srv;
.qlings.done[];
