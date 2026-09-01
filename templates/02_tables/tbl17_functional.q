/ tbl17_functional -- select built as data

/ qSQL is sugar over `?[table;constraints;by;columns]`, where each part is
/ built from lists instead of syntax:
/   constraints: a list of (operator; column; value) triples, with the
/                value wrapped in enlist when it is a symbol atom
/   by:          0b for none, or a dictionary of name!column
/   columns:     () for all, or a dictionary of name!expression
/ Use it when the columns are decided at run time.

/ TODO: the functional form of: select from trade where sym=`GOOG
googs:()

/ TODO: the functional form of: select sym,price from trade where size>200
twoCols:()

/ TODO: the functional form of: select avgPrice:avg price by sym from trade
grouped:()
