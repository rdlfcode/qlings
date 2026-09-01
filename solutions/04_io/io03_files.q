system"mkdir -p data/scratch";
`:data/scratch/hello.txt 0: enlist "hi";
p:hsym `$"data/scratch/hello.txt"
exists:not () ~ key p
listing:key `:data/scratch
missing:key `:data/scratch/nope.txt
