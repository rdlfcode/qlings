\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["matches the qSQL it replaces";1b;{googs~select from trade where sym=`GOOG}];
.qlings.chk["a column dictionary selects and names";1b;{twoCols~select sym,price from trade where size>200}];
.qlings.chk["a by dictionary groups";1b;{grouped~select avgPrice:avg price by sym from trade}];
.qlings.chk["and the grouped result really is keyed";99h;{type grouped}];
.qlings.done[];
