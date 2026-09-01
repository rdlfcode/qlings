\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["all three renamed";`who`team`pay;{cols renamed}];
.qlings.chk["the data is unchanged";`ann`bob`cara`dan`eve`fay;{renamed`who}];
.qlings.chk["xcols promotes to the front";`salary`name`dept;{cols reordered}];
.qlings.chk["xcol renames positionally";`who`dept`salary;{cols firstOnly}];
.qlings.done[];
