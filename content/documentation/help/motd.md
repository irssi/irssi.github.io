---
layout: page
title: "Help: motd"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/motd.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">MOTD</span> <span class="syn10">[<span class="syn09">&lt;server></span>|<span class="syn09">&lt;nick></span>]</span></code></pre></div>



### Parameters ###

The server or the server the target nickname is on; if no parameter is
given, the active server will be used.

### Description ###

Displays the welcome message of an IRC server.

### Examples ###

    /MOTD
    /MOTD orwel.freenode.org
    /MOTD bob

### See also ###
[ADMIN](/documentation/help/admin), [INFO](/documentation/help/info), [LINKS](/documentation/help/links), [MAP](/documentation/help/map)

