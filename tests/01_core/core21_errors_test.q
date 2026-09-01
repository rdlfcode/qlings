\l tests/harness.q
.qlings.load[];
.qlings.chk["checked passes a positive through";5;{checked 5}];
.qlings.throws["checked signals on a negative";"negative";{checked -1}];
.qlings.chk["the handler receives the error text";"negative";{caught}];
.qlings.chk["the handler is skipped when nothing fails";5;{fine}];
.qlings.chk[". traps a multi-argument call";`oops;{divided}];
.qlings.done[];
