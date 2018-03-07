---
layout: page
title: "Help: ctcp"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/ctcp.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">CTCP</span> <span class="synB05">&lt;targets></span> <span class="synB05">&lt;ctcp command></span> <span class="syn10">[<span class="syn09">&lt;ctcp data></span>]</span></code></pre></div>



### Parameters ###

A target nickname or channel and a command.

### Description ###

Sends a CTCP request towards the given target nickname or channel.

### Examples ###

    /CTCP mike PING
    /CTCP #irssi VERSION
    /CTCP bob USERINFO
    /CTCP sarah CLIENTINFO
    /CTCP john TIME

### See also ###
[ACTION](/documentation/help/action), [ME](/documentation/help/me)

