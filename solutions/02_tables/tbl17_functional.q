googs:?[trade;enlist (=;`sym;enlist `GOOG);0b;()]
twoCols:?[trade;enlist (>;`size;200);0b;`sym`price!(`sym;`price)]
grouped:?[trade;();(enlist `sym)!enlist `sym;(enlist `avgPrice)!enlist (avg;`price)]
