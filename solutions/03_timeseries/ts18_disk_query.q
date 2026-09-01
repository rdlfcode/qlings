whatHappens:@[{exec price from trades};0;{x}]
prices:exec price from select from trades where date=2024.01.04
bySym:select avgPrice:avg price by sym from trades where date=2024.01.04
plainSyms:value (0!bySym)`sym
enriched:(0!bySym) lj `sym xkey select from ref
