/ core14_dicts -- dictionaries
/
/ A dictionary maps a list of keys to a list of values, built with `!`:
/   `a`b!1 2
/ Index it like a list: d`b. `key` and `value` pull the two halves back
/ out, and joining two dictionaries with `,` lets the right-hand one win.
/
/ I AM NOT DONE

/ TODO: a dictionary mapping `a`b`c to 1 2 3
d:()!()

/ TODO: the value stored under `b
b:0N

/ TODO: the keys of d
ks:()

/ TODO: the values of d
vals:()

/ TODO: d with `a set to 9 (use @, leaving d alone)
updated:()!()

/ TODO: d joined with `c`e!30 50 -- which value wins for `c?
merged:()!()
