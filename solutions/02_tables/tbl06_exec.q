applePrices:exec price from trade where sym=`AAPL
googPrice:exec first price from trade where sym=`GOOG
symToPrice:exec sym!price from trade where size>300
appleTable:select price from trade where sym=`AAPL
