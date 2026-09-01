t:([] a:1 2; b:3 4)
k:([s:`x`y] v:1 2)
compact:.Q.s1 t
compactKeyed:.Q.s1 k
rebuilt:flip `a`b!(1 2;3 4)
one:enlist 42
cannotParse:@[value;"+`a`b!(1 2;3 4)";{x}]
roundTripped:-9!-8!t
