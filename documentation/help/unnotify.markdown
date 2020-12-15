---
layout: page
title: "Help: unnotify"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/unnotify.in
- https://github.com/irssi/irssi/blob/master/src/irc/notifylist/notify-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">UNNOTIFY</span> <span class="synB05">&lt;mask></span></code></pre></div>



### Parameters ###

The notify pattern to remove.

### Description ###

Removes an entry from the notify list.

### Examples ###

    /UNNOTIFY bob
    /UNNOTIFY *!*@staff.irssi.org

### See also ###
[AWAY](/documentation/help/away/), [HILIGHT](/documentation/help/hilight/), [NOTIFY](/documentation/help/notify/)

