#ifndef NDC_TTY_H
#define NDC_TTY_H

#include <ttypt/ndc.h>
#include <ttypt/ndx.h>

/** Open a PTY and exec argv on fd. argv[0]==NULL uses the user's login shell. */
NDX_DECL(int, ndc_tty_exec, socket_t, fd, char **, argv);

/** Open a PTY shell (login shell) on fd. */
NDX_DECL(int, ndc_tty_shell, socket_t, fd);

#endif
