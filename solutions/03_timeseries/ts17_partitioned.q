dates:date
oneDay:select from trades where date=2024.01.03
perDate:select cnt:count i by date from trades
googPrices:exec price from select from trades where date=2024.01.02, sym=`GOOG
