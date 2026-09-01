/ io13_one_shot -- connections you do not keep
/
/ Applying a connection SYMBOL directly to a message opens a connection,
/ sends, reads the reply and closes again:
/   `:localhost:5000 "2+2"
/ That is convenient for a one-off, and wasteful in a loop -- a long-lived
/ handle is the right answer when you are asking more than once.
/
/ `hopen` also takes a timeout in milliseconds as a second argument,
/ which is how you stop a dead host from hanging your process.
/
/ I AM NOT DONE

/ TODO: the connection symbol for localhost on PORT
target:`

/ TODO: a one-shot string request asking for 2+2
quick:0N

/ TODO: a one-shot request in the list form, calling lastPrice on `AAPL
quickList:0n

/ TODO: open a connection to port 1 with a 100 millisecond timeout,
/       trapping the failure and keeping the error text
refusedText:()
