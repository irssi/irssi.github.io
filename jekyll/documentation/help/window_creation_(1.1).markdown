---
layout: page
title: "Help: window/split window creation (1.1)"
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

<div markdown="1" class="version">
* v1.1
* [v1.2](/documentation/help/window_creation)
</div>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">NEW</span> <span class="syn10">[<span class="syn">HIDDEN</span>|<span class="syn">SPLIT</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">CLOSE</span> <span class="syn10">[<span class="syn09">&lt;first></span> <span class="syn14">[<span class="syn13">&lt;last></span>]</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LIST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">HIDE</span> <span class="syn10">[<span class="syn09">&lt;number></span>|<span class="syn09">&lt;name></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">SHOW</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>



### Parameters ###


| `NEW`: | Creates a new hidden or split window. |
| `CLOSE`: | Closes the current window, the specified one or all windows in the given range. |
| `LIST`: | List all the windows. |
| `HIDE`: | Hides the current split window, or the split window specified by number or item name. |
| `SHOW`: | Show the window specified by number or item name as a new split windows. It is made sticky when autostick_split_windows is turned on. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###

    /WINDOW CLOSE
    /WINDOW NEW HIDDEN

### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

