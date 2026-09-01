/ tbl10_keyed -- keyed tables

/ `` `col xkey t `` promotes a column to the KEY. A keyed table indexes
/ like a dictionary -- k[`bob] gives a row -- and it is what joins and
/ `by` results are built on. `0!k` unkeys it back to a plain table.

/ The `emp` and `dept` tables are provided (see data/fixtures.q).

/ TODO: emp keyed on name
byName:()

/ TODO: bob's row, looked up by key
bob:()!()

/ TODO: bob's salary
bobSalary:0N

/ TODO: byName unkeyed again
plain:()

/ TODO: the type code of a keyed table
keyedType:0h
