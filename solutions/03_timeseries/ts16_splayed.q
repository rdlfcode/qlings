system"mkdir -p data/scratch";
nums:([] a:1 2 3; b:10 20 30f)
`:data/scratch/nums set nums;
readBack:get `:data/scratch/nums
`:data/scratch/px/ set nums;
mapped:get `:data/scratch/px/
materialised:select from mapped
files:key `:data/scratch/px
