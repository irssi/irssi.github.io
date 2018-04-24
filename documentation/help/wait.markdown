---
layout: page
title: "Help: wait"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/wait.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">WAIT</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="synB05">&lt;milliseconds></span></code></pre></div>



### Parameters ###

The amount of milliseconds.

### Description ###

Waits the specified amount of milliseconds before sending the next command
to the server.

### Examples ###

    /WAIT 1000
    /WAIT 5000

### See also ###
[ALIAS](/documentation/help/alias)

