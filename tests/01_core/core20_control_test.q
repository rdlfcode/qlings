\l tests/harness.q
.qlings.load[];
.qlings.chk["$[ ] picks a branch";`yes;{verdict}];
.qlings.chk["?[ ] picks item by item";`odd`even`odd`even;{parities}];
.qlings.chk["while accumulated 0+1+2+3+4";10;{looped}];
.qlings.chk["do[3;...] doubled three times";8;{acc}];
.qlings.done[];
