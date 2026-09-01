\l tests/harness.q
system"l data/db";
.qlings.load[];
.qlings.chk["three partitions";2024.01.02 2024.01.03 2024.01.04;{dates}];
.qlings.chk["one day's trades";12;{count oneDay}];
.qlings.chk["and the date column comes along";enlist 2024.01.03;{distinct oneDay`date}];
.qlings.chk["rows per date";12 12 12;{(0!perDate)`cnt}];
.qlings.chk["GOOG prices on the second";101 102.5 104 105.5;{googPrices}];
.qlings.done[];
