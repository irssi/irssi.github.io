---
layout: page
title: "Help: lusers"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/lusers.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">LUSERS</span> <span class="syn10">[<span class="syn09">&lt;server mask></span> <span class="syn14">[<span class="syn13">&lt;remote server></span>]</span>]</span></code></pre></div>



### Parameters ###

The server to search on and the remote sever to search on; if no arguments
are given, the active server will be used.

### Description ###

Displays the user statistics of the active or remote server.

The parameters to search on a remote server are no longer supported on most
    IRC servers; we no longer provide examples for remote LUSERS to avoid all
confusion.

### Examples ###

    /LUSERS

### See also ###
[LINKS](/documentation/help/links), [MAP](/documentation/help/map)

