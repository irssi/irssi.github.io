---
layout: page
title: "Help: window moving/number changing"
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

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">NUMBER</span> <span class="syn10">[<span class="syn">-sticky</span>]</span> <span class="synB05">&lt;number></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">PREV</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">NEXT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">FIRST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">LAST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;direction></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">LEFT</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:17ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">RIGHT</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>



### Parameters ###


| `NUMBER`: | Change the active window number to the specified number, swapping the window already in that place if required. With -sticky, protect the window number from renumbering done by windows_auto_renumber. (To re-set the sticky attribute, use WINDOW NUMBER again without -sticky.) |
| `MOVE PREV`: | Move the window to the place of the numerically previous window. At the first position, move the window to the end and renumber the consecutive block that it was part of. |
| `MOVE NEXT`: | Move the window to the place of the numerically next window. At the last position, move the window to the first position and renumber the consecutive block at first position (if any) |
| `MOVE FIRST`: | Move the window to the first position. Any windows inbetween are moved to their numerically next positions. |
| `MOVE LAST`: | Move the window to the last position. Any windows inbetween are moved to their numerically previous positions. |
| `MOVE`: | Move the window to the specified number or the first number that is in use when moving the window in the direction of the specified position. Any windows inbetween are shifted towards the old position of the window (unused positions remain empty) |
| `MOVE LEFT`: | Move the window to the numerically previous location inside the current sticky group. |
| `MOVE RIGHT`: | Move the window to the numerically next location inside the current sticky group. |
{:.table.kv}


| `-directional`: | Set the split window in the given direction to the current one active, or move the current window to the sticky group of the split window in the given direction. (If no sticky group remains, the split window collapses.) |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###


### See also ###
[JOIN](/documentation/help/join/), [LEVELS](/documentation/help/levels/), [LOG](/documentation/help/log/), [QUERY](/documentation/help/query/)

