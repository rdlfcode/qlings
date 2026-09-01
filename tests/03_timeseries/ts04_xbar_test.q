\l data/fixtures.q
\l tests/harness.q
.qlings.load[];
.qlings.chk["xbar rounds down";0 0 5 10;{rounded}];
.qlings.chk["a time is milliseconds, so 60000 is a minute";09:30:00.000 09:31:00.000 09:32:00.000;{minutes}];
.qlings.chk["a minute value buckets in minutes";09:30 09:35 09:40;{fives}];
.qlings.chk["one row per minute that traded";4;{count perMinute}];
.qlings.chk["the bucket column is named and keyed";enlist `bucket;{cols key perMinute}];
.qlings.chk["bucketed averages";1b;{all 0.001>abs ((0!perMinute)`avgPrice)-(401%3;151.5;201.5;199f)}];
.qlings.done[];
