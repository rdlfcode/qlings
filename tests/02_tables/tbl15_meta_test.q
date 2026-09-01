\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["meta is keyed on the column name";`time`sym`price`size;{names}];
.qlings.chk["type characters";"tsfi";{types}];
.qlings.chk["price is a float column";"f";{priceType}];
.qlings.chk["four columns";4;{width}];
.qlings.done[];
