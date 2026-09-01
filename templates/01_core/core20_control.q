/ core20_control -- conditionals and loops

/ `$[cond;then;else]` is the conditional expression, and it is vector-safe
/ only for ATOM conditions -- use `?[cond;a;b]` for a boolean LIST.
/ `if[cond;...]` and `do[n;...]` and `while[cond;...]` are statements:
/ they return nothing, so they only earn their keep with assignment.

/ TODO: `yes if 1b, else `no
verdict:`todo

/ TODO: for the list 1 2 3 4, give `even or `odd for EACH item
/       (hint: ?[booleans;a;b] picks item by item)
parities:()

/ TODO: use a while loop to add up 0 1 2 3 4 into `looped`
looped:0N

/ TODO: use do[n;...] to multiply `acc` by 2, three times, starting at 1
acc:1
