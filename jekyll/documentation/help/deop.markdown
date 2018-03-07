---
layout: page
title: "Help: deop"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/deop.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/modes.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">DEOP</span> <span class="synB05">&lt;nicks></span></code></pre></div>



### Parameters ###

A list of nicknames to deop.

### Description ###

Removes the channel operator privileges from the given nicknames; you may
use the wildcard character '*' in a nickname.

### Examples ###

    /DEOP mike
    /DEOP bob sarah
    /DEOP jo*n
    /DEOP *

### See also ###
[DEVOICE](/documentation/help/devoice), [MODE](/documentation/help/mode), [OP](/documentation/help/op), [VOICE](/documentation/help/voice)

