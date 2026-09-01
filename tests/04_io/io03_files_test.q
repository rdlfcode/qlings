system"rm -rf data/scratch";
\l tests/harness.q
.qlings.load[];
.qlings.chk["hsym builds a file path symbol";`:data/scratch/hello.txt;{p}];
.qlings.chk["the file is there";1b;{exists}];
.qlings.chk["the directory listing includes it";1b;{`hello.txt in listing}];
.qlings.chk["a missing path gives an empty general list";();{missing}];
.qlings.done[];
