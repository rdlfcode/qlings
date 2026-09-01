/ io02_env -- the .z namespace and system commands
/
/ `.z` holds q's view of the world: .z.d today's date, .z.p the current
/ timestamp, .z.K the version. `system "cmd"` runs a q command (the same
/ ones you type after a backslash) and returns its output as a value --
/ `system "d"` for the current namespace, `system "pwd"` shells out.
/ `getenv` reads environment variables.
/
/ I AM NOT DONE

/ TODO: today's date, from .z
today:0Nd

/ TODO: the type code of .z.p
stampType:0h

/ TODO: the QLINGS_EXERCISE environment variable, as a string
/       (the runner sets it to the path of this very file)
myPath:()

/ TODO: does that path end in ".q"?
looksRight:0b
