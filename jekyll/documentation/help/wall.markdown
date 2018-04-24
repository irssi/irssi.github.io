---
layout: page
title: "Help: wall"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/wall.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">WALL</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span> <span class="synB05">&lt;message></span></code></pre></div>



### Parameters ###

The channel and the message; if no channel is given, the active channel
will be used.

### Description ###

Sends a message to all channel operators. If the server doesn't support
    WALLCHOPS or STATUSMSG it will send a notice to each channel operator
individually.

### Examples ###

    /WALL I'm off for today; take care! :)
    /WALL #irssi I'm feeling supercalifragilisticexpialidocious today :D

### See also ###
[MSG](/documentation/help/msg), [NOTICE](/documentation/help/notice)

