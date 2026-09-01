ranged:select from trade where time>=09:31:00.000, time<=09:32:15.000
windowed:select from trade where time within 09:31:00.000 09:32:15.000
early:count select from trade where time<09:31:00.000
