\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the quote table is sorted by sym then time";`AAPL`AAPL`AAPL`GOOG`MSFT`MSFT;{sq`sym}];
.qlings.chk["and carries the parted attribute";`p;{attr sq`sym}];
.qlings.chk["every trade survives an aj";8;{count joined}];
.qlings.chk["the quote columns came along";`time`sym`price`size`bid`ask;{cols joined}];
.qlings.chk["the prevailing bids";99.5 0n 100.5 101.5 199.5 299.5 101.5 198.5;{bids}];
.qlings.done[];
