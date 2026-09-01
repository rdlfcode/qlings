/ io04_text -- reading and writing text
/
/ `read0 path` reads a file as a list of lines (each line a string).
/ `path 0: lines` writes them back. `read1` gives raw bytes instead.
/ Both are the same `0:` operator you use for CSV -- the left argument
/ decides what it does.
/
/ I AM NOT DONE

system"mkdir -p data/scratch";

/ TODO: write the three lines "alpha", "beta", "gamma" to
/       :data/scratch/words.txt

/ TODO: read them back
lines:()

/ TODO: how many lines?
n:0N

/ TODO: the lines that start with a vowel
vowels:()
