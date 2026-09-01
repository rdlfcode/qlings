/ io05_csv -- CSV in and out

/ `csv 0: t` turns a table into CSV lines, and writing them is just a
/ file write. Reading is the typed form of 0::
/   ("IS";enlist ",") 0: `:file.csv
/ where the first argument gives ONE TYPE CHARACTER PER COLUMN -- I int,
/ J long, F float, S symbol, D date, * string -- and the second is the
/ delimiter, enlisted to say "the first line holds column names".

system"mkdir -p data/scratch";
src:([] a:1 2; b:`x`y)

/ TODO: turn src into CSV lines
csvLines:()

/ TODO: write them to :data/scratch/out.csv

/ TODO: read the file back as a table, with a as a long and b a symbol
loaded:()
