/ io03_files -- paths and directories

/ A file path is a symbol beginning with a colon: `:data/scratch/x.txt.
/ `hsym` builds one from a string, which is how you make a path at run
/ time. `key path` lists a directory, gives back the path itself for a
/ plain file, and returns an empty general list for something that does
/ not exist -- so `key` is also your "does this exist" test.

system"mkdir -p data/scratch";
`:data/scratch/hello.txt 0: enlist "hi";

/ TODO: build the path `:data/scratch/hello.txt from a string, with hsym
p:`

/ TODO: does it exist? (key returns the path itself for a plain file)
exists:0b

/ TODO: the contents of the data/scratch directory
listing:()

/ TODO: what does key give for a path that is not there?
missing:0N
