---
layout: page
title: "Help: admin"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/admin.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">ADMIN</span> <span class="syn10">[<span class="syn09">&lt;server></span>|<span class="syn09">&lt;nickname></span>]</span></code></pre></div>



### Parameters ###

A nickname or server for which you want to know the administrative details;
if no argument is given, the server you are connected to will be used.

### Description ###

Displays the administrative details of a server.

### Examples ###

    /ADMIN
    /ADMIN orwell.freenode.net
    /ADMIN mike

### See also ###
[INFO](/documentation/help/info)

