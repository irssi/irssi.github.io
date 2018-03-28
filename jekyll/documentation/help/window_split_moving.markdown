---
layout: page
title: "Help: window: split window moving"
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

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">STICK</span> <span class="syn10">[<span class="syn09">&lt;ref#></span>]</span> <span class="syn10">[<span class="syn">ON</span>|<span class="syn">OFF</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DLEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:17ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DRIGHT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">UP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DOWN</span></code></pre></div>



### Parameters ###


| `STICK`: | Make the currently active window sticky, or stick the window specified by number to the currently visible split window. Or turn off stickyness of the currently active window or the window specified by number. |
| `MOVE UP`: | Move the current window to the sticky group of the split window above. If no sticky group remains, the split window collapses. |
| `MOVE DOWN`: | Move the current window to the sticky group of the split window below. If no sticky group remains, the split window collapses. |
| `MOVE DLEFT`: | Move the current window to the sticky group of the split window to the left. If no sticky group remains, the split window collapses. |
| `MOVE DRIGHT`: | Move the current window to the sticky group of the split window to the right. If no sticky group remains, the split window collapses. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###


### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

