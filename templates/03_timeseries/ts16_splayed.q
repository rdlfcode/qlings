/ ts16_splayed -- writing tables to disk
/
/ `path set value` writes; `get path` reads back. A path ending in a
/ SLASH means a splayed table: one file per column in a directory, plus a
/ hidden .d file recording the column order. A query can then read only
/ the columns it touches.
/
/ Reading a splayed table back gives you a MEMORY-MAPPED table. It holds
/ the same data, but it is not the identical object, so `~` against the
/ original is false until you materialise it with `select from`.
/
/ Symbol columns must be enumerated against a sym file first, with
/ `.Q.en[dbdir;t]`. The table here has none, so it splays as-is.
/
/ I AM NOT DONE

system"mkdir -p data/scratch";
nums:([] a:1 2 3; b:10 20 30f)

/ TODO: write `nums` to the single file :data/scratch/nums
/       (no trailing slash) and read it straight back
readBack:()

/ TODO: splay `nums` into :data/scratch/px/ (trailing slash) and get it
mapped:()

/ TODO: materialise `mapped` into an ordinary in-memory table
materialised:()

/ TODO: what files ended up in data/scratch/px?
files:()
