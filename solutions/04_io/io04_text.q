system"mkdir -p data/scratch";
`:data/scratch/words.txt 0: ("alpha";"beta";"gamma");
lines:read0 `:data/scratch/words.txt
n:count lines
vowels:lines where lines[;0] in "aeiou"
