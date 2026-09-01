/ core04_nulls -- nulls and infinities
/
/ Each type has its own null: 0N is a null long, 0n a null float,
/ ` a null symbol, 0Nd a null date. `null x` tests for them.
/ 0W is long infinity. Aggregations like `sum` and `avg` SKIP nulls
/ rather than poisoning the result, and `^` fills them in.
/
/ I AM NOT DONE

/ TODO: the null long
nothing:0

/ TODO: test whether `nothing` is null (should come out 1b)
isNothing:0b

/ TODO: replace the nulls in 0N 2 0N 4 with 0, using ^
filled:()

/ TODO: long infinity
huge:0

/ TODO: the sum of 1 0N 3 -- what does q do with the null?
total:0N

/ TODO: is the empty symbol ` null?
symIsNull:0b
