\l tests/harness.q
.qlings.load[];
.qlings.chk["answer is the long 42";42;{answer}];
.qlings.chk["ratio is the float 2.5";2.5;{ratio}];
.qlings.chk["name is the symbol `kdb";`kdb;{name}];
.qlings.chk["flag is true";1b;{flag}];
.qlings.chk["answerType is -7h (a long ATOM)";-7h;{answerType}];
.qlings.done[];
