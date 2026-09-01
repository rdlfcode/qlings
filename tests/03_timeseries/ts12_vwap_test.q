\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["overall vwap";1b;{0.0001>abs overall-151.0278}];
.qlings.chk["one row per sym";`AAPL`GOOG`MSFT;{(0!bySym)`sym}];
.qlings.chk["vwap per sym";1b;{all 0.001>abs ((0!bySym)`vwap)-(96950%950;300f;159900%800)}];
.qlings.chk["four minute buckets";4;{count byMinute}];
.qlings.done[];
