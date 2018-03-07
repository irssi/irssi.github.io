---
layout: page
title: "Help: knockout"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/knockout.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">KNOCKOUT</span> <span class="syn10">[<span class="syn09">&lt;time></span>]</span> <span class="synB05">&lt;nicks></span> <span class="synB05">&lt;reason></span></code></pre></div>



### Parameters ###

The time, expressed in seconds, the nicknames, separated by a comma, and the
reason thereof; if no time is provided, the ban will be lifted after 5
minutes.

### Description ###

Removes and then bans the given nicknames from the active channel; the ban
will be automatically lifted after the specified time.

The ban will not be lifted if you leave the channel or disconnect from the
network.

### Examples ###

    /KNOCKOUT 3600 mike Your connection is unstable.
    /KNOCKOUT bob,sarah Chill down a bit.

### See also ###
[BAN](/documentation/help/ban), [KICK](/documentation/help/kick), [KICKBAN](/documentation/help/kickban)

