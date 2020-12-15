---
layout: page
title: "Help: voice"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/voice.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/modes.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">VOICE</span> <span class="synB05">&lt;nicks></span></code></pre></div>



### Parameters ###

A list of nicknames to voice.

### Description ###

Grants the channel voice privileges to the given nicknames; you may use
the wildcard character '*' in a nickname.

### Examples ###

    /VOICE mike
    /VOICE bob sarah
    /VOICE jo*n
    /VOICE *

### See also ###
[DEOP](/documentation/help/deop/), [DEVOICE](/documentation/help/devoice/), [KICK](/documentation/help/kick/), [MODE](/documentation/help/mode/), [OP](/documentation/help/op/)

