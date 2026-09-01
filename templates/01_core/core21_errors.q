/ core21_errors -- signalling and trapping

/ `'"boom"` signals an error. To catch one, use the ternary forms of
/ apply:
/   @[f;arg;handler]      one argument
/   .[f;arglist;handler]  several
/ The handler is called with the error text when f fails, so it doubles
/ as a default value. Without a handler the error propagates.

/ TODO: a function that signals the error "negative" when x<0,
/       and otherwise returns x
checked:{}

/ TODO: trap a call to checked with -1, returning the error text itself
caught:()

/ TODO: trap a call to checked with 5 -- the handler should not fire
fine:0N

/ TODO: trap a two-argument call to {x+y} with 1 and the symbol `a,
/       returning the symbol `oops instead of the error
divided:`todo
