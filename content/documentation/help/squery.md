---
layout: page
title: "Help: squery"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/squery.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">SQUERY</span> <span class="synB05">&lt;service></span> <span class="syn10">[<span class="syn09">&lt;message></span>]</span></code></pre></div>



### Parameters ###


| `<service>` | - Service nickname or full hostmask of service to query. |
| `<message>` | - Message to send to the service. |
{:.table.kv}

### Description ###

    /SQUERY sends a query to the specified service.

### See also ###
[SERVLIST](/documentation/help/servlist), [LIST](/documentation/help/list), [MSG](/documentation/help/msg)

