/ ts04_xbar -- bucketing with xbar

/ `n xbar x` rounds every item of x DOWN to a multiple of n. That one
/ operator is how all time bucketing works in q: because a time is
/ milliseconds, 60000 xbar time gives minute buckets, and because a
/ minute is minutes, 5 xbar minutes gives five-minute buckets.

/ TODO: round 0 3 7 11 down to multiples of 5
rounded:()

/ TODO: bucket these times into whole minutes
times:09:30:15.000 09:31:45.000 09:32:05.000
minutes:()

/ TODO: bucket 09:31 09:37 09:42 into five-minute buckets
fives:()

/ TODO: the average trade price per minute bucket, in a column avgPrice,
/       keyed on a column called bucket (the `trade` table is provided)
perMinute:()
