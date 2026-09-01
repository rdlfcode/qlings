/ Builds the on-disk sample database used by the storage exercises.
/ Run once via `qlings setup`. Everything here is deterministic, so the
/ expected values in the tests never move.

root:$[count e:getenv`QLINGS_ROOT;e;"."];
db:hsym `$root,"/data/db";

/ n trades for one date, evenly spaced through the morning
mk:{[d;n;base]
  ([] time :d+09:30:00.000+00:00:30.000*til n;
      sym  :n#`AAPL`MSFT`GOOG;
      price:base+0.5*til n;
      size :100*1+n#1 2 3 4)};

dates:2024.01.02 2024.01.03 2024.01.04;
bases:100 110 120f;

/ .Q.dpft writes one date partition, enumerating and parting by sym.
/ It looks the table up by name, so it has to be a global.
write:{[d;base]
  trades::mk[d;12;base];
  .Q.dpft[db;d;`sym;`trades];
  };
write .' flip (dates;bases);
delete trades from `.;

/ a splayed (unpartitioned) reference table in the db root, the way a
/ real kdb database keeps its static data. Symbol columns in a splayed
/ table must be enumerated against the db sym file, which is .Q.en.
ref:([] sym:`AAPL`GOOG`MSFT; name:`$("Apple";"Alphabet";"Microsoft"); lot:100 1 10);
(` sv db,`ref`) set .Q.en[db;ref];

-1"built ",string[count dates]," partitions under ",string db;
exit 0
