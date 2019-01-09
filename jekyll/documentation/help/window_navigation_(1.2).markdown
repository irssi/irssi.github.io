---
layout: page
title: "Help: window: split window navigation (1.2)"
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
[ [v1.1](/documentation/help/window_navigation) ] - [ v1.2 ]
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">WINDOW</span> <span class="synB">UP</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">DOWN</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">LEFT</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">RIGHT</span> <span class="syn10">[<span class="syn">-directional</span>]</span></code></pre></div>



### Parameters ###


| `UP`: | Set the split window left or above the current one active. At the top, wraps to the bottom. |
| `DOWN`: | Set the split window right or below the current one active. At the bottom, wraps teft. |
| `LEFT`: | Go to the previous window numerically that is part of the current sticky group (or not part of any sticky group). |
| `RIGHT`: | Go to the next window numerically that is part of the current sticky group (or not part of any sticky group). |
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

