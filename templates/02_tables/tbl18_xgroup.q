/ tbl18_xgroup -- nesting and unnesting

/ `` `col xgroup t `` keys on col and collapses every other column into a
/ nested list per key. `ungroup` is the inverse: it explodes nested
/ columns back into flat rows. Nested columns are how q stores
/ variable-length things without a second table.

small:select sym,price from trade

/ TODO: small grouped by sym, so price becomes one list per sym
nested:()

/ TODO: AAPL's prices out of the nested table
applePrices:()

/ TODO: flatten nested back out again
flat:()
