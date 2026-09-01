/ core01_atoms -- atoms and the type system

/ Every q value has a type. `type` gives you its code as a short:
/ NEGATIVE for an atom, POSITIVE for a list of that type, 0h for a
/ general (mixed) list. Long is 7h, float 9h, symbol 11h, boolean 1h.
/ So `type 42` is -7h and `type 1 2 3` is 7h.

/ Fix each TODO below until every check passes.

/ TODO: a long atom holding 42
answer:0N

/ TODO: a float atom holding 2.5
ratio:0n

/ TODO: the symbol atom `kdb
name:`todo

/ TODO: the boolean atom true
flag:0b

/ TODO: use `type` to report the type code of `answer`
answerType:0h
