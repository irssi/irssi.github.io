---
layout: page
title: "Help: window: split window navigation (1.1)"
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
[Help index](/documentation/help/index_(1.1)/)
</nav>

<nav markdown="1">
[Window subcommands index](/documentation/help/window_(1.1)/)
</nav>

<div markdown="1" class="version">
* v1.1
* [v1.2](/documentation/help/window_navigation/)
</div>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">WINDOW</span> <span class="synB">UP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">DOWN</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">RIGHT</span></code></pre></div>



### Parameters ###


| `UP`: | Set the split window above the current one active. At the top, wraps to the bottom. |
| `DOWN`: | Set the split window below the current one active. At the bottom, wraps to the top. |
| `LEFT`: | Go to the previous window numerically that is part of the current sticky group (or not part of any sticky group). |
| `RIGHT`: | Go to the next window numerically that is part of the current sticky group (or not part of any sticky group). |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###


### See also ###
[JOIN](/documentation/help/join/), [LEVELS](/documentation/help/levels/), [LOG](/documentation/help/log/), [QUERY](/documentation/help/query/)

