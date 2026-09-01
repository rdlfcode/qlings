h:hopen `$":localhost:",string PORT
viaString:h"lastPrice `AAPL"
viaList:h(`lastPrice;`AAPL)
vwaps:h(`vwapBySym;::)
remoteCount:h({count px};::)
