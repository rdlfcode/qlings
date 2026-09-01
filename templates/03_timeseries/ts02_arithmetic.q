/ ts02_arithmetic -- doing sums with time
/
/ Because temporal values are numbers, arithmetic just works: adding an
/ integer to a date adds days, and subtracting two dates gives the days
/ between. Adding a date to a time gives you a timestamp, which is how
/ you stitch the two halves together.
/
/ I AM NOT DONE

d:2024.03.15

/ TODO: a week after d
later:0Nd

/ TODO: the number of days from 2024.03.01 to d
gap:0N

/ TODO: combine d with the time 09:30:00.000 into a timestamp
stamped:0Np

/ TODO: the difference between two timestamps, as a timespan
elapsed:0Nn
