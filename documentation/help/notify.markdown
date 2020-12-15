---
layout: page
title: "Help: notify"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/notify.in
- https://github.com/irssi/irssi/blob/master/src/irc/notifylist/notify-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">NOTIFY</span> <span class="syn10">[<span class="syn">-away</span>]</span> <span class="synB05">&lt;mask></span> <span class="syn10">[<span class="syn09">&lt;ircnets></span>]</span></code></pre></div>



### Parameters ###


| `-away`: |     Notifies you if the target modifies its away status. |
| `-list`: |     Displays the list of notifications. |
{:.table.kv}

The nickname or mask to get a notification for; if no arguments are given,
the current matching notifications will be displayed.

You may also provide the network that the target must be on.

### Description ###

Notifies you when a nickname or users matching a host on the notification
list comes online or offline.

### Examples ###

    /NOTIFY -list
    /NOTIFY -away mike
    /NOTIFY bob
    /NOTIFY *!*@staff.irssi.org

### See also ###
[AWAY](/documentation/help/away/), [HILIGHT](/documentation/help/hilight/), [UNNOTIFY](/documentation/help/unnotify/)

