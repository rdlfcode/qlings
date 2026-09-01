avgBySym:select avgPrice:avg price by sym from trade
statsBySym:select cnt:count i, totalSize:sum size by sym from trade
nested:select prices:price by sym from trade
