---
layout: page
title: "Help: time"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/time.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">TIME</span> <span class="syn10">[<span class="syn09">&lt;server></span>|<span class="syn09">&lt;nick></span>]</span></code></pre></div>



### Parameters ###

The channel or the nickname; if no argument is given, the active server
will be used.

### Description ###

Displays the local time of a server or the server the target user is
connected to.

### Examples ###

    /TIME
    /TIME mike
    /TIME ircsource.irssi.org

### See also ###
[MAP](/documentation/help/map/), [TRACE](/documentation/help/trace/), [WHOIS](/documentation/help/whois/)

