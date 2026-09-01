/ tbl08_delete -- deleting rows and columns

/ `delete from t where ...` removes ROWS.
/ `delete col from t` removes a COLUMN.
/ You cannot do both in one statement, and as with update you get a new
/ table back rather than a mutation.

/ TODO: trade with everything that is not GOOG removed
onlyGoog:()

/ TODO: trade without its size column
noSize:()

/ TODO: trade without the rows whose price is below 150
expensive:()
