/ ts11_ohlc -- building bars

/ The classic kdb one-liner: group by a time bucket and take first, max,
/ min and last of the price. `first` and `last` respect the order of the
/ rows, so the table must be sorted by time for the open and close to
/ mean anything.

/ TODO: one-minute OHLC bars from `trade`, with columns
/       open, high, low and close, keyed on a column called bucket
bars:()

/ TODO: how many bars came out?
n:0N

/ TODO: the close of the last bar
lastClose:0n
