/ ts15_wj -- the window join

/ Where aj takes the ONE prevailing row, `wj` aggregates every row inside
/ a window around each trade:
/   wj[(starts;ends); cols; t; (q;(agg;`col);...)]
/ The windows are two lists, the same length as t. wj also folds in the
/ prevailing row at the window start, so a window with no rows of its own
/ still sees the last known value.

/ When a window really is empty, min and max return their identities --
/ 0w and -0w -- rather than nulls.

sq:update `p#sym from `sym`time xasc quote

/ TODO: for each trade, the lowest bid and highest ask over the 30
/       seconds up to and including the trade
windowed:()

/ TODO: the bid column of the result
lows:()
