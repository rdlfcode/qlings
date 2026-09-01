\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["running total";1 3 6 10;{totals}];
.qlings.chk["running maximum";1 5 5 8;{peaks}];
.qlings.chk["running minimum";5 3 3 1;{troughs}];
.qlings.chk["cumulative volume";100 300 450 750 1000 1050 1450 1800i;{volume}];
.qlings.chk["and it ends at the total";1800i;{last volume}];
.qlings.done[];
