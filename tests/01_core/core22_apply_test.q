\l tests/harness.q
.qlings.load[];
.qlings.chk["@ applies to one argument";-5;{negated}];
.qlings.chk[". applies to an argument list";5;{added}];
.qlings.chk["a call is just a list";(+;2;3);{call}];
.qlings.chk["value runs it";5;{ran}];
.qlings.chk["a list of functions, each applied";6 3 1;{results}];
.qlings.done[];
