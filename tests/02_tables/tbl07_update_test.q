\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["a new column was added";`time`sym`price`size`notional;{cols withNotional}];
.qlings.chk["and it holds price*size";10000 40000 15150 30600 50250 15000 41200 69650f;{withNotional`notional}];
.qlings.chk["only GOOG changed";100 200 101 102 201 600 103 199f;{doubledGoog`price}];
.qlings.chk["update by broadcasts the group average back over rows";101.5 200 101.5 101.5 200 300 101.5 200f;{withSymAvg`avgPrice}];
.qlings.chk["the original table is untouched";4;{originalCols}];
.qlings.done[];
