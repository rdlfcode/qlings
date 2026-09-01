\l tests/harness.q
.qlings.load[];
.qlings.chk["asc";10 20 30;{sorted}];
.qlings.chk["desc";30 20 10;{backwards}];
.qlings.chk["iasc gives indexes, not values";1 2 0;{order}];
.qlings.chk["distinct";1 2 3;{uniq}];
.qlings.chk["group maps value -> indexes";`a`b`c!(0 2;enlist 1;enlist 3);{groups}];
.qlings.done[];
