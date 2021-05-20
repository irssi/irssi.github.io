---
layout: page
title: "Help: disconnect"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/disconnect.in
- https://github.com/irssi/irssi/blob/master/src/core/chat-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">DISCONNECT</span> <span class="synB">*</span>|<span class="synB05">&lt;tag></span> <span class="syn10">[<span class="syn09">&lt;message></span>]</span></code></pre></div>



### Parameters ###

The network to disconnect from and the message to advertise; if no
parameters are given, the active server will be used.

### Description ###

Disconnects from an IRC server; the list of all the servers you are
connected to can be retrieved via the SERVER command.

Use the wildcard character '*' if you want to disconnect from the active
server.

### Examples ###

    /DISCONNECT liberachat I'm off for today, take care!
    /DISCONNECT * Vacation time :D
    /DISCONNECT

### See also ###
[CONNECT](/documentation/help/connect), [SERVER](/documentation/help/server)

