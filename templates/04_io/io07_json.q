/ io07_json -- talking to everything else
/
/ `.j.j x` renders a q value as JSON text and `.j.k` parses it back.
/ The round trip is LOSSY, because JSON has fewer types than q: every
/ number comes back as a float, and symbols come back as strings. If you
/ need the original types you have to cast them back yourself.
/
/ I AM NOT DONE

original:`a`b!(1 2;`hello)

/ TODO: render `original` as JSON text
text:()

/ TODO: parse the text back
parsed:()!()

/ TODO: the numbers came back as floats -- cast parsed`a back to longs
asLongs:()

/ TODO: the symbol came back as a string -- cast it back to a symbol
asSymbol:`todo
