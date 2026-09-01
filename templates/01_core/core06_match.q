/ core06_match -- = compares, ~ matches
/
/ `=` is atomic: comparing two lists gives you a list of booleans, and
/ it happily compares across numeric types (1 = 1h is true).
/
/ `~` is MATCH: one boolean for the whole value, and it is strict about
/ type. This is the one you want in tests and in `if` conditions.
/
/ I AM NOT DONE

/ TODO: compare 1 2 3 with 1 2 2 item by item
elementwise:()

/ TODO: does 1 2 3 match 1 2 3, as a single boolean?
same:0b

/ TODO: does the long 1 MATCH the short 1h?
strict:1b

/ TODO: does the long 1 EQUAL the short 1h?
loose:0b

/ TODO: does the nested list (1 2;3 4) match (1 2;3 4)?
nested:0b

/ TODO: does the symbol `a match the char "a"?
crossType:1b
