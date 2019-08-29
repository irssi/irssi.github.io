---
title: "Historical &ndash; Upgrade Information"
layout: post
---

### 0.8.8 -> 0.8.9

No changes needed

### 0.8.6 -> 0.8.8

There are some changes in configuration file, but they should be converted
automatically. In general there's new setting types: time, size and level.
Time and size settings need to be used a bit differently now than before:

- Time settings can have units: `days`, `hours`, `mins`, `secs`, `milliseconds` (or
  `msecs`). The units can be combined and written in shorter form as well, for example 
  `5d 30m 10ms`
- Size settings can have units: `gbytes`, `mbytes`, `kbytes`, `bytes`. They can be
  written in shorter form as well, eg. `gb` or `g`.

### 0.8.x -> 0.8.6

No changes needed

### 0.7.98 -> 0.8.x

Default aliases still aren't updated, so change these in your config file
in the aliases = { ... } section:

    W = "who";
    N = "names";
    SV = "say Irssi $J ($V) - http://irssi.org/";

Add these new aliases:

    CHAT = "dcc chat";
    RUN = "SCRIPT LOAD";
    UPTIME = "eval exec - expr `date +%s` - \\$F | awk '{print \"Irssi uptime: \"int(\\\\\\$1/3600/24)\"d \"int(\\\\\\$1/3600%24)\"h \"int(\\\\\\$1/60%60)\"m \"int(\\\\\\$1%60)\"s\" }'";
    CALC = "exec - if which bc &>/dev/null\\; then echo '$*' | bc | awk '{print \"$*=\"$$1}'\\; else echo bc was not found\\; fi";
    SBAR = "STATUSBAR";
    INVITELIST = "mode $C +I";

Or if you don't bother changing all of these, at least say `/ALIAS
run script load` so you can load your perl scripts with /RUN.

Keyboard bindings have changed. Before you had CTRL-x and ALT-x. Now you
should use instead ^X and meta-x (NOTE: case-sensitive!).

There's a whole new statusbar code which allows statusbar scripts. Because
of this, /SET mail_counter has been moved to
[mail.pl](http://scripts.irssi.org#q=mail.pl) script. See the last chapter of
[startup-HOWTO](/documentation/startup) for
more information of how to use statusbar scripts.

Note that quite a many 0.7.98 scripts don't work because of the new server
redirection code. You'll need to get newer versions of them.

/SET msgs_timestamps setting is replaced by /SET timestamp_level setting.
So, if you want the timestamps to be visible only with private messages, use
`/SET timestamps ON`, `/SET timestamp_level MSGS`.
