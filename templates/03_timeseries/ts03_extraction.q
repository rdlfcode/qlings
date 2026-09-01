/ ts03_extraction -- pulling pieces out
/
/ Casting narrows a temporal value: `date$ts and `time$ts split a
/ timestamp apart. Dotted attributes reach inside a NAME (not an
/ expression, so bind it to a variable first).
/
/ The trap: `.mm` means MONTH on a timestamp or date, but MINUTES on a
/ time. On a timestamp the minute you want is `.uu`. Get this wrong and
/ you silently bucket a year of data into twelve buckets.
/
/ I AM NOT DONE

ts:2024.03.15D14:45:30.500000000

/ TODO: just the date part
theDate:0Nd

/ TODO: just the time part
theTime:0Nt

/ TODO: the hour
hour:0Ni

/ TODO: the MINUTE past the hour, taken from ts
minute:0Ni

/ TODO: the MONTH number, taken from ts
monthNo:0Ni

/ TODO: the month of theDate, as a month value like 2024.03m
month:0Nm
