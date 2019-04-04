---
layout: page
title: "Help: query"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/query.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-queries.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">QUERY</span> <span class="syn10">[<span class="syn">-window</span>]</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="synB05">&lt;nick></span> <span class="syn10">[<span class="syn09">&lt;message></span>]</span></code></pre></div>



### Parameters ###


| `-window`: |           Uses the active window instead of opening a new one. |
| `-<server tag>`: |     The server tag the target nickname is on. |
{:.table.kv}

The nickname to query and the message.

### Description ###

Starts a private conversation with a nickname.

### Examples ###

    /QUERY mike
    /QUERY -freenode bob
    /QUERY -freenode -window sarah

### See also ###
[MSG](/documentation/help/msg), [UNQUERY](/documentation/help/unquery), [WINDOW](/documentation/help/window)

