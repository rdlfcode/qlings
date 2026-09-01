/ core08_amend -- changing items

/ q values are immutable; you build a NEW list with the change applied.
/ @[list;indexes;operator;operand] does that:
/   @[xs;0;:;99]    replace index 0 with 99
/   @[xs;1;+;5]     add 5 to index 1
/ Assigning through an index, xs[0]:99, rebinds the variable instead.

xs:100 200 300 400 500

/ TODO: xs with index 0 replaced by 99, using @
replaced:()

/ TODO: xs with 5 added to index 1, using @
bumped:()

/ TODO: xs with indexes 0 and 4 both set to 0, using @
zeroed:()

/ TODO: xs with every item doubled, using @ and no index list
/       (an elided index means "the whole thing")
doubled:()

/ TODO: leave xs itself untouched -- what is xs still equal to?
untouched:()
