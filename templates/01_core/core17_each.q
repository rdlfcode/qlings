/ core17_each -- the each adverb
/
/ Most q operators are already atomic, so you do NOT need each for
/ arithmetic. You need it when a function wants a whole item at a time:
/   count each ("ab";"cde")   ->  2 3
/ `each` is written as the adverb ' after a function, and `each` spelled
/ out is the same thing: f each x.
/
/ I AM NOT DONE

words:("ab";"cde";"fg")

/ TODO: the length of each word
lengths:()

/ TODO: reverse each word
flipped:()

/ TODO: the first char of each word
initials:()

/ TODO: double every item of 1 2 3 WITHOUT using each
/       (arithmetic is already atomic)
doubled:()
