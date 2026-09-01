\l tests/harness.q
.qlings.load[];
.qlings.chk["the last item at or before 09:37";1;{slot}];
.qlings.chk["bin is atomic on the right";0 1 2;{slots}];
.qlings.chk["before everything gives -1";-1;{tooEarly}];
.qlings.chk["indexing back gives the prevailing value";09:30 09:35 09:40;{picked}];
.qlings.done[];
