counts:select cnt:count i by sym, big:size>200 from trade
groups:count counts
twoSyms:select avgPrice:avg price by sym from trade where sym in `AAPL`MSFT
