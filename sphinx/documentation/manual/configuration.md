# Configuration

## Configuration files

The configuration is saved to `~/.irssi/config` file. You can edit
it with text editor if you want, you can also add comments to it
and they stay there even if `/SAVE` is used. Comments are the lines
starting with `#` character. Any errors in config file are displayed
at startup.

Irssi uses it's own config library for handling the config file.
The format is pretty much the same as in libPropList and should be
easily understandable.

You can reload the config file on the fly with `/RELOAD` command, you
can also read a different config file with `/RELOAD <filename>`.

If you change any settings, they aren't saved to file until you use
`/SAVE`. You can save the config file to different place with
`/SAVE <filename>`.

## Settings

You can view or change the settings with `/SET` command.

`/SET` without any arguments displays all the settings.
`/SET <key>` displays settings which key (partly) matches `<key>`
`/SET <key> <value>` sets `<key>` to `<value>`

Boolean settings accepts only values `ON`, `OFF` and `TOGGLE`. You can
also use `/TOGGLE` command to change them, so `/TOGGLE <key>` behaves
like `/SET <key> TOGGLE`. `/TOGGLE` also accepts arguments `ON` and `OFF`,
then `/TOGGLE` behaves exactly like `/SET`.

Remember that changes are not saved until you use `/SAVE`, or until
the periodic auto-save, or on `/QUIT` when auto-save is enabled.
