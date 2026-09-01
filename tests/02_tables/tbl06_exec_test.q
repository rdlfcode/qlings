\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["exec gives a bare list";100 101 102 103f;{applePrices}];
.qlings.chk["exec first gives an atom";300f;{googPrice}];
.qlings.chk["exec k!v gives a dictionary";`AAPL`MSFT!103 199f;{symToPrice}];
.qlings.chk["select gives a table instead";([] price:100 101 102 103f);{appleTable}];
.qlings.done[];
