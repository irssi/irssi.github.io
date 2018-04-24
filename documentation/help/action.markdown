---
layout: page
title: "Help: action"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/action.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/irc/fe-irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">ACTION</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="synB05">&lt;target></span> <span class="synB05">&lt;message></span></code></pre></div>



### Parameters ###


| `-<server tag>`: |     The server tag you want to send the action emote to. |
{:.table.kv}

A target nickname or channel and the message to emote.

### Description ###

Sends an action emote to a nickname or a channel.

### Examples ###

    /ACTION #irssi is hungry!
    /ACTION mike had an awesome day @ work
    /ACTION -efnet #irssi is happy it's Friday

### See also ###
[ME](/documentation/help/me)

