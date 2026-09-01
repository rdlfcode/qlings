\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["an inner join drops unmatched rows";5;{kept}];
.qlings.chk["fay is the one that went";enlist `fay;{dropped}];
.qlings.chk["uj widens to both column sets";`name`salary`extra;{cols unioned}];
.qlings.chk["and stacks the rows";7;{count unioned}];
.qlings.chk["gaps are filled with nulls";0N 0N 0N 0N 0N 0N 1;{unioned`extra}];
.qlings.done[];
