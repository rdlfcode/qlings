small:select sym,price from trade
nested:`sym xgroup small
applePrices:nested[`AAPL;`price]
flat:ungroup nested
