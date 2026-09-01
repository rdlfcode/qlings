/ tbl19_aggregates -- the aggregation vocabulary
/
/ Beyond sum/avg/min/max q gives you `med`, `dev`, `var`, `wavg` (weighted
/ average) and `count distinct`. In a select they collapse each group to
/ one value; outside one they work on any list.
/
/ I AM NOT DONE

/ TODO: the median price across all trades
medPrice:0n

/ TODO: the size-weighted average price (weights on the LEFT of wavg)
vwap:0n

/ TODO: how many distinct syms are traded?
symCount:0N

/ TODO: the first and last price, as a two-item list
ends:()
