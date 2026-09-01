/ io12_ipc_errors -- when the far side fails
/
/ An error raised in the remote process is re-signalled in YOURS, as if
/ the call had failed locally. So you trap it the same way, with @[ ]:
/ the handle is just a function.
/
/ Connecting to a port with nothing behind it fails too, and that one is
/ worth trapping explicitly -- a dead server should not take your process
/ down with it.
/
/ I AM NOT DONE

h:hopen `$":localhost:",string PORT

/ TODO: call the remote `boom` function, trapping the error and keeping
/       its text
failed:()

/ TODO: prove the handle still works afterwards
stillAlive:0N

/ TODO: try to connect to port 1 (nothing is listening) and trap the
/       failure, returning the symbol `refused
refused:`todo
