/ tbl12_lj -- the left join
/
/ `t lj k` looks each row of t up in the KEYED table k and glues the
/ matching columns on. Every row of t survives; rows with no match get
/ nulls. The right-hand side must be keyed -- that is what lj searches.
/
/ `fay` works in `legal`, which is missing from `dept`, so she is the row
/ that shows you what a left join really does.
/
/ I AM NOT DONE

/ TODO: emp with its dept details joined on
joined:()

/ TODO: the boss column of the result
bosses:()

/ TODO: how many rows came out? (compare with count emp)
rows:0N

/ TODO: fay's boss -- what does a missing match give you?
faysBoss:`todo
