\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["four trades in the range";4;{count ranged}];
.qlings.chk["within says the same thing";1b;{ranged~windowed}];
.qlings.chk["and within is inclusive at both ends";09:31:00.000 09:31:30.000 09:32:00.000 09:32:15.000;{windowed`time}];
.qlings.chk["three trades before 09:31";3;{early}];
.qlings.done[];
