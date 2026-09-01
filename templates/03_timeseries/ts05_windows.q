/ ts05_windows -- selecting a time range

/ A time range is just two constraints, and putting the cheapest first
/ matters: q applies them in order, so narrowing by time before doing
/ anything expensive is the whole game on a large table.
/ `within` says the same thing more compactly.

/ TODO: trades from 09:31:00 up to and including 09:32:15, using two
/       comparisons
ranged:()

/ TODO: the same thing using `within`
windowed:()

/ TODO: the number of trades in the first minute (before 09:31:00.000)
early:0N
