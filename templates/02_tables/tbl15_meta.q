/ tbl15_meta -- inspecting a table

/ `meta t` returns a keyed table describing each column: `t` is the type
/ as a CHAR (j long, f float, s symbol, i int, t time), `f` any foreign
/ key, and `a` the attribute. It is the first thing to run against a
/ table you have never seen.

m:meta trade

/ TODO: the column names, taken from meta rather than `cols`
names:()

/ TODO: the type characters of trade's columns, in order
types:()

/ TODO: the type character of the price column alone
priceType:" "

/ TODO: how many columns does trade have?
width:0N
