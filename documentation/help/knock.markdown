---
layout: page
title: "Help: knock"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/knock.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">KNOCK</span> <span class="synB05">&lt;channel></span></code></pre></div>



### Parameters ###

The channel you wish to get invited to.

### Description ###

Sends an invitation request to the channel operators of the target channel;
this command may not work on all IRC servers.

The following conditions must be met:

* You are not banned from the channel.
* The channel is not private.
* You may not be already in the channel.
* The channel must be invite only, have a key or has exceeded its user
  limit.

### Examples ###

    /KNOCK #irssi
    /KNOCK #freenode
    /KNOCK #github

### See also ###
[INVITE](/documentation/help/invite), [JOIN](/documentation/help/join)

