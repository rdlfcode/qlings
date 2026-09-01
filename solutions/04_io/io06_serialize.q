system"mkdir -p data/scratch";
original:([] a:1 2 3; b:`x`y`z)
bytes:-8!original
restored:-9!bytes
byteType:type bytes
`:data/scratch/tbl set original;
fromDisk:get `:data/scratch/tbl
