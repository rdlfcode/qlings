/ tbl01_construct -- what a table actually is
/
/ A table is a flipped dictionary of columns. These two are the same:
/   ([] a:1 2; b:`x`y)
/   flip `a`b!(1 2;`x`y)
/ `count` counts ROWS, `cols` gives the column names, and `type` reports
/ 98h for a table (99h for a keyed one).
/
/ I AM NOT DONE

/ TODO: a table with column a holding 1 2 3 and column b holding `x`y`z
t:([] )

/ TODO: build the SAME table with flip and a dictionary
t2:()!()

/ TODO: how many rows does t have?
rows:0N

/ TODO: the column names of t
names:()

/ TODO: the type code of a table
tableType:0h
