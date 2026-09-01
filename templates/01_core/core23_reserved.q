/ core23_reserved -- two traps that bite everyone

/ 1. q has reserved words, and using one as a PARAMETER or a column name
/    fails at parse time with a bare 'match or 'assign. `exp`, `vs`, `in`,
/    `floor` and `sum` are all real functions, so {[exp] exp} will not
/    even parse. Local variables inside a lambda are fine to shadow --
/    it is the parameter list and column names that reject them.

/ 2. A line whose only character is / opens a BLOCK COMMENT that runs
/    until a line whose only character is \. Everything between vanishes
/    silently -- no error, your definitions simply never happen. Always
/    write / followed by a space.

/ TODO: this parameter name is reserved, so this file will not even load.
/       Rename the parameter (and its uses) to something legal.
scale:{[exp] exp*2}

/ TODO: name a column something other than the reserved word `floor`
building:([] name:`a`b; floor:1 2)

/ TODO: set `survived` to 1b. Careful: something above it in this file
/       is hiding it. Read the block comment rule again.

/
survived:0b
