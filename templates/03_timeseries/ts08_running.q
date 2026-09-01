/ ts08_running -- running totals

/ Where the m- functions look back a fixed number of items, `sums`,
/ `maxs`, `mins` and `prds` accumulate over EVERYTHING seen so far.
/ They are just scan (\) over the matching operator, so they cost one
/ pass and no memory.

xs:1 2 3 4

/ TODO: the running total of xs
totals:()

/ TODO: the running maximum of 1 5 2 8
peaks:()

/ TODO: the running minimum of 5 3 4 1
troughs:()

/ TODO: the cumulative traded size, trade by trade
volume:()
