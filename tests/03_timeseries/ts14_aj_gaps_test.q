\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["one trade had no prior quote";1;{misses}];
.qlings.chk["and it is the early MSFT trade";09:30:05.000;{first unmatched`time}];
.qlings.chk["arithmetic on a null gives a null";1b;{null spread 1}];
.qlings.chk["avg silently skips it";1b;{0.0001>abs avgSpread-1.0}];
.qlings.chk["^ fills the gap from another column";200f;{patched[`bid] 1}];
.qlings.done[];
