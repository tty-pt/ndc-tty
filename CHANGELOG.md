## [v1.0.1] - 2026-04-12

- TTY/PTY functionality extracted from ndc core into this standalone module.
- **New:** `ndc_tty_exec(fd, argv)` — replaces `ndc_pty(fd, args)` from ndc core; opens a PTY and execs `argv` on `fd`. `argv[0] == NULL` uses the user's login shell.
- **New:** `ndc_tty_shell(fd)` — replaces `do_sh`; opens a PTY login shell on `fd`.
