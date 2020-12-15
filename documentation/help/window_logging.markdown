---
layout: page
title: "Help: window: logging"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/window.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-log.c
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/window-commands.c
- https://github.com/irssi/irssi/blob/master/src/fe-text/mainwindows.c
- https://github.com/irssi/irssi/blob/master/src/fe-text/textbuffer-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

<nav markdown="1">
[Window subcommands index](/documentation/help/window/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LOG</span> <span class="synB">on</span>|<span class="synB">off</span>|<span class="synB">toggle</span> <span class="syn10">[<span class="syn09">&lt;filename></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">LOGFILE</span> <span class="synB05">&lt;file></span></code></pre></div>



### Parameters ###


| `LOG`: | Turn on or off logging of the active window, optionally specifying the log file to use. |
| `LOGFILE`: | Sets the location of the log file to use for window logging without starting to log. |
{:.table.kv}


   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###

    /WINDOW LOG OFF
    /WINDOW LOG ON ~/logs/debug.log
    /WINDOW LOGFILE ~/logs/notices.log

### See also ###
[JOIN](/documentation/help/join/), [LEVELS](/documentation/help/levels/), [LOG](/documentation/help/log/), [QUERY](/documentation/help/query/)

