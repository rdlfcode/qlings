/ core07_indexing -- getting items out

/ Indexing is just function application: xs[2] and xs 2 are the same.
/ Index with a LIST to get a list back. Out-of-range indexing returns a
/ null rather than signalling. `#` takes from the front (negative takes
/ from the back) and `_` drops.

xs:100 200 300 400 500

/ TODO: the item at index 0
head:0N

/ TODO: the items at indexes 1 and 3, in that order
picked:()

/ TODO: index xs with til 3
firstThree:()

/ TODO: what comes back from index 99?
missing:0

/ TODO: the last two items, using #
tail:()

/ TODO: everything except the first two items, using _
rest:()
