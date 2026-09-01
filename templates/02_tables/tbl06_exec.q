/ tbl06_exec -- exec unwraps the table

/ `select` always gives you a table. `exec` gives you the raw value:
/   exec price from t           -> a LIST
/   exec sym!price from t       -> a DICTIONARY
/   exec first price from t     -> an ATOM
/ Reach for exec when you want a value to compute with, not a result set.

/ TODO: the price column of the AAPL trades, as a plain list
applePrices:()

/ TODO: the single price of the GOOG trade, as an ATOM
googPrice:0n

/ TODO: a dictionary from sym to price, for trades with size above 300
symToPrice:()!()

/ TODO: the same AAPL prices but via select -- note it is a TABLE
appleTable:()
