/ ts17_partitioned -- a partitioned database

/ `qlings setup` built data/db: one directory per date, each holding a
/ splayed `trades` table, plus a splayed `ref` table in the root.
/ Loading it maps every partition into one virtual table with an extra
/ `date` column at the front.

/ Nothing is read until you query, and a constraint on `date` FIRST in
/ the where clause prunes whole partitions off the disk -- that is the
/ single most important habit when querying a real kdb database.

/ The test has already loaded the database for you.

/ TODO: the partition dates available
dates:()

/ TODO: every trade on 2024.01.03
oneDay:()

/ TODO: the row count per date, in a column called cnt
perDate:()

/ TODO: the GOOG prices on 2024.01.02, date constrained FIRST
googPrices:()
