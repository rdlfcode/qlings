/ tbl03_select -- select and where

/ qSQL reads like SQL but evaluates left to right:
/   select cols from t where constraints
/ Multiple constraints separated by commas are applied IN ORDER, each one
/ narrowing what the next sees -- that is why you put the cheapest and
/ most selective one first.

/ TODO: every trade for GOOG
goog:()

/ TODO: just the sym and price columns, for trades above 200
dear:()

/ TODO: AAPL trades with a size of at least 300
bigApple:()

/ TODO: how many AAPL trades are there?
appleCount:0N
