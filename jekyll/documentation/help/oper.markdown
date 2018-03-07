---
layout: page
title: "Help: oper"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/oper.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">OPER</span> <span class="syn10">[<span class="syn09">&lt;nick></span> <span class="syn14">[<span class="syn13">&lt;password></span>]</span>]</span></code></pre></div>



### Parameters ###

The username and password to identify yourself as an IRC operator; if no
password is given, you will be prompted to enter one.

### Description ###

Grants you the IRC operator status.

### Examples ###

    /OPER bob
    /OPER mike WzerT8zq 

### See also ###
[DIE](/documentation/help/die), [KILL](/documentation/help/kill)

