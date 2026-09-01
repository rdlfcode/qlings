/ io14_capstone -- put it all together
/
/ One realistic pipeline, using every chapter:
/   read a slice out of the partitioned database on disk,
/   aggregate it, enrich it from a reference table,
/   ship the result to another process, and read it back.
/
/ One last trap. Symbol columns that came off disk are ENUMERATIONS
/ (type 20h) over that database's sym file. The process you send them to
/ has no such file, so they arrive as plain symbols (11h) and the table
/ you get back will not match the one you sent. De-enumerate with `value`
/ over every symbol column before shipping -- here that is both `sym` and
/ the `name` column the join brought along.
/
/ The database is loaded and a bare q server is running on PORT.
/
/ I AM NOT DONE

/ TODO: the trades for 2024.01.03 only, pulled into memory
day:()

/ TODO: per sym for that day: vwap (size weighted price) and cnt (rows).
/       Unkey it, so it is a plain table.
summary:()

/ TODO: enrich `summary` with the `ref` table's name and lot columns.
/       Remember ref is mapped, so materialise it before keying.
joined:()

/ TODO: de-enumerate the sym and name columns, ready to send
report:()

/ TODO: open a handle to PORT and store `report` on the SERVER under the
/       name `report`
h:0N

/ TODO: ask the server how many rows it received
remoteRows:0N

/ TODO: ask for the report back
returned:()
