\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["average per sym, keyed by sym";([sym:`AAPL`GOOG`MSFT] avgPrice:101.5 300 200f);{avgBySym}];
.qlings.chk["two aggregations at once";([sym:`AAPL`GOOG`MSFT] cnt:4 1 3; totalSize:950 50 800i);{statsBySym}];
.qlings.chk["no aggregation gives nested lists";([sym:`AAPL`GOOG`MSFT] prices:(100 101 102 103f;enlist 300f;200 201 199f));{nested}];
.qlings.chk["a by result is keyed, type 99h";99h;{type avgBySym}];
.qlings.done[];
