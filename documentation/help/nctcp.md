---
layout: page
title: "Help: nctcp"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/nctcp.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">NCTCP</span> <span class="synB05">&lt;targets></span> <span class="synB05">&lt;ctcp command></span> <span class="syn10">[<span class="syn09">&lt;ctcp data></span>]</span></code></pre></div>



### Parameters ###

A target nickname or channel, a command and the data.

### Description ###

Sends a CTCP reply to a nickname or channel; you can provide multiple
targets by separating them with a comma.

### Examples ###

    /NCTCP #irssi VERSION King of the Jungle v1.0
    /NCTCP bob,#freenode USERINFO I am bob :p

### See also ###
[CTCP](/documentation/help/ctcp)

