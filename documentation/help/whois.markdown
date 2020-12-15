---
layout: page
title: "Help: whois"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/whois.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">WHOIS</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="syn10">[<span class="syn09">&lt;server></span>]</span> <span class="syn10">[<span class="syn09">&lt;nicks></span>]</span></code></pre></div>



### Parameters ###


| `-<server tag>`: |     The server tag the target nickname is on. |
{:.table.kv}

The remote server to query and the nicknames; if no remote server is given,
the server you are connected to will be used. If no nickname is given, you
will query yourself.

### Description ###

Displays information about users in the specified channel; you may give the
same nickname as the argument twice to also query the idle time.

If the nickname is not online, the WHOWAS command will be automatically
performed.

### Examples ###

    /WHOIS
    /WHOIS mike
    /WHOIS ircsource.irssi.org bob
    /WHOIS sarah sarah

### See also ###
[CHANNEL](/documentation/help/channel/), [NAMES](/documentation/help/names/), [WHO](/documentation/help/who/), [WHOWAS](/documentation/help/whowas/)

