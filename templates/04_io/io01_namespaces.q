/ io01_namespaces -- organising code
/
/ A namespace is a dictionary hanging off the root, named with a leading
/ dot: .util.double is `double` inside `.util`. Every kdb codebase uses
/ them, and the ones starting .z, .Q and .j are q's own.
/ `key `.util` lists what is in one.
/
/ I AM NOT DONE

/ TODO: define `double` inside a namespace called .util
/       so that .util.double 21 is 42

/ TODO: define `name` inside .util holding the symbol `helper

/ TODO: the names defined in .util, sorted. Note that q keeps an empty
/       symbol in every namespace -- drop it.
contents:()

/ TODO: is there a definition called `double` in the ROOT namespace?
inRoot:1b
