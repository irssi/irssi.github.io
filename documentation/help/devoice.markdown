---
layout: page
title: "Help: devoice"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/devoice.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/modes.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">DEVOICE</span> <span class="synB05">&lt;nicks></span></code></pre></div>



### Parameters ###

A list of nicknames to devoice.

### Description ###

Removes the channel voice privileges from the given nicknames; you may use
the wildcard character '*' in a nickname.

If a channel is moderated, the users will require a voice or op in order to
be able to send messages to the channel.

### Examples ###

    /DEVOICE mike
    /DEVOICE bob sarah
    /DEVOICE jo*n
    /DEVOICE *

### See also ###
[DEOP](/documentation/help/deop/), [MODE](/documentation/help/mode/), [OP](/documentation/help/op/), [VOICE](/documentation/help/voice/)

