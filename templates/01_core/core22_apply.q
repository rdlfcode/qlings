/ core22_apply -- @ and . apply functions

/ `f @ x` applies f to ONE argument; `f . args` applies it to a LIST of
/ arguments. Because operators are just functions, (+) . 2 3 is 5.
/ This is what lets you build a call up as data and run it later --
/ the same trick qSQL uses under the hood.

/ TODO: apply neg to 5 using @
negated:0N

/ TODO: apply + to the argument list 2 3 using .
added:0N

/ TODO: build the call (+;2;3) as a general list, then run it with `value`
call:()
ran:0N

/ TODO: apply each of (sum;max;min) to 1 2 3, giving a list of results
results:()
