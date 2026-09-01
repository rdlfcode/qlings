system"rm -rf data/scratch";
\l tests/harness.q
.qlings.load[];
.qlings.chk["serialising gives a byte vector";4h;{byteType}];
.qlings.chk["and it round-trips exactly";1b;{restored~original}];
.qlings.chk["a file round-trips too";1b;{fromDisk~original}];
.qlings.chk["the bytes are not empty";1b;{10<count bytes}];
.qlings.done[];
