/ core24_scope -- locals, globals and ::
/
/ Assigning inside a lambda creates a LOCAL, invisible outside it.
/ To write to a global from inside a function you need `::` instead:
/   {counter::42}
/ Functions can read globals freely; they just cannot rebind them with a
/ plain colon. There is no block scope -- a local belongs to the whole
/ lambda.
/
/ I AM NOT DONE

total:0

/ TODO: a function that sets the GLOBAL `total` to x, and returns x
record:{}

/ TODO: a function that assigns a local `total` and returns it,
/       leaving the global alone
shadow:{}

base:10

/ TODO: a function that reads the global `base` and adds its argument
addBase:{}
