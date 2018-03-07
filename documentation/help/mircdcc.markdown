---
layout: page
title: "Help: mircdcc"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/mircdcc.in
- https://github.com/irssi/irssi/blob/master/src/irc/dcc/dcc-chat.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">MIRCDCC</span> <span class="synB">ON</span>|<span class="synB">OFF</span></code></pre></div>



### Parameters ###


| `ON`: |      Enables mIRC compatibility mode. |
| `OFF`: |     Disables mIRC compatibility mode. |
{:.table.kv}

### Description ###

After establishing a DCC CHAT connection that you initiated, you might
encounter some protocol issues if the target is using mIRC.

If you or your target sees some unexpected output or behavior inside a DCC
    CHAT session, use this command to enable mIRC compatibility mode.

When receiving a connection from an mIRC user, the compatibility mode will
automatically be enabled.

### Examples ###

    /MIRCDCC ON
    /MIRCDCC OFF

### See also ###
[ACTION](/documentation/help/action), [CTCP](/documentation/help/ctcp), [DCC](/documentation/help/dcc)

