/ ts10_bin -- binary search with bin

/ `xs bin y` finds, for each y, the index of the LAST item of xs that is
/ less than or equal to y. xs must be sorted. That "last one at or before"
/ rule is exactly asof semantics, and `bin` is what aj is built on.
/ A y before everything gives -1.

grid:09:30 09:35 09:40

/ TODO: which bucket does 09:37 fall in?
slot:0N

/ TODO: the buckets for 09:31, 09:36 and 09:44
slots:()

/ TODO: what comes back for 09:00, before the first item?
tooEarly:0N

/ TODO: use bin to pick the grid times at or before 09:31 09:36 09:44
picked:()
