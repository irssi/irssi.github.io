---
layout: page
title: "Help: window: split window moving (1.2)"
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
[Help index](/documentation/help/index_(1.2))
</nav>

<nav markdown="1">
[Window subcommands index](/documentation/help/window_(1.2))
</nav>

<nav markdown="1">
[ [v1.1](/documentation/help/window_split_moving) ] - [ v1.2 ]
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">STICK</span> <span class="syn10">[<span class="syn09">&lt;ref#></span>]</span> <span class="syn10">[<span class="syn">ON</span>|<span class="syn">OFF</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">LEFT</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:17ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">RIGHT</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">UP</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DOWN</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>



### Parameters ###


| `STICK`: | Make the currently active window sticky, or stick the window specified by number to the currently visible split window. Or turn off stickyness of the currently active window or the window specified by number. |
| `MOVE LEFT`: | Move the window to the numerically previous location inside the current sticky group. |
| `MOVE RIGHT`: | Move the window to the numerically next location inside the current sticky group. |
| `MOVE UP`: | Move the current window to the sticky group of the previous split window. If no sticky group remains, the split window collapses. |
| `MOVE DOWN`: | Move the current window to the sticky group of the next split window. If no sticky group remains, the split window collapses. |
{:.table.kv}


| `-right`: | Makes the command work on the width instead of height, or create the split window to the right instead of top. |
| `-directional`: | Set the split window in the given direction to the current one active, or move the current window to the sticky group of the split window in the given direction. (If no sticky group remains, the split window collapses.) |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###


### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

