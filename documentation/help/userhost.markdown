---
layout: page
title: "Help: userhost"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/userhost.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">USERHOST</span> <span class="synB05">&lt;nicks></span></code></pre></div>



### Parameters ###

One or more nicknames separated by space.

### Description ###

Displays the user@host for the given nicknames; some common added attributes
are '*' to identify an IRC operator, '-' and '+' to indicate whether the
nickname is AWAY or available.

### Examples ###

    /USERHOST mike
    /USERHOST bob sarah

### See also ###
[WHOIS](/documentation/help/whois/)

