/ core11_find_in -- searching and set operations
/
/ `list?x` FINDS the index of the first x (or the count of the list if it
/ is not there). `in` asks the opposite question and is atomic on its
/ left argument. `except`, `inter` and `union` are set operations.
/
/ I AM NOT DONE

zs:10 20 30

/ TODO: the index of 20 in zs
at:0N

/ TODO: what does zs return for a value it does not contain, say 99?
notThere:0N

/ TODO: is 20 in zs?
present:0b

/ TODO: which of 2 and 5 are in 1 2 3? (a boolean list)
which:()

/ TODO: 1 2 3 4 with 2 and 4 removed
without:()

/ TODO: the items common to 1 2 3 and 2 3 4
common:()
