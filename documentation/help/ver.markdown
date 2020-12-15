---
layout: page
title: "Help: ver"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/ver.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/irc/fe-irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">VER</span> <span class="syn10">[<span class="syn09">&lt;nick></span> | <span class="syn09">&lt;channel></span> | <span class="syn">*</span>]</span></code></pre></div>



### Parameters ###

A nickname, channel or the wildcard character '*'.

### Description ###

Send a CTCP VERION request to the target nickname, channel or to all the
users on the channel.

### Examples ###

    /VER *
    /VER #irssi
    /VER mike

### See also ###
[CTCP](/documentation/help/ctcp/)

