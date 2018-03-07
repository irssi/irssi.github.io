---
layout: page
title: "Help: trace"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/trace.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">TRACE</span> <span class="syn10">[<span class="syn09">&lt;server></span>|<span class="syn09">&lt;nick></span>]</span></code></pre></div>



### Parameters ###

The channel or the nickname; if no argument is given, the active server
will be used.

### Description ###

Displays the list of servers and users connects to a server, or a list of
the servers between yourself and the target user.

This command is usually restricted to IRC operators.

### Examples ###

    /TRACE
    /TRACE mike
    /TRACE ircsource.irssi.org

### See also ###
[MAP](/documentation/help/map), [TIME](/documentation/help/time), [WHOIS](/documentation/help/whois)

