/ ts07_moving -- moving windows
/
/ `n mavg x` is the moving average over the last n items, and there are
/ matching msum, mmax, mmin and mdev. They do NOT pad with nulls: the
/ first n-1 results are computed over however many items exist so far,
/ so the series is the same length as its input.
/
/ I AM NOT DONE

xs:1 2 3 4 5

/ TODO: the 3-item moving average of xs
ma:()

/ TODO: the 3-item moving sum of xs
ms:()

/ TODO: the 3-item moving maximum of 1 5 2 8
mx:()

/ TODO: a 3-trade moving average of the AAPL prices
appleMa:()
