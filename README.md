# ndc-tty
> WebSocket PTY multiplexer module for libndc

A dynamic module for [ndc](https://github.com/tty-pt/ndc) that adds:

- WebSocket-to-PTY bridging (browser terminal sessions)
- Telnet negotiation (NAWS window resize, ECHO, SGA)
- Browser terminal JS/CSS assets (`ndc.js`, `ndc.css`, `ndc-tty.js`)
- `sh` command handler — spawns a login shell over WebSocket

## Quick Start

```sh
# Run ndc with the mux module loaded
ndc -d -A -p 8080 -m libndc-tty
```

### Command Line Options (inherited from ndc)

| Option | Description |
|--------|-------------|
| `-m PATH` | Load module from PATH (colon-separated list) |
| `-A` | Auto-authenticate all WebSocket connections |
| `-p PORT` | HTTP/WS listen port |
| `-C PATH` | Change directory before starting |
| `-d` | Don't detach (run in foreground) |

## NPM for Web Terminal

Install the package:

```sh
npm install @tty-pt/libndc-tty
```

JavaScript/TypeScript API:

```js
import { create } from "@tty-pt/libndc-tty";

// Create terminal instance
const term = create(document.getElementById("terminal"), {
  proto: "ws",        // or "wss" for secure
  port: 4201,
  sub: {
    onOpen: (term, ws) => {
      console.log("Connected to server");
    },
    onClose: (ws) => {
      console.log("Disconnected, reconnecting...");
    },
    onMessage: (ev, arr) => {
      // Return true to continue default processing
      return true;
    },
    cols: 80,
    rows: 25,
  },
  debug: false,
});
```

See `types/ndc.d.ts` for full TypeScript definitions.

## C API

```c
#include <ttypt/ndc-tty.h>

// Spawn login shell on a WebSocket connection
call_ndc_mux_shell(fd);

// Spawn specific command
char *argv[] = { "/bin/bash", NULL };
call_ndc_mux_exec(fd, argv);
```

## Building

```sh
make
sudo make install
```

Requires `libndc` and `libndx`.

## Documentation

- API: `include/ttypt/ndc-tty.h`
- pkg-config: `libndc-tty.pc`

---

**Installation**: See [install docs](https://github.com/tty-pt/ci/blob/main/docs/install.md)  
**Entry points**: `src/libndc-tty.c` (native), `ndc-cli.js` (npm)
