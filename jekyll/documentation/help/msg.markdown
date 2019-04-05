---
layout: page
title: "Help: msg"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/msg.in
- https://github.com/irssi/irssi/blob/master/src/core/chat-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">MSG</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="syn10">[<span class="syn">-channel</span> | <span class="syn">-nick</span>]</span> <span class="synB">*</span>|<span class="synB05">&lt;targets></span> <span class="synB05">&lt;message></span></code></pre></div>



### Parameters ###


| `-<server tag>`: |     The server tag the targets are on. |
| `-channel`: |          Indicates that the target is a channel. |
| `-nick`: |             Indicates that the target is a nickname. |
{:.table.kv}

The target nickname or channel and the message to send.

The target can be a comma delimited list of targets, ie
nick1,nick2 or #chan1,#chan2

Or one of the following special targets:

| `* `: |  Use the active nickname or channel |
| `, `: |  Last person who sent you a /msg |
| `. `: |  Last person you sent a /msg to |
{:.table.kv}

### Description ###

Sends a message to a nickname or channel.

### Examples ###

    /MSG mike Hi, what's up?
    /MSG #irssi I am awesome :)
    /MSG * Do you want to build a snowman?

### See also ###
[ACTION](/documentation/help/action), [DCC](/documentation/help/dcc), [JOIN](/documentation/help/join)

