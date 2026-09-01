/ tbl20_multi_by -- grouping by more than one thing

/ `by` takes several columns, and they can be COMPUTED -- grouping by a
/ derived value is how you bucket data without adding a column first.
/ The key of the result then has one column per grouping expression.

/ TODO: a count per sym AND per "is the size above 200", the second
/       group named `big`, with the count named `cnt`
counts:()

/ TODO: how many groups came out?
groups:0N

/ TODO: the average price per sym for AAPL and MSFT only, named avgPrice
twoSyms:()
