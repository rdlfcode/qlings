\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["only the GOOG row survives";enlist `GOOG;{onlyGoog`sym}];
.qlings.chk["the size column is gone";`time`sym`price;{cols noSize}];
.qlings.chk["cheap rows removed";200 201 300 199f;{expensive`price}];
.qlings.chk["and the row count";4;{count expensive}];
.qlings.done[];
