bars:select open:first price, high:max price, low:min price, close:last price
  by bucket:60000 xbar time from trade
n:count bars
lastClose:last (0!bars)`close
