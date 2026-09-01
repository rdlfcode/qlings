goog:select from trade where sym=`GOOG
dear:select sym,price from trade where price>200
bigApple:select from trade where sym=`AAPL, size>=300
appleCount:count select from trade where sym=`AAPL
