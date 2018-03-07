---
layout: page
title: "Help: version"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/version.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-core-commands.c
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">VERSION</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">VERSION</span> <span class="syn10">[<span class="syn09">&lt;server></span>|<span class="syn09">&lt;nick></span>]</span></code></pre></div>



### Parameters ###

A nickname or server; if no argument is given, the active server will be
used.

### Description ###

Displays the version and compatibility parameters of the given server, or
for the server the target nickname is on.

### Examples ###

    /VERSION mike
    /VERSION ircsource.irssi.org

### See also ###
[ADMIN](/documentation/help/admin), [STATS](/documentation/help/stats)

