---
layout: page
title: "Help: whowas"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/whowas.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">WHOWAS</span> <span class="syn10">[<span class="syn09">&lt;nicks></span> <span class="syn14">[<span class="syn13">&lt;count></span> <span class="syn13">[<span class="syn">server</span>]</span>]</span>]</span></code></pre></div>



### Parameters ###

The nicknames, the maximum amount of results and the remote server. If no
arguments are given, your own nickname will be used. If no remote server is
given, the server you are connected to will be used.

### Description ###

Displays historical user information.

### Examples ###

    /WHOWAS
    /WHOWAS mike
    /WHOWAS bob 10
    /WHOWAS sarah 5 ircsource.irssi.org

### See also ###
[CHANNEL](/documentation/help/channel/), [NAMES](/documentation/help/names/), [WHO](/documentation/help/who/), [WHOIS](/documentation/help/whois/)

