---
layout: page
title: "Help: servlist"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/servlist.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">SERVLIST</span> <span class="syn10">[<span class="syn09">&lt;mask></span> <span class="syn14">[<span class="syn13">&lt;type></span>]</span>]</span></code></pre></div>



### Parameters ###


| `<mask>` | limits the output to the services which names matches the mask. |
| `<type>` | limits the output to the services of the specified type. |
{:.table.kv}

### Description ###

List the network services currently present on the
    IRC network.

### Examples ###

    /SERVLIST *@javairc.*
    /SERVLIST * 0xD000

### See also ###
[SQUERY](/documentation/help/squery)

