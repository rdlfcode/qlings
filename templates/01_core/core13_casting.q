/ core13_casting -- $ converts between types

/ `$` casts: name the target type on the left, either as a symbol
/ (`long$x) or as a type code (7h$x). With a CHAR on the left it parses
/ text: "J"$"42" gives a long, "D"$"2024.01.15" gives a date.

/ Careful: casting a float to a long ROUNDS, it does not truncate.

/ TODO: cast 2.7 to a long -- what do you get?
rounded:0N

/ TODO: cast the long 5 to an int
asInt:0N

/ TODO: parse the string "42" into a long
parsed:0N

/ TODO: parse the string "2024.01.15" into a date
theDate:0Nd

/ TODO: cast the long 3 to a float using its type code, 9h
asFloat:0n
