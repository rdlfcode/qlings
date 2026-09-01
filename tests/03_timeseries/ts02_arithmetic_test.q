\l tests/harness.q
.qlings.load[];
.qlings.chk["adding an integer to a date adds days";2024.03.22;{later}];
.qlings.chk["subtracting dates gives days";14i;{gap}];
.qlings.chk["date plus time is a timestamp";2024.03.15D09:30:00.000000000;{stamped}];
.qlings.chk["timestamps subtract to a timespan";0D00:01:00.000000000;{elapsed}];
.qlings.done[];
