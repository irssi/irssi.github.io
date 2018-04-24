---
layout: page
title: "Help: unsilence"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/unsilence.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">UNSILENCE</span> <span class="synB05">&lt;nick!user@host></span></code></pre></div>



### Parameters ###

The silence pattern to remove.

### Description ###

Removes an entry from the silence list. This command does not work on all
    IRC networks.

### Examples ###

    /UNSILENCE mike
    /UNSILENCE *!*@*.irssi.org

### See also ###
[ACCEPT](/documentation/help/accept), [IGNORE](/documentation/help/ignore), [SILENCE](/documentation/help/silence)

