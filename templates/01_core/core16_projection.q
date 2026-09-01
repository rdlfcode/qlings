/ core16_projection -- fixing arguments
/
/ Supply fewer arguments than a function wants and you get a PROJECTION:
/ a new function waiting for the rest. `+[10]` adds 10 to whatever comes.
/ Elide an argument with a semicolon to fix the other one instead:
/ `{x-y}[;1]` subtracts 1.
/
/ I AM NOT DONE

/ TODO: project + so that add10 adds 10
add10:{}

/ TODO: project {x-y} so that minus1 subtracts 1 from its argument
minus1:{}

/ TODO: apply add10 to a list
shifted:()

/ TODO: `value` evaluates a string as q code -- evaluate "2+3"
evaluated:0N
