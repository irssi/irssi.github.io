---
layout: page
title: "Help: scrollback"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/scrollback.in
- https://github.com/irssi/irssi/blob/master/src/fe-text/textbuffer-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">SCROLLBACK</span> <span class="synB">CLEAR</span> <span class="syn10">[<span class="syn">-all</span>]</span> <span class="syn10">[<span class="syn09">&lt;refnum></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:21ch"><code><span class="synB">SCROLLBACK</span> <span class="synB">LEVELCLEAR</span> <span class="syn10">[<span class="syn">-all</span>]</span> <span class="syn10">[<span class="syn">-level</span> <span class="syn09">&lt;level></span>]</span> <span class="syn10">[<span class="syn09">&lt;refnum></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">SCROLLBACK</span> <span class="synB">GOTO</span> <span class="synB05">&lt;+|-linecount></span>|<span class="synB05">&lt;linenum></span>|<span class="synB05">&lt;timestamp></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">SCROLLBACK</span> <span class="synB">HOME</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:-2ch"><code><span class="synB">SCROLLBACK</span> <span class="synB">END</span></code></pre></div>



### Parameters ###


| `CLEAR`: |          Clears the screen and the buffer of all text. |
| `LEVELCLEAR`: |     Clears the screen and the buffer of text matching the given levels. |
| `GOTO`: |           Go to the given position. |
| `HOME`: |           Go to the start of the buffer. |
| `END`: |            Go to the end of the buffer. |
{:.table.kv}


| `-all`: |           Applies to all windows instead of only the active one. |
| `-level`: |         The levels, separated by a comma, to match. |
{:.table.kv}

The line number, timestamp to jump to or the window reference number to
clear.

### Description ###

Manipulate the text in the window to go to a to the given line number, or
clear the buffers.

The timestamp format is format is '[dd[.mm] | -&lt;days ago>] hh:mi[:ss]'.

### Examples ###

    /SCROLLBACK CLEAR
    /SCROLLBACK LEVELCLEAR -level NOTICES
    /SCROLLBACK GOTO 100
    /SCROLLBACK HOME
    /SCROLLBACK END

### See also ###
[CLEAR](/documentation/help/clear), [WINDOW](/documentation/help/window)

