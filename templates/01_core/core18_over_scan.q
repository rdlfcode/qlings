/ core18_over_scan -- over (/) and scan (\)
/
/ `over` folds a list down to one value; `scan` does the same but keeps
/ every intermediate result:
/   (+/) 1 2 3 4   ->  10
/   (+\) 1 2 3 4   ->  1 3 6 10
/ Give a seed on the left to start somewhere other than the first item:
/   (+/)[100;1 2 3]  ->  106
/
/ I AM NOT DONE

ns:1 2 3 4

/ TODO: the total of ns, using over
total:0N

/ TODO: the running totals of ns, using scan
running:()

/ TODO: the product of ns, using over
product:0N

/ TODO: the total of ns starting from a seed of 100
seeded:0N

/ TODO: the running maximum of 3 1 4 1 5, using scan
peaks:()
