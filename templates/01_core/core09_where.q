/ core09_where -- booleans, where, and filtering
/
/ Comparisons give boolean lists. `where b` turns a boolean list into the
/ INDEXES of the true items, and `list where b` is the q idiom for
/ "filter". `any` and `all` collapse a boolean list to one boolean.
/
/ Careful: summing booleans gives an INT, not a long.
/
/ I AM NOT DONE

xs:100 200 300 400 500

/ TODO: which items are greater than 250? (a boolean list)
mask:()

/ TODO: the INDEXES of those items
idx:()

/ TODO: the items themselves
big:()

/ TODO: how many are greater than 250? (sum the mask)
howMany:0N

/ TODO: is any item greater than 450?
anyHuge:0b

/ TODO: are all items greater than 50?
allPositive:0b
