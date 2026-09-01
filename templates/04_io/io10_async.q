/ io10_async -- fire and forget
/
/ `neg[h] message` sends ASYNCHRONOUSLY: it returns immediately and gives
/ you nothing back, so it is for telling the remote to do something, not
/ for asking it a question.
/
/ The message may still be sitting in a buffer when you move on. A later
/ synchronous call flushes it, because the remote handles messages in
/ order -- which is the usual way to make sure an async send landed.
/
/ I AM NOT DONE

h:hopen `$":localhost:",string PORT

/ TODO: asynchronously ask the remote to run bump[5], which adds 5 to
/       its `counter`

/ TODO: what does an async send return?
sendResult:0N

/ TODO: now read the remote counter back synchronously
counter:0N

/ TODO: send two more bumps of 10, then read the counter again
finalCounter:0N
