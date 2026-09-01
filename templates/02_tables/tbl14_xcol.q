/ tbl14_xcol -- renaming and reordering columns

/ `` `a`b xcol t `` renames the FIRST columns positionally.
/ `` `b xcols t `` moves named columns to the front, keeping the rest.
/ Neither touches the data, and both return a new table.

small:select name,dept,salary from emp

/ TODO: rename small's three columns to `who`team`pay
renamed:()

/ TODO: move salary to the front of small, leaving the others in order
reordered:()

/ TODO: rename ONLY the first column of small to `who, keeping the rest
firstOnly:()
