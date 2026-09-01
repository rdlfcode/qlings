/ A tiny market-data server used by the IPC exercises. The test harness
/ starts this in a separate q process and gives your exercise its port.
px:([] sym:`AAPL`MSFT`GOOG`AAPL`MSFT; size:100 200 50 300 250; price:100 200 300 102 201f);
lastPrice:{[s] last exec price from px where sym=s};
vwapBySym:{select vwap:size wavg price by sym from px};
boom:{'"kaboom"};
counter:0;
bump:{counter+:x;};
