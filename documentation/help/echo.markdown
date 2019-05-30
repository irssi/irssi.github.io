---
layout: page
title: "Help: echo"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/echo.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-core-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

<nav markdown="1">
[ v1.2 ] - [ [v1.3](/documentation/help/echo_(1.3)) ]
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">ECHO</span> <span class="syn10">[<span class="syn">-current</span>]</span> <span class="syn10">[<span class="syn">-window</span> <span class="syn09">&lt;name></span>]</span> <span class="syn10">[<span class="syn">-level</span> <span class="syn09">&lt;level></span>]</span> <span class="synB05">&lt;text></span></code></pre></div>



### Parameters ###


| `-current`: |     Displays the output in the active window. |
| `-window`: |      Displays the output in the target window. |
| `-level`: |       Displays the output with a given message level. |
{:.table.kv}

The text output; if no target is given, the active window will be used.

### Description ###

Displays the given text.

### Examples ###

    /ECHO 1 + 1 = 2 :D
    /ECHO -current Testing the ECHO command
    /ECHO -window #irssi Special variables such as ${N} will not be expanded.

### See also ###
[CAT](/documentation/help/cat), [EVAL](/documentation/help/eval), [EXEC](/documentation/help/exec), [LEVELS](/documentation/help/levels)

