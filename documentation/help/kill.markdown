---
layout: page
title: "Help: kill"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/kill.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">KILL</span> <span class="synB05">&lt;nick></span> <span class="synB05">&lt;reason></span></code></pre></div>



### Parameters ###

The nickname to remove from the network and the reason thereof.

### Description ###

Terminates a nickname's connection from the network; this command is
reserved for IRC operators.

You should not use this command for personal vendettas or for trolling;
these practices are generally frowned upon.

### Examples ###

    /KILL mike Get off my lawn
    /KILL bob Stop breaking the network rules!

### See also ###
[DIE](/documentation/help/die/), [OPER](/documentation/help/oper/), [WALLOPS](/documentation/help/wallops/)

