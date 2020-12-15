---
layout: page
title: "Help: reconnect"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/reconnect.in
- https://github.com/irssi/irssi/blob/master/src/core/servers-reconnect.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">RECONNECT</span> <span class="synB05">&lt;tag></span> <span class="syn10">[<span class="syn09">&lt;quit message></span>]</span></code></pre></div>



### Parameters ###

The network tag and message to advertise; if no arguments are given, the
active server and default message will be used.

### Description ###

Disconnect and reconnect from a network.

### Examples ###

    /RECONNECT
    /RECONNECT Freenode
    /RECONNECT EFnet BRB :)

### See also ###
[CONNECT](/documentation/help/connect/), [DISCONNECT](/documentation/help/disconnect/), [NETWORK](/documentation/help/network/), [RMRECONNS](/documentation/help/rmreconns/), [SERVER](/documentation/help/server/)

