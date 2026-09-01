overall:exec size wavg price from trade
bySym:select vwap:size wavg price by sym from trade
byMinute:select vwap:size wavg price by bucket:60000 xbar time from trade
