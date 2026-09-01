\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["a column is a list";100 200 101 102 201 300 103 199f;{prices}];
.qlings.chk["a row is a dictionary";`time`sym`price`size!(09:30:00.000;`AAPL;100f;100i);{firstRow}];
.qlings.chk["indexing the row dictionary";`AAPL;{firstSym}];
.qlings.chk["count";8;{n}];
.qlings.chk["avg of a column";163.25;{meanPrice}];
.qlings.done[];
