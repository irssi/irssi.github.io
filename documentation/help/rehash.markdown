---
layout: page
title: "Help: rehash"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/rehash.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">REHASH</span> <span class="syn10">[<span class="syn09">&lt;option></span>]</span></code></pre></div>



### Parameters ###

The raw parameters to send to the server, if no arguments are given, none
will be sent to the server.

### Description ###

Reloads the configuration of the IRC server you are are connected to; this
command is restricted to IRC operators.

### Examples ###

    /REHASH

### See also ###
[DIE](/documentation/help/die), [KILL](/documentation/help/kill), [OPER](/documentation/help/oper)

