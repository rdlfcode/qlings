/ core03_typed_lists -- simple lists, general lists, and enlist

/ A list whose items share a type is a SIMPLE list (positive type code).
/ Mix the types and you get a GENERAL list, type 0h, written with
/ semicolons: (1;2.5;`a)
/ `enlist` makes a one-item list -- note that `enlist 42` is NOT 42.
/ `raze` flattens one level of nesting.

/ I AM NOT DONE

/ TODO: a simple long list: 1 2 3
simple:()

/ TODO: the type code of `simple`
simpleType:0h

/ TODO: a general list holding the long 1, the float 2.5 and the symbol `a
mixed:()

/ TODO: the type code of `mixed`
mixedType:0h

/ TODO: a one-item list containing the long 42
one:()

/ TODO: flatten ((1 2);(3 4)) into a single list
flat:()
