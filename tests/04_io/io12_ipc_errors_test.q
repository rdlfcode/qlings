\l tests/harness.q
srv:.qlings.spawn"tests/servers/mkt.q";
PORT:srv`port;
.qlings.load[];
.qlings.chk["the remote error text came back";"kaboom";{failed}];
.qlings.chk["the connection survived it";4;{stillAlive}];
.qlings.chk["a refused connection is trappable";`refused;{refused}];
.qlings.reap srv;
.qlings.done[];
