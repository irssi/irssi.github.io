---
layout: page
title: "Help: reload"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/reload.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-settings.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">RELOAD</span> <span class="syn10">[<span class="syn09">&lt;file></span>]</span></code></pre></div>



### Parameters ###

The filename of any Irssi configuration; if no parameter is given, the
active configuration file will be used.

### Description ###

Reloads the Irssi configuration file.

### Examples ###

    /RELOAD
    /RELOAD ~/test.irssi.conf

### See also ###
[SAVE](/documentation/help/save/)

