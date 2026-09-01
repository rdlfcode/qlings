/ tbl21_notation -- reading q's compact notation

/ q renders a value two ways. `.Q.s` draws the grid you see in the console.
/ `.Q.s1` collapses it onto ONE line, and that is the form that turns up in
/ error messages, logs and anywhere a value has to fit in a single string --
/ including this exercise runner's own diffs.

/ In the compact form the operators are doing the work:
/   +   flip, so a table is  +`a`b!(1 2;3 4)
/   ,   enlist, so a one-item list is  ,42
/ A keyed table is one flipped dictionary keyed on another, which is why it
/ comes out looking like (+(,`s)!,`x`y)!+(,`v)!,1 2

/ It is a DISPLAY form, not something you can feed back to `value`: a leading
/ + is read as a binary operator with nothing on its left. Write `flip`, or
/ round-trip through -8!/-9! if you need the value itself back.

t:([] a:1 2; b:3 4)
k:([s:`x`y] v:1 2)

/ TODO: the compact one-line rendering of t
compact:()

/ TODO: the compact rendering of the KEYED table k
compactKeyed:()

/ TODO: build t using flip and a dictionary, the way the notation describes it
rebuilt:()

/ TODO: a one-item list holding 42
one:()

/ TODO: try to evaluate the compact string "+`a`b!(1 2;3 4)" with `value`,
/       trapping the failure and keeping the error text
cannotParse:()

/ TODO: round-trip t through q's binary form instead, which does work
roundTripped:()
