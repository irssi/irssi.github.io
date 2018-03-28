---
layout: page
title: "Help: window items"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/window.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-log.c
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/window-commands.c
- https://github.com/irssi/irssi/blob/master/src/fe-text/mainwindows.c
- https://github.com/irssi/irssi/blob/master/src/fe-text/textbuffer-commands.c


{% endcomment %}
[Help index](/documentation/help)

[Window subcommands index](/documentation/help/window)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">PREV</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">NEXT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">GOTO</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">MOVE</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>



### Parameters ###


| `ITEM PREV`: | Make the previous item in this window active. |
| `ITEM NEXT`: | Make the next item in this window active. |
| `ITEM GOTO`: | Change to the query with the specified nickname, channel with the given name or window item number. |
| `ITEM MOVE`: | Move the active window item to another window, or move the channel or query item specified by their name to the current window. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###

    /WINDOW ITEM MOVE 10

### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

