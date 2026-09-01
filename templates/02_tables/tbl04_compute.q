/ tbl04_compute -- renaming and computing columns
/
/ Inside a select you can name a result and compute it:
/   select notional:price*size from trade
/ Any q expression works, and the column names are in scope as lists.
/ `i` is a virtual column holding the row index.
/
/ I AM NOT DONE

/ TODO: a one-column table `notional` holding price*size for every trade
notional:()

/ TODO: sym plus a column `big` that is true when size>200
flagged:()

/ TODO: use the virtual column i to select the first two rows
firstTwo:()
