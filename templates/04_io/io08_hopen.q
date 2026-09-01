/ io08_hopen -- connecting to another q process

/ `hopen `:host:port` opens a connection and returns a HANDLE, a small
/ positive integer. Calling that handle sends a message and waits for the
/ reply, which is a synchronous request. `hclose` shuts it down.

/ The test has started a q process for you and put its port number in the
/ variable PORT.

/ TODO: open a connection to localhost on PORT
/       (build the symbol with `$":localhost:",string PORT)
h:0N

/ TODO: ask the remote process to evaluate the string "2+2"
total:0N

/ TODO: ask it for its own process id, .z.i
remotePid:0N

/ TODO: is the handle a positive integer?
isHandle:0b
