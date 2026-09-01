\l tests/harness.q
srv:.qlings.spawn"";
PORT:srv`port;
system"l data/db";
.qlings.load[];
.qlings.chk["one day pulled off disk";12;{count day}];
.qlings.chk["and only that day";enlist 2024.01.03;{distinct day`date}];
.qlings.chk["a summary row per sym";3;{count summary}];
.qlings.chk["with the columns asked for";`sym`vwap`cnt;{cols summary}];
.qlings.chk["four trades each";4 4 4;{summary`cnt}];
.qlings.chk["enriched from the reference table";`sym`vwap`cnt`name`lot;{cols joined}];
.qlings.chk["lot sizes joined on";100 1 10;{joined`lot}];
.qlings.chk["the joined syms were still enumerated";20h;{type joined`sym}];
.qlings.chk["the report ships plain symbols";11h;{type report`sym}];
.qlings.chk["including the joined name column";11h;{type report`name}];
.qlings.chk["the server received it";3;{remoteRows}];
.qlings.chk["and it round-tripped intact";1b;{returned~report}];
.qlings.reap srv;
.qlings.done[];
