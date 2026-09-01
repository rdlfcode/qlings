/ tbl13_ij_uj -- inner and union joins
/
/ `t ij k` is like lj but DROPS rows with no match in the keyed table k.
/ `t uj u` is a union: it stacks two tables, widening to the union of
/ their columns and filling the gaps with nulls. Use uj when the two
/ tables describe the same kind of thing but not identically.
/
/ I AM NOT DONE

/ TODO: emp inner-joined to dept
inner:()

/ TODO: how many rows survived?
kept:0N

/ TODO: who was dropped? (the name that is in emp but not in inner)
dropped:()

/ TODO: union-join (select name,salary from emp) with a one-row table
/       giving name `zed and a column `extra` holding 1
unioned:()
