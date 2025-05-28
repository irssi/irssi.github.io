# Scripting

Documentation about scripting could be improved. In the mean time, the
following resources might help.

## Irssi Perl scripts

- [Scripting Tutorial](https://juerd.nl/site.plp/irssiscripttut), by Juerd

  this (dated) resource contains a simple tutorial to making a "Hello,
  World!" script with a script header. Its style is not quite
  following Modern Perl, so it's best combined with some modern Perl
  knowledge.

- [Perl Scripting Reference](https://codeberg.org/irssi/irssi/src/branch/master/docs/perl.txt)

  the most official Perl scripting documentation produced so far, it
  contains a short introduction to signals and a `/hello` command
  example. Furthermore, it aims to list all available functions as
  well as explain some of the object hash' contents that one can
  use.

- [Signals](https://codeberg.org/irssi/irssi/src/branch/master/docs/signals.txt)

  signals are all of the events that happen in Irssi which one can
  react to, using the `Irssi::signal_add` family of functions. This
  list can help to discover the available signals and their
  parameters.  Unfortunately, it's sometimes still hard to know what
  signal one needs.

- (Unofficial) [Irssi Scripting and Documentation Wiki](https://github.com/shabble/irssi-docs/wiki)

  the unofficial wiki was an attempt to improve the (scripting)
  documentation. It was last updated in 2014 but might still contain
  some useful information (and maybe some outdated).

Furthermore, one could look at the existing scripts to see how they do
things, but their quality may vary.

## Irssi Python scripts

The Python module is supposed to be modeled after the Perl scripting,
however it is also in low maintenance mode.

- [Module documentation](https://github.com/irssi-import/irssi-python/blob/py3/docs/irssi-python.html)

  the most official Python documentation produced so far is this
  auto-generated module documentation.

  Unlike Perl, Python might have embedded help:

      /py exec import irssi;help(irssi.Window)

- [Sample scripts](https://github.com/irssi-import/irssi-python/blob/py3/scripts)

## Irssi Tcl scripts

The (third party) Tcl module is *not* modeled after the Perl or Python
scripting. It only implements the `send_text` and `message public`
signals and only a small subset of the other Irssi API. With a little
bit of C skills it could be extended to cover more Irssi signals.

- https://github.com/horgh/irssi-tcl
- [Irssi-Tcl scripting reference](https://github.com/horgh/irssi-tcl/blob/master/docs/scripting.md)
