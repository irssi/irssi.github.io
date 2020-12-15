---
layout: page
title: "Help: notice"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/notice.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">NOTICE</span> <span class="synB05">&lt;targets></span> <span class="synB05">&lt;message></span></code></pre></div>



### Parameters ###

The targets and the message to notify.

### Description ###

Sends a notice to the target nickname or channel; these are often used in
automated bots or scripts.

You can provide multiple targets by separating them with a comma.

### Examples ###

    /NOTICE mike You sir, are just awesome!
    /NOTICE bob,#irssi Fish go blub :p

### See also ###
[CTCP](/documentation/help/ctcp/), [MSG](/documentation/help/msg/), [NCTCP](/documentation/help/nctcp/)

