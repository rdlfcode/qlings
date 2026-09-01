/ ts09_fills -- carrying values forward
/
/ Real market data is sparse: a row exists only when something changed.
/ `fills` carries the last non-null value forward, which is how you turn
/ "the price when it moved" into "the price at every moment".
/ A leading null has nothing to carry, so it stays null -- use `^` with a
/ starting value if that matters.
/
/ I AM NOT DONE

sparse:1 0N 0N 4 0N

/ TODO: carry the last known value forward through sparse
carried:()

/ TODO: a leading null cannot be carried -- fill THIS one forward and
/       see what survives
leading:0N 2 0N 3
carriedLeading:()

/ TODO: fill any remaining nulls in carriedLeading with 0
zeroed:()
