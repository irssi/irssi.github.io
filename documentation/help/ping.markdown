---
layout: page
title: "Help: ping"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/ping.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">PING</span> <span class="syn10">[<span class="syn09">&lt;nick></span> | <span class="syn09">&lt;channel></span> | <span class="syn">*</span>]</span></code></pre></div>



### Parameters ###

The nickname or channel to ping, you can use the asterisk '*' character to
ping every user on a channel.

### Description ###

Sends a CTCP PING request to a nickname or a channel; this is used to find
out the latency on the network.

### Examples ###

    /PING bob
    /PING #irssi

### See also ###
[CTCP](/documentation/help/ctcp/), [MSG](/documentation/help/msg/)

