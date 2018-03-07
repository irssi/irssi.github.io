---
layout: page
title: "Help: topic"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/topic.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">TOPIC</span> <span class="syn10">[<span class="syn">-delete</span>]</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span> <span class="syn10">[<span class="syn09">&lt;topic></span>]</span></code></pre></div>



### Parameters ###


| `-delete`: |     Removes the topic. |
{:.table.kv}

The channel and topic; if no channel is given, the active channel will be
used. If no argument is given, the current topic will be displayed.

### Description ###

Displays or modifies the topic of a channel.

### Examples ###

    /TOPIC
    /TOPIC The robots are taking over!
    /TOPIC -delete #irssi
    /TOPIC #shakespeare /bb|[^b]{2}/

### See also ###
[CHANNEL](/documentation/help/channel), [DEOP](/documentation/help/deop), [DEVOICE](/documentation/help/devoice), [JOIN](/documentation/help/join), [OP](/documentation/help/op), [VOICE](/documentation/help/voice)

