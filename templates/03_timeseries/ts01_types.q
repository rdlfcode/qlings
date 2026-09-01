/ ts01_types -- the temporal types

/ q has a temporal type for every granularity, each written as a literal:
/   2024.03.15                     date       (-14h)
/   2024.03m                       month      (-13h)
/   09:30:15.250                   time       (-19h)
/   09:30:15                       second     (-18h)
/   09:30                          minute     (-17h)
/   2024.03.15D09:30:15.250000000  timestamp  (-12h)
/ Underneath they are all just numbers counting from 2000.01.01.

/ TODO: the date 2024.03.15
d:0Nd

/ TODO: the time 09:30:15.250
t:0Nt

/ TODO: the timestamp for that date and time (nanosecond precision)
ts:0Np

/ TODO: the type code of a date
dateType:0h

/ TODO: the type code of a timestamp
tsType:0h

/ TODO: a date is a count of days from 2000.01.01 -- cast d to a long
asLong:0N
