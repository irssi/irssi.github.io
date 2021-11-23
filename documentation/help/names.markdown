---
layout: page
title: "Help: names"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/names.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-channels.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">NAMES</span> <span class="syn10">[<span class="syn">-count</span> | <span class="syn">-ops</span> <span class="syn">-halfops</span> <span class="syn">-voices</span> <span class="syn">-normal</span>]</span> <span class="syn10">[<span class="syn09">&lt;channels></span> | <span class="syn">**</span>]</span></code></pre></div>



### Parameters ###


| `-count`: |       Displays the amount of users in the channel. |
| `-ops`: |         Displays the channel operators. |
| `-halfops`: |     Displays the channel demi-operators. |
| `-voices`: |      Displays the users who are voiced in a channel. |
{:.table.kv}

The channels to report or ** for all channels you have joined; if no
arguments are given, the users in the active channel will be displayed.

### Description ###

Displays the users who are in a channel; you can provide multiple channels
by separating them with a comma.

### Examples ###

    /NAMES -ops
    /NAMES -voices #irssi,#example

### See also ###
[JOIN](/documentation/help/join), [PART](/documentation/help/part), [WHO](/documentation/help/who), [WHOIS](/documentation/help/whois)

