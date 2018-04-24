---
layout: page
title: "Help: part"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/part.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">PART</span> <span class="syn10">[<span class="syn09">&lt;channels></span>]</span> <span class="syn10">[<span class="syn09">&lt;message></span>]</span></code></pre></div>



### Parameters ###

The channels, separated by a comma, to leave and the message to advertise.

### Description ###

Leaves the given channels.

### Examples ###

    /PART #irssi
    /PART #freenode,#irssi

### See also ###
[JOIN](/documentation/help/join), [KICK](/documentation/help/kick)

