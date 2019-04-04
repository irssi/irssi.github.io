---
layout: page
title: Design	
---

Irssi's hierarchy is something like this:

```ascidia

        sub1 sub2
           \ /
      xxx  IRC       COMMON ICQ  yyy
       |    |           |    |    |
       '----+-----:-----+----+----'
                  |
                 GUI (gtk/gnome, qt/kde, text, none)
                  |
        sub1 sub2 |
           \ /    |
      xxx  IRC    |  COMMON ICQ  yyy
       '----+-----+-----+----+----'
                  |
              COMMON UI
                  |
        sub1 sub2 |
           \ /    |
      xxx  IRC    |    ICQ  yyy
       |    |     |     |    |
       '----+-----+-----+----'
                  |
                CORE
                /
       lib-config

```
{: .repl #fig1 }

(IRC, ICQ, xxx and yyy are chat protocols ..)

(sub1 and sub2 are submodules of IRC module, like DCC and flood protect)

Chat protocols and frontends are kept in separate modules. Common UI
and GUI modules also have the common parts which don't know anything
about the chat protocols. This should allow implementing modules to
whatever chat protocols and with whatever frontends easily.

## Signals

Communication between different modules are done with "signals". They are
not related to UNIX signals in any way, you could more like think of them
as "events" - which might be a better name for them, but I don't really
want to change it anymore :)

So, you send signal with `signal_emit()` and it's sent to all modules that
have grabbed it by calling `signal_add()` in their init function. For
example:

    signal_emit("mysignal", 1, "hello");

Sends a "mysignal" function with one argument "hello" - before that, you
should have grabbed the signal somewhere else with:


    static void sig_mysignal(const char *arg1)
    {
      /* arg1 contains "hello" */
    }

    signal_add("mysignal", (SIGNAL_FUNC) sig_mysignal);

There are three different `signal_add()` functions which you can use to
specify if you want to grab the signal first, "normally" or last. You can
also stop the signal from going any further.

Emitting signal with it's name creates a small overhead since it has to
look up the signal's numeric ID first, after which it looks up the signal
structure. This is done because if you call a signal _really_ often,
it's faster to find it with it's numeric ID instead of the string. You
can use `signal_get_uniq_id()` macro to convert the signal name into ID -
you'll have to do this only once! - and use `signal_emit_id()` to emit the
signal. Don't bother to do this unless your signal is sent (or could be
sent) several times in a second.

See `src/core/signals.h` for definition of the signal function, and
signals.txt for a list of signals.


## lib-config

Irssi depends on this for reading and saving configuration.
(created by me for irssi)


## CORE module

Provides some functionality that all other modules can use:
  - signal handling
  - keeping list of settings
  - keeping list of /commands
  - keeping track of loaded modules
  - networking functions (with nonblocking connects, IPv6 support)
  - handles connecting to servers
  - raw logging of server's input/output data
  - /EVAL support
  - fgets() like function line_split() without any maximum line limits
  - command line parameter handling
  - miscellaneous useful little functions
  - handles logging


## COMMON UI module

  - knows basics about windows and window items (=channels, queries, ..)
  - printtext() - parsing texts and feeding it for GUI to print.
  - themes
  - translation tables
  - text hilighting
  - command history
  - user interface (/commands) for CORE's functionality


## GUI modules

  - all the rest of the functionality needed for a working client.


## IRC module

  * CORE
    - IRC specific /commands
    - flood protecting commands sent to server
    - creating IRC masks based on nick/address for bans, ignores, etc.
    - keeps list of channels, nicks, channel modes, bans, etc.
    - keeps list of servers, server settings, irc networks,
      server reconnections and irc network splits
    - redirection of commands' replies
    - lag detection
    - ctcp support and flood protection
    - Handles ignoring people

  * DCC
    - DCC chat, send and get

  * FLOOD
    - detects private or channel flooding and sends "flood" signal
    - automatic ignoring when flooding

  * NOTIFYLIST
    - handles notifylist


## IRC UI module

  - placing channels and queries in windows
  - nick completion
  - printing infomation of some events

<script src="/assets/js/prerenderimg.js"></script>
