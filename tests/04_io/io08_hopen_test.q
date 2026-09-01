\l tests/harness.q
srv:.qlings.spawn"";
PORT:srv`port;
.qlings.load[];
.qlings.chk["a handle is a positive integer";1b;{isHandle}];
.qlings.chk["the remote evaluated the string";4;{total}];
.qlings.chk["and it really is another process";0b;{remotePid=.z.i}];
.qlings.chk["the handle still works";7;{h"3+4"}];
.qlings.reap srv;
.qlings.done[];
