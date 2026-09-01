sq:update `p#sym from `sym`time xasc quote
windowed:wj[(trade.time-00:00:30.000;trade.time); `sym`time; trade; (sq;(min;`bid);(max;`ask))]
lows:windowed`bid
