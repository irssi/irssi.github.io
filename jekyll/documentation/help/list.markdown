---
layout: page
title: "Help: list"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/list.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">LIST</span> <span class="syn10">[<span class="syn">-yes</span>]</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span></code></pre></div>



### Parameters ###


| `-yes`: |     Confirms that you want to receive a large amount of data. |
{:.table.kv}

If the exact name of a channel is given, the only information about this
channel is requested; otherwise, a list of all channels will be displayed.

### Description ###

Displays the channel names that match your request; requesting all channels
may cause the server to disconnect you for flooding.

### Examples ###

    /LIST
    /LIST -yes
    /LIST #ubuntu
    /LIST #*ubuntu*,>1

### Remarks ###

Not all networks support server-side filtering. Some provide a network
service or service bot instead; on IRCnet, you may use the List service:

    /SQUERY Alis HELP

Other networks with service bots (like ChanServ) may also provide a list
service bot (confirm with /WHOIS ALIS):

    /MSG Alis HELP

### See also ###
[STATS](/documentation/help/stats), [SQUERY](/documentation/help/squery), [WHOIS](/documentation/help/whois)

