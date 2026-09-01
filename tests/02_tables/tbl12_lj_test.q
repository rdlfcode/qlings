\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["the dept columns came along";`name`dept`salary`start`boss`level;{cols joined}];
.qlings.chk["bosses, with a null where there was no match";`kim`kim`lee`lee`kim`;{bosses}];
.qlings.chk["a left join keeps every left row";6;{rows}];
.qlings.chk["no match means null, not a dropped row";`;{faysBoss}];
.qlings.done[];
