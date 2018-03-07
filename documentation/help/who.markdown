---
layout: page
title: "Help: who"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/who.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">WHO</span> <span class="syn10">[<span class="syn09">&lt;nicks></span> | <span class="syn09">&lt;channels></span> | <span class="syn">**</span>]</span></code></pre></div>



### Parameters ###

The channel name or output filter; if no arguments are given, the current
channel will be used.

### Description ###

Displays information about users in the specified channel. If you specify a
filter, all the users whose nick, userhost or realname matches the filter
will be returned.

If the channel is secret and you are not on it, you will not receive any
output.

Common flags:


| `H`: |     The user is available. |
| `G`: |     The user is away. |
| `*`: |     The user is an IRC operator. |
| `@`: |     The user is a channel operator. |
| `+`: |     The user is a channel voice. |
{:.table.kv}

### Examples ###

    /WHO
    /WHO #irssi
    /WHO bob
    /WHO sar*

### See also ###
[CHANNEL](/documentation/help/channel), [NAMES](/documentation/help/names), [WHOIS](/documentation/help/whois)

