---
layout: page
title: "Help: invite"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/invite.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">INVITE</span> <span class="synB05">&lt;nick></span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span></code></pre></div>



### Parameters ###

The nickname to invite and the channel to invite him or her to; if no
channel is given, the active channel will be used.

### Description ###

Invites the specified nick to a channel.

### Examples ###

    /INVITE mike
    /INVITE bob #irssi

### See also ###
[MODE](/documentation/help/mode/), [WHOIS](/documentation/help/whois/)

