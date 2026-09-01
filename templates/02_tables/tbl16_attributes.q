/ tbl16_attributes -- s, u, p and g
/
/ An attribute is a promise about a list that lets q use a faster
/ algorithm:
/   `s#  sorted ascending -- enables binary search
/   `u#  unique
/   `p#  parted (equal values contiguous)
/   `g#  grouped (an index is maintained)
/ `attr` reads the attribute back; a plain list has the null attribute.
/ Sorting with xasc sets `s on the sort column for you.
/
/ I AM NOT DONE

/ TODO: apply the sorted attribute to 1 2 3
sorted:()

/ TODO: read the attribute back off it
sortedAttr:`

/ TODO: apply the unique attribute to `a`b`c
uniq:()

/ TODO: what attribute does a plain, untouched list have?
plainAttr:`s

/ TODO: sort trade by sym with xasc, then read the attribute
/       that landed on its sym column
symAttr:`
