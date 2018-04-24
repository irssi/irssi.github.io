---
layout: page
title: "Help: window changing"
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
[Help index](/documentation/help)
</nav>

<nav markdown="1">
[Window subcommands index](/documentation/help/window)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">REFNUM</span> <span class="synB05">&lt;number></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">GOTO</span> <span class="synB">active</span>|<span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">NEXT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LAST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">PREVIOUS</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">RIGHT</span></code></pre></div>



### Parameters ###


| `REFNUM`: | Go to the window with the given number. |
| `GOTO`: | Go to the window with activity, with the given nickname, channel or with the specified number. |
| `NEXT`: | Go to the next window numerically. |
| `LAST`: | Go to the previously active window. |
| `PREVIOUS`: | Go to the previous window numerically. |
| `LEFT`: | Go to the previous window numerically that is part of the current sticky group (or not part of any sticky group). |
| `RIGHT`: | Go to the next window numerically that is part of the current sticky group (or not part of any sticky group). |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###

    /WINDOW GOTO 15
    /WINDOW GOTO ACTIVE
    /WINDOW GOTO mike
    /WINDOW GOTO #irssi

### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

