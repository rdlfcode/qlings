/ io09_messages -- the two ways to send a request

/ A message can be a STRING, which the remote parses and evaluates:
/   h"lastPrice `AAPL"
/ or a LIST, whose first item is the function and the rest its arguments:
/   h(`lastPrice;`AAPL)
/ The list form is the one to use: nothing is parsed at the far end, the
/ arguments keep their types, and no one can inject code into your
/ string. The remote already defines lastPrice and vwapBySym.

h:hopen `$":localhost:",string PORT

/ TODO: the last AAPL price, asked for as a STRING
viaString:0n

/ TODO: the same thing, asked for as a LIST
viaList:0n

/ TODO: call vwapBySym, which takes no arguments, using the list form
/       (send the name and the empty argument list)
vwaps:()

/ TODO: send a lambda to run on the far side: ask it to compute
/       count of px
remoteCount:0N
