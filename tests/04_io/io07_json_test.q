\l tests/harness.q
.qlings.load[];
.qlings.chk["the JSON text";"{\"a\":[1,2],\"b\":\"hello\"}";{text}];
.qlings.chk["numbers come back as floats";9h;{type parsed`a}];
.qlings.chk["symbols come back as strings";10h;{type parsed`b}];
.qlings.chk["casting the numbers back";1 2;{asLongs}];
.qlings.chk["casting the symbol back";`hello;{asSymbol}];
.qlings.done[];
