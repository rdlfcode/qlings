/ ts14_aj_gaps -- what asof does at the edges

/ An asof join never invents data. If nothing has been seen yet for that
/ sym, the joined columns come back NULL -- and because a null float is
/ 0n, an unwary sum or avg over the result will quietly skip those rows
/ rather than warn you.

/ The MSFT trade at 09:30:05 happens before the first MSFT quote, so it
/ is the row that shows this.

sq:update `p#sym from `sym`time xasc quote
joined:aj[`sym`time; trade; sq]

/ TODO: the rows of `joined` whose bid is null
unmatched:()

/ TODO: how many rows failed to match?
misses:0N

/ TODO: the spread (ask minus bid) for every row -- what happens to the
/       unmatched one?
spread:()

/ TODO: the average spread, with the null row excluded by q itself
avgSpread:0n

/ TODO: the same join with the unmatched bid filled from the trade price
patched:()
