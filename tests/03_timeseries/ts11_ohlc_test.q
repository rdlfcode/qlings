\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["four one-minute bars";4;{n}];
.qlings.chk["the bar columns";`open`high`low`close;{cols value bars}];
.qlings.chk["opens";100 102 300 199f;{(0!bars)`open}];
.qlings.chk["highs";200 201 300 199f;{(0!bars)`high}];
.qlings.chk["lows";100 102 103 199f;{(0!bars)`low}];
.qlings.chk["closes";101 201 103 199f;{(0!bars)`close}];
.qlings.chk["the final close";199f;{lastClose}];
.qlings.done[];
