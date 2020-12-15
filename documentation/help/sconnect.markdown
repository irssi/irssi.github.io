---
layout: page
title: "Help: sconnect"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/sconnect.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">SCONNECT</span> <span class="synB05">&lt;new server></span> <span class="syn10">[<span class="syn14">[<span class="syn13">&lt;port></span>]</span> <span class="syn09">&lt;existing server></span>]</span></code></pre></div>



### Parameters ###

The server to connect to, the connection port and the remote server that
initiates the connection attempt.

If no remote server is given, the server you are currently connected to will
be used.

### Description ###

Connect a server to the IRC network; this command is restricted to IRC
operators.

### Examples ###

    /SCONNECT ircsource.irssi.org
    /SCONNECT ircsource.irssi.org 6667 be.hub

### See also ###
[DIE](/documentation/help/die/), [KILL](/documentation/help/kill/), [OPER](/documentation/help/oper/), [RESTART](/documentation/help/restart/), [SQUIT](/documentation/help/squit/)

