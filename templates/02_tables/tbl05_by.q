/ tbl05_by -- grouping with by
/
/ `by` groups rows and aggregates within each group. The grouping columns
/ become the KEY of the result, so you get a keyed table back:
/   select avg price by sym from trade
/ Without an aggregation the grouped column comes back NESTED, one list
/ per group -- often exactly what you want.
/
/ I AM NOT DONE

/ TODO: the average price per sym, in a column called avgPrice
avgBySym:()

/ TODO: per sym: a count called cnt (use the virtual column i)
/       and the total size called totalSize
statsBySym:()

/ TODO: the prices for each sym, NOT aggregated -- one list per sym,
/       in a column called prices
nested:()
