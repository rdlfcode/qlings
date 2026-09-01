/ core12_strings -- chars, strings and symbols

/ A q "string" is a LIST of chars, so "abc" has count 3 and type 10h.
/ Watch out: "a" is a single char ATOM, type -10h, not a one-item string.
/ A symbol like `abc is a single interned ATOM with count 1 -- use
/ symbols for repeated labels, strings for text you take apart.

/ TODO: how many characters are in "hello"?
len:0N

/ TODO: the type code of the char "a"
charType:0h

/ TODO: turn the symbol `abc into the string "abc"
asString:()

/ TODO: turn the string "abc" into the symbol `abc
asSymbol:`todo

/ TODO: "abc" in upper case
shout:()

/ TODO: split "ab,cd" on the comma
parts:()

/ TODO: join ("ab";"cd") back together with a comma
joined:()

/ TODO: does "hello" match the pattern "he*"?
matches:0b
