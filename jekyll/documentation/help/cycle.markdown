---
layout: page
title: "Help: cycle"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/cycle.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-channels.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">CYCLE</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span> <span class="syn10">[<span class="syn09">&lt;message></span>]</span></code></pre></div>



### Parameters ###

A channel and the message. If no argument is given, the active channel
will be used.

### Description ###

Leaves and rejoins a channel.

### Examples ###

    /CYCLE
    /CYCLE #irssi
    /CYCLE #irssi BRB :)

### See also ###
[JOIN](/documentation/help/join), [PART](/documentation/help/part)

