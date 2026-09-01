/ core19_each_left_right -- \: and /: and '
/
/ These pair one argument up against every item of the other:
/   x f\: y   each-LEFT:  every item of x against the whole of y
/   x f/: y   each-RIGHT: the whole of x against every item of y
/   x f'  y   each-BOTH:  item by item, in step
/ Remember which is which by the slash leaning toward the side it splits.
/
/ I AM NOT DONE

/ TODO: is each of 1 2 3 in the list 1 2? (each-left)
membership:()

/ TODO: join the list 1 2 to each of 3 and 4 (each-right)
appended:()

/ TODO: add 1 2 3 to 10 20 30 item by item, using each-both
pairwise:()

/ TODO: the difference between each item of 1 3 6 10 and the one before it
/       (use the each-prior adverb ':)
gaps:()
