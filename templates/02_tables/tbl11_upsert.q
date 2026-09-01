/ tbl11_upsert -- adding and replacing rows

/ On a KEYED table `upsert` replaces the row when the key already exists
/ and appends it when it does not -- that is the whole point of the name.
/ On an unkeyed table there is no key to match, so upsert just appends,
/ and `,` (join) does the same.

keyed:`name xkey emp

/ TODO: keyed with bob's salary changed to 999 (his other fields kept)
raised:()

/ TODO: keyed with a brand new employee: `zed, `eng, 50, 2023.01.01
hired:()

/ TODO: append one row to the UNKEYED emp table using upsert
appended:()
