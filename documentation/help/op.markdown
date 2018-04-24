---
layout: page
title: "Help: op"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/op.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/modes.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:2ch"><code><span class="synB">OP</span> <span class="synB05">&lt;nicks></span></code></pre></div>



### Parameters ###

A list of nicknames to op.

### Description ###

Grants the channel operator privileges to the given nicknames; you may use
the wildcard character '*' in a nickname.

### Examples ###

    /OP mike
    /OP bob sarah
    /OP jo*n
    /OP *

### See also ###
[DEOP](/documentation/help/deop), [DEVOICE](/documentation/help/devoice), [KICK](/documentation/help/kick), [MODE](/documentation/help/mode), [VOICE](/documentation/help/voice)

