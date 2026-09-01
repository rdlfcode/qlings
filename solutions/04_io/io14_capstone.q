day:select from trades where date=2024.01.03
summary:0!select vwap:size wavg price, cnt:count i by sym from day
joined:summary lj `sym xkey select from ref
report:update sym:value sym, name:value name from joined
h:hopen `$":localhost:",string PORT
h(set;`report;report);
remoteRows:h"count report"
returned:h"report"
