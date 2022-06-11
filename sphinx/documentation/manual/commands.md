# Text input and commands

The input line (statusbar item `input` in the `prompt` status bar)
shows the text cursor and takes your command and text input. Irssi is
controlled through commands that you type into the input line.

## Commands

Any char in the `cmdchars` setting can begin a command. The default
`cmdchars` is the slash: `/`. The syntax for a command is the
following:

    <CMDCHAR>[<CMDCHAR>][^]<DATA>

If `<CMDCHAR>` is repeated two times, alias expansion is
disabled, enabled otherwise. If `^` is present, command output
is disabled. If `<DATA>` begins with a space, command lookup is
inhibited and the data is sent to the active window item
(useful to send a line that begins with `<CMDCHAR>`).

## Text input

Any input that does *not* start with a cmdchar are sent as input to
the currently active window item, for everyone or your partner to see
in a channel or query. This includes lines that start with a space
followed by `<CMDCHAR>`!

To purposefully send an actual text that starts with a cmdchar, type

    <CMDCHAR><Space><CMDCHAR>rest of the text...

