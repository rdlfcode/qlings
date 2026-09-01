inner:emp ij dept
kept:count inner
dropped:(exec name from emp) except exec name from inner
unioned:(select name,salary from emp) uj ([] name:enlist `zed; extra:enlist 1)
