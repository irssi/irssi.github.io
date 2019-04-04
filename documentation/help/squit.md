---
layout: page
title: "Help: squit"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/squit.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">SQUIT</span> <span class="synB05">&lt;server></span>|<span class="synB05">&lt;mask></span> <span class="synB05">&lt;reason></span></code></pre></div>



### Parameters ###

The server and the disconnect reason.

### Description ###

Disconnects a server from the IRC network; this command is restricted to
    IRC operators.

### Examples ###

    /SQUIT ircsource.irssi.org I'm fixing a desync!

### See also ###
[DIE](/documentation/help/die), [OPER](/documentation/help/oper), [SCONNECT](/documentation/help/sconnect)

