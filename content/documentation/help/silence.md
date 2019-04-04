---
layout: page
title: "Help: silence"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/silence.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">SILENCE</span> <span class="syn10">[<span class="syn14">[<span class="synB">+</span>|<span class="synB">-</span>]</span><span class="syn09">&lt;nick!user@host></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">SILENCE</span> <span class="syn10">[<span class="syn09">&lt;nick></span>]</span></code></pre></div>



### Parameters ###

The nickname or hostname to silence; you must prepend it by the '+' or '-'
character to indicate whether the entry should be added or removed.

If no arguments are given, the list of silence entries will be displayed.

### Description ###

Manages the server side ignore list; users or hostnames that match an entry
on the list are not able to send you any messages or invites.

This command does not work on all IRC networks.

### Examples ###

    /SILENCE
    /SILENCE +mike
    /SILENCE -mike
    /SILENCE +*!*@*.irssi.org
    /SILENCE -*!*@*.irssi.org

### See also ###
[ACCEPT](/documentation/help/accept), [IGNORE](/documentation/help/ignore)

