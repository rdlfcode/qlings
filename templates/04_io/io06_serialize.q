/ io06_serialize -- q's own binary format

/ `-8!x` serialises any q value to a byte vector and `-9!` reads it back.
/ That is exactly what IPC sends over the wire and what `set` writes to
/ disk, so anything q can hold can be shipped or stored with no schema
/ and no conversion.

original:([] a:1 2 3; b:`x`y`z)

/ TODO: serialise `original` to bytes
bytes:()

/ TODO: read it back
restored:()

/ TODO: the type code of the serialised form
byteType:0h

/ TODO: round-trip through a FILE instead, using set and get,
/       via :data/scratch/tbl
fromDisk:()
