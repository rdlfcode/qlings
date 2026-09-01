notional:select notional:price*size from trade
flagged:select sym, big:size>200 from trade
firstTwo:select from trade where i<2
