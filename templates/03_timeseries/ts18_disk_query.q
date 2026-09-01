/ ts18_disk_query -- what changes once the data is on disk

/ A partitioned table is not an in-memory table, and some things simply
/ do not work on it:
/   - `exec` straight off a partitioned table signals 'nyi
/   - `xkey` on a mapped splayed table signals 'type
/ The fix is always the same: `select` the slice you need into memory
/ first, then treat it as an ordinary table.

/ Two more surprises live here. Rows come back in the order they are
/ STORED -- parted by sym, not by time. And a symbol column on disk is an
/ ENUMERATION over the sym file, which does not match a plain symbol list
/ until you run `value` over it.

/ The database is already loaded.

/ TODO: prove it -- trap `exec price from trades` and keep the error text
whatHappens:()

/ TODO: the same thing done properly: select into memory, then exec,
/       for 2024.01.04 only
prices:()

/ TODO: the average price per sym on 2024.01.04, in a column avgPrice
bySym:()

/ TODO: the sym column of that result, de-enumerated to plain symbols
plainSyms:()

/ TODO: bySym left-joined to the `ref` table keyed on sym, so each row
/       gains a name and a lot size. `ref` is mapped too, so it needs
/       materialising before xkey will take it.
enriched:()
