# Irssi 1.5

Irssi 1.5 is still under development. It is far away from release, but you can test the version in git.

I may erratically post some news here.

## Useful fixes and features already committed

* Notices to channels have become their own level, similar to MSGS vs PUBLICS there is now NOTICES and PUBNOTICES for your activity and ignore rules

## Major platform changes

* Autotools was removed. Irssi can be built with Meson.

* Some cruft was removed from the code, true colour is now always built, socks is removed, regex.h is removed.

* IRC module is now optional, you can launch Irssi without IRC. It's expected to find bugs in this regard! Also a good topic if someone wants to contribute (for example: move useful commands from IRC => common)

* Github actions builds a termux package

## Potential areas of interest for development

* IRCv3 features(?)

* Improve split window and layout switching and restoration, fix split window bug (window collapsing)

* Support dynamic expandos

* Coherent line meta-data architecture

* Removal and replacement of /recode

* ??? your ideas ???

Also see the unofficial [Roadmap](https://github.com/shabble/irssi-docs/wiki/Roadmap)

(May 2022)
