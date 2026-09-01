\l tests/harness.q
.qlings.load[];
.qlings.chk["the namespaced function works";42;{.util.double 21}];
.qlings.chk["and the namespaced value";`helper;{.util.name}];
.qlings.chk["key lists the namespace";`double`name;{contents}];
.qlings.chk["a namespaced name is NOT in the root";0b;{inRoot}];
.qlings.done[];
