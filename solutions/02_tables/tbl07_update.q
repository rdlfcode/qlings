withNotional:update notional:price*size from trade
doubledGoog:update price:price*2 from trade where sym=`GOOG
withSymAvg:update avgPrice:avg price by sym from trade
originalCols:count cols trade
