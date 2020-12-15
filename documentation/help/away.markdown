---
layout: page
title: "Help: away"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/away.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">AWAY</span> <span class="syn10">[<span class="syn">-one</span> | <span class="syn">-all</span>]</span> <span class="syn10">[<span class="syn09">&lt;reason></span>]</span></code></pre></div>



### Parameters ###


| `-one`: |     Marks yourself as away on the active server. |
| `-all`: |     Marks yourself as away on all the servers you are connected to. |
{:.table.kv}

   Your away message; if no argument is given, your away status will be removed.

### Description ###

Marks yourself as 'away'; this method is used to inform people that you
are not paying attention to your screen.

You might use it when you are taking a nap, in the shower, getting some
food, or otherwise engaged. When you're 'away' you will see '(zZzZ)' in
your statusbar.

Anyone who does a WHOIS on your nickname will see that you are away, as
well as your away message.

### Examples ###

    /AWAY
    /AWAY I'm getting some food.
    /AWAY zZzZ
    /AWAY -one Feeding the cat!

### See also ###
[DISCONNECT](/documentation/help/disconnect/)

