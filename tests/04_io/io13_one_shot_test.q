\l tests/harness.q
srv:.qlings.spawn"tests/servers/mkt.q";
PORT:srv`port;
.qlings.load[];
.qlings.chk["the one-shot string request";4;{quick}];
.qlings.chk["the one-shot list request";102f;{quickList}];
.qlings.chk["a refused connection reports hop";1b;{refusedText like "hop*"}];
.qlings.chk["and it is a string, not a signal that escaped";10h;{type refusedText}];
.qlings.reap srv;
.qlings.done[];
