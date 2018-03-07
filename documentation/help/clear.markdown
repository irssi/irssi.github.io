---
layout: page
title: "Help: clear"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/clear.in
- https://github.com/irssi/irssi/blob/master/src/fe-text/textbuffer-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">CLEAR</span> <span class="syn10">[<span class="syn">-all</span>]</span> <span class="syn10">[<span class="syn09">&lt;refnum></span>]</span></code></pre></div>



### Parameters ###


| `-all`: |     Clear all the windows |
{:.table.kv}

The window number to clear; if no argument is given, the active window
will be used.

### Description ###

Scrolls up the text in the window and fills the window with blank lines; you
may want to use this to make new text start at the top of the window again.

### See also ###
[REDRAW](/documentation/help/redraw), [SCROLLBACK](/documentation/help/scrollback), [CLEAR](/documentation/help/clear)

