---
layout: page
title: "Help: wallops"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/wallops.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">WALLOPS</span> <span class="synB05">&lt;message></span></code></pre></div>



### Parameters ###

The message to broadcast.

### Description ###

Sends a network wide message to all the users which have the usermode 'w'
enabled; this command is restricted to IRC operators.

### Examples ###

    /WALLOPS Hi everybody!

### See also ###
[OPER](/documentation/help/oper/), [STATS](/documentation/help/stats/)

