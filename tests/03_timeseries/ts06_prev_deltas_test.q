\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["prev pads with a null";0N 10 12 15;{before}];
.qlings.chk["next pads at the other end";12 15 11 0N;{after}];
.qlings.chk["deltas keeps the first item as-is";10 2 3 -4;{changes}];
.qlings.chk["dropping the bogus first delta";1 1 1f;{appleMoves}];
.qlings.done[];
