---
layout: page
title: "Help: window attribute manipulation"
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

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">LEVEL</span> <span class="syn10">[<span class="syn09">&lt;level></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">IMMORTAL</span> <span class="synB">on</span>|<span class="synB">off</span>|<span class="synB">toggle</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">SERVER</span> <span class="syn10">[<span class="syn">-sticky</span> | <span class="syn">-unsticky</span>]</span> <span class="synB05">&lt;tag></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">NUMBER</span> <span class="syn10">[<span class="syn">-sticky</span>]</span> <span class="synB05">&lt;number></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">NAME</span> <span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">HISTORY</span> <span class="syn10">[<span class="syn">-clear</span>]</span> <span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">THEME</span> <span class="syn10">[<span class="syn">-delete</span>]</span> <span class="syn10">[<span class="syn09">&lt;name></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">STICK</span> <span class="syn10">[<span class="syn09">&lt;ref#></span>]</span> <span class="syn10">[<span class="syn">ON</span>|<span class="syn">OFF</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">HIDELEVEL</span> <span class="syn10">[<span class="syn09">&lt;level></span>]</span></code></pre></div>



### Parameters ###


| `LEVEL`: | Changes the text levels to display in the window, or query the current level. |
| `IMMORTAL`: | Modifies or queries the window mortality status. Immortal windows have an extra protection against WINDOW CLOSE. |
| `SERVER`: | Change the active server of the window or the server stickyness. If the server is sticky, it cannot be cycled with next_window_item/previous_window_item |
| `NUMBER`: | Change the active window number to the specified number, swapping the window already in that place if required. With -sticky, protect the window number from renumbering done by windows_auto_renumber. (To re-set the sticky attribute, use WINDOW NUMBER again without -sticky.) |
| `NAME`: | Change or clear the window name. Window names must be unique. |
| `HISTORY`: | Set or clear a specific named history to use for this window. All windows with the same named history will share a history. |
| `THEME`: | Applies or removes a per-window theme. |
| `STICK`: | Make the currently active window sticky, or stick the window specified by number to the currently visible split window. Or turn off stickyness of the currently active window or the window specified by number. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###

    /WINDOW LEVEL -ALL +NOTICES

### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

