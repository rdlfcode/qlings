sq:update `p#sym from `sym`time xasc quote
joined:aj[`sym`time; trade; sq]
unmatched:select from joined where null bid
misses:count unmatched
spread:joined[`ask]-joined`bid
avgSpread:avg spread
patched:update bid:price^bid from joined
