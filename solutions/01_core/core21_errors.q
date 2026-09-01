checked:{if[x<0;'"negative"]; x}
caught:@[checked;-1;{x}]
fine:@[checked;5;{`handled}]
divided:.[{x+y};(1;`a);{`oops}]
