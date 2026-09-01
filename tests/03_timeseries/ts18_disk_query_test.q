\l tests/harness.q
system"l data/db";
.qlings.load[];
.qlings.chk["exec on a partitioned table is not implemented";"nyi";{whatHappens}];
.qlings.chk["selecting first works fine";12;{count prices}];
.qlings.chk["rows come back parted by sym, not by time";120 121.5 123 124.5;{4#prices}];
.qlings.chk["a disk symbol column is an enumeration";20h;{type (0!bySym)`sym}];
.qlings.chk["value gives plain symbols back";`AAPL`GOOG`MSFT;{plainSyms}];
.qlings.chk["averages per sym";1b;{all 0.001>abs ((0!bySym)`avgPrice)-122.25 123.25 122.75}];
.qlings.chk["joined to the reference table";`sym`avgPrice`name`lot;{cols enriched}];
.qlings.chk["lot sizes came from ref";100 1 10;{enriched`lot}];
.qlings.done[];
