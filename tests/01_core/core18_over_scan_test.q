\l tests/harness.q
.qlings.load[];
.qlings.chk["+ over folds to a total";10;{total}];
.qlings.chk["+ scan keeps the intermediates";1 3 6 10;{running}];
.qlings.chk["* over";24;{product}];
.qlings.chk["a seed starts the fold";110;{seeded}];
.qlings.chk["running maximum";3 3 4 4 5;{peaks}];
.qlings.done[];
