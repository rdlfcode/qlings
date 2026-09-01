rounded:5 xbar 0 3 7 11
times:09:30:15.000 09:31:45.000 09:32:05.000
minutes:60000 xbar times
fives:5 xbar 09:31 09:37 09:42
perMinute:select avgPrice:avg price by bucket:60000 xbar time from trade
