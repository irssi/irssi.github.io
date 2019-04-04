---
layout: page
title: "Help: quote"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/quote.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">QUOTE</span> <span class="synB05">&lt;data></span></code></pre></div>



### Parameters ###

The text to send to the IRC server.

### Description ###

Sends raw data to the server without any parsing.

### Examples ###

    /QUOTE PRIVMSG mike :Hey, this works!
    /QUOTE OPERWALL :Meow!

### See also ###
[CONNECT](/documentation/help/connect), [DISCONNECT](/documentation/help/disconnect), [JOIN](/documentation/help/join), [MSG](/documentation/help/msg), [PART](/documentation/help/part)

