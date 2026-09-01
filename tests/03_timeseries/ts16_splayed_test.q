system"rm -rf data/scratch";
\l tests/harness.q
.qlings.load[];
.qlings.chk["a single file round-trips exactly";1b;{readBack~nums}];
.qlings.chk["a mapped table holds the same values";1b;{(mapped`a)~nums`a}];
.qlings.chk["but is not the identical object";0b;{mapped~nums}];
.qlings.chk["select from materialises it";1b;{materialised~nums}];
.qlings.chk["one file per column, plus the .d order file";`.d`a`b;{asc files}];
.qlings.done[];
