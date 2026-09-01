/ io11_remote_data -- querying another process

/ Whole tables come back over IPC as ordinary q values, so a remote query
/ is just a query. The rule of thumb is to aggregate on the SERVER and
/ ship the small result, rather than pulling the raw table across and
/ aggregating locally -- same answer, far less wire.

/ The remote has a table `px` with sym, size and price columns.

h:hopen `$":localhost:",string PORT

/ TODO: pull the whole px table back
whole:()

/ TODO: ask the SERVER to do the aggregation instead: rows per sym,
/       in a column called cnt
counts:()

/ TODO: how many rows crossed the wire for each approach?
wholeRows:0N
countsRows:0N
