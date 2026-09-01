/ ts13_aj -- the asof join
/
/ `aj[cols;t;q]` answers "what was the prevailing quote when this trade
/ happened". The last column named is matched AS OF -- the most recent
/ row at or before that time -- and the earlier ones must match exactly.
/
/ The quote table must be sorted by those columns, with the `p attribute
/ on the matching column. Get that wrong and aj returns wrong answers
/ rather than an error, which is the single most common kdb bug.
/
/ I AM NOT DONE

/ TODO: sort `quote` by sym then time, and put the `p attribute on sym
sq:()

/ TODO: join the prevailing bid and ask onto every trade
joined:()

/ TODO: the bid column of the result
bids:()
