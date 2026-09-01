system"mkdir -p data/scratch";
src:([] a:1 2; b:`x`y)
csvLines:csv 0: src
`:data/scratch/out.csv 0: csvLines;
loaded:("JS";enlist ",") 0: `:data/scratch/out.csv
