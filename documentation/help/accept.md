---
layout: page
title: "Help: accept"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/accept.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">ACCEPT</span> <span class="syn10">[<span class="syn14">[<span class="synB">-</span>]</span><span class="syn">nick</span>,<span class="syn">...</span>]</span></code></pre></div>



### Parameters ###

A comma-separated list of nicknames to add or remove; if no argument is
given, your accept list will be displayed.

### Description ###

Allows you to specify who you want to receive private messages and notices
from while you have callerid enabled.

When you have callerid enabled, messages from other users are blocked and
the sender is notified.

Users are automatically removed from the accept list if they quit, split
or change nickname; the accept list is lost when you disconnect.

This command only works on IRC servers that support the callerid user mode.

### Examples ###

    /ACCEPT mike,bob,-john,-sarah
    /ACCEPT sarah,-bob

### See also ###
[IGNORE](/documentation/help/ignore), [SILENCE](/documentation/help/silence)

