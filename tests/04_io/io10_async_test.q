\l tests/harness.q
srv:.qlings.spawn"tests/servers/mkt.q";
PORT:srv`port;
.qlings.load[];
.qlings.chk["an async send returns the generic null";1b;{sendResult~(::)}];
.qlings.chk["the sync call flushed it";5;{counter}];
.qlings.chk["and the later bumps landed in order";25;{finalCounter}];
.qlings.reap srv;
.qlings.done[];
