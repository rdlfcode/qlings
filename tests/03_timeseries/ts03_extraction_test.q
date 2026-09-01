\l tests/harness.q
.qlings.load[];
.qlings.chk["`date$ narrows a timestamp";2024.03.15;{theDate}];
.qlings.chk["`time$ keeps the clock part";14:45:30.500;{theTime}];
.qlings.chk["the hour, as an int";14i;{hour}];
.qlings.chk["minutes on a timestamp is .uu";45i;{minute}];
.qlings.chk["and .mm is the MONTH there";3i;{monthNo}];
.qlings.chk["on a plain time, .mm really is minutes";45i;{theTime.mm}];
.qlings.chk["the month value";2024.03m;{month}];
.qlings.done[];
