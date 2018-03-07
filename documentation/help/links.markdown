---
layout: page
title: "Help: links"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/links.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">LINKS</span> <span class="syn10">[<span class="syn14">[<span class="syn13">&lt;server></span>]</span> <span class="syn09">&lt;mask></span>]</span></code></pre></div>



### Parameters ###

The server to search on and the string to match on; if no arguments are
given, the list of links of the active server will be displayed.

### Description ###

Displays the links between an IRC server and its connections.

### Examples ###

    /LINKS
    /LINKS ircsource.irssi.org
    /LINKS ircsource.irssi.org *.hub

### See also ###
[LUSERS](/documentation/help/lusers), [MAP](/documentation/help/map)

