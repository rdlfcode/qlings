/ tbl07_update -- update, and update by

/ `update` returns a NEW table with columns changed or added; the
/ original is untouched unless you assign back over it. A `where` limits
/ which rows change, and a `by` computes the new value per group -- which
/ is how you write things like "price relative to this sym's average".

/ TODO: trade with a new column notional = price*size
withNotional:()

/ TODO: trade with GOOG prices doubled, other rows untouched
doubledGoog:()

/ TODO: trade with a column avgPrice holding the average price
/       OF THAT ROW'S SYM (use update ... by)
withSymAvg:()

/ TODO: confirm the original is unchanged -- how many columns does
/       `trade` still have?
originalCols:0N
