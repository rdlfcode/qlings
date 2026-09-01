/ ts12_vwap -- volume weighted average price
/
/ VWAP is the size-weighted average of price: `size wavg price`, with the
/ weights on the LEFT. It is the standard way to summarise a period's
/ trading, and it drops straight into a by-clause.
/
/ I AM NOT DONE

/ TODO: the overall VWAP of every trade
overall:0n

/ TODO: VWAP per sym, in a column called vwap
bySym:()

/ TODO: VWAP per one-minute bucket, in a column called vwap,
/       keyed on a column called bucket
byMinute:()
