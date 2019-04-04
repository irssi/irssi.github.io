---
layout: page
title: "Help: window: split window resizing (1.1)"
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
[Help index](/documentation/help/index_(1.1))
</nav>

<nav markdown="1">
[Window subcommands index](/documentation/help/window_(1.1))
</nav>

<nav markdown="1">
[ v1.1 ] - [ [v1.2](/documentation/help/window_resizing) ]
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">GROW</span> <span class="syn10">[<span class="syn09">&lt;lines></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">SHRINK</span> <span class="syn10">[<span class="syn09">&lt;lines></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">SIZE</span> <span class="synB05">&lt;lines></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">BALANCE</span></code></pre></div>



### Parameters ###


| `GROW`: | Increase the size of the active split window by the specified number of lines. |
| `SHRINK`: | Decrease the size of the active split window by the specified number of lines. |
| `SIZE`: | Set the current split window size to the specified numer of lines. |
| `BALANCE`: | Balance the heights of all split windows. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###


### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

