\l tests/harness.q
.qlings.load[];
.qlings.chk["the date";2024.03.15;{d}];
.qlings.chk["the time";09:30:15.250;{t}];
.qlings.chk["the timestamp";2024.03.15D09:30:15.250000000;{ts}];
.qlings.chk["a date atom is -14h";-14h;{dateType}];
.qlings.chk["a timestamp atom is -12h";-12h;{tsType}];
.qlings.chk["dates count days from 2000.01.01";8840;{asLong}];
.qlings.done[];
