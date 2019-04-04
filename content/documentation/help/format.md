---
layout: page
title: "Help: format"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/format.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/themes.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">FORMAT</span> <span class="syn10">[<span class="syn">-delete</span> | <span class="syn">-reset</span>]</span> <span class="syn10">[<span class="syn09">&lt;module></span>]</span> <span class="syn10">[<span class="syn09">&lt;key></span> <span class="syn14">[<span class="syn13">&lt;value></span>]</span>]</span></code></pre></div>



### Parameters ###


| `-reset`: |      Restores the original value. |
| `-delete`: |     Removes the format from the configuration. |
{:.table.kv}

The module name, the format name and the value; if no arguments are given,
the list of formats are displayed.

### Description ###

Allows you to reconfigure the way messages are displayed.

### Examples ###

    /FORMAT irc away You have left planet earth
    /FORMAT core not_good_idea I'm sorry sir, this broke my irony sensor; add -YES if you really mean it!
    /FORMAT -reset irc away

### See also ###
[RELOAD](/documentation/help/reload), [SAVE](/documentation/help/save), [SET](/documentation/help/set)

