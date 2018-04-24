---
layout: page
title: "Help: join"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/join.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-channels.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">JOIN</span> <span class="syn10">[<span class="syn">-window</span>]</span> <span class="syn10">[<span class="syn">-invite</span>]</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="synB05">&lt;channels></span> <span class="syn10">[<span class="syn09">&lt;keys></span>]</span></code></pre></div>



### Parameters ###


| `-window` | Joins a channel in the active window. |
| `-invite` | Joins the channel you were last invited to. |
| `-<server tag>` | The server tag on which you want to join the channel. |
{:.table.kv}

The channel names, separated by a comma, to join and the channel key.

### Description ###

Joins the given channels.

### Examples ###

    /JOIN #irssi
    /JOIN #basementcat secret_lair
    /JOIN -invite
    /JOIN -freenode #github,#freenode,#irssi

### See also ###
[KICK](/documentation/help/kick), [PART](/documentation/help/part)

