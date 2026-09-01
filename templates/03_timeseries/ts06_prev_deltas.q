/ ts06_prev_deltas -- looking at the row before

/ `prev` shifts a list forward and `next` back, padding with a null.
/ `deltas` is the difference from the previous item and `ratios` the
/ quotient -- both keep the FIRST item as-is, which is why a returns
/ series always starts with a bogus first value you drop.

xs:10 12 15 11

/ TODO: each item's predecessor
before:()

/ TODO: each item's successor
after:()

/ TODO: the change from one item to the next
changes:()

/ TODO: the price changes of the AAPL trades, dropping the first
/       (bogus) value
appleMoves:()
