---
layout: page
title: "Help: kick"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/kick.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">KICK</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span> <span class="synB05">&lt;nicks></span> <span class="syn10">[<span class="syn09">&lt;reason></span>]</span></code></pre></div>



### Parameters ###

The channel and the nicknames, separated by a comma, to kick from the
channel and the reason thereof; if no channel is given, the active channel
will be used.

### Description ###

Removes the given nicknames from the specified channel; this command is
typically used to remove troublemakers, flooders or people otherwise making
a nuisance of themselves.

### Examples ###

    /KICK mike Please... chill down!
    /KICK #irssi bob,sarah Stop flooding!

### See also ###
[BAN](/documentation/help/ban/), [KICKBAN](/documentation/help/kickban/), [KNOCKOUT](/documentation/help/knockout/)

