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

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">WINDOW</span> <span class="synB">UP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">WINDOW</span> <span class="synB">DUP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">DLEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">DOWN</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">DDOWN</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">DRIGHT</span></code></pre></div>



### Parameters ###


| `UP`: | Set the split window left or above the current one active. At the top, wraps to the bottom. |
| `DOWN`: | Set the split window right or below the current one active. At the bottom, wraps to the top. |
| `DUP`: | Set the split window above the current one active. At the top, wraps to the bottom. |
| `DDOWN`: | Set the split window below the current one active. At the bottom, wraps to the top. |
| `DLEFT`: | Set the split window left to the current one active. At the left, wraps to the right. |
| `DRIGHT`: | Set the split window right to the current one active. At the right, wraps to the left. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###


### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

