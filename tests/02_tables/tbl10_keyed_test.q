\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the key column moved into the key";enlist `name;{cols key byName}];
.qlings.chk["lookup gives a row dictionary";`dept`salary`start!(`eng;110;2020.03.01);{bob}];
.qlings.chk["and you can index into it";110;{bobSalary}];
.qlings.chk["0! unkeys";`name`dept`salary`start;{cols plain}];
.qlings.chk["unkeying round-trips";1b;{plain~emp}];
.qlings.chk["a keyed table is type 99h";99h;{keyedType}];
.qlings.done[];
