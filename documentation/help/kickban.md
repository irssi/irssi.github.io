---
layout: page
title: "Help: kickban"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/kickban.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">KICKBAN</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span> <span class="synB05">&lt;nicks></span> <span class="synB05">&lt;reason></span></code></pre></div>



### Parameters ###

The channel and the nicknames, separated by a comma, to kick and ban from
the channel and the reason thereof; if no channel is given, the active
channel will be used.

### Description ###

Removes and then bans the given nicknames from the specified channel.

### Examples ###

    /KICKBAN mike Please... chill down!
    /KICKBAN #irssi bob,sarah You guys broke the rules for the last time.

### See also ###
[BAN](/documentation/help/ban), [KICK](/documentation/help/kick), [KNOCKOUT](/documentation/help/knockout)

