---
layout: page
title: "Help: unquery"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/unquery.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-queries.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">UNQUERY</span> <span class="syn10">[<span class="syn09">&lt;nick></span>]</span></code></pre></div>



### Parameters ###

The nickname to close the query for; if no argument is given, the active
query will be used.

### Description ###

Closes a query window for a nickname.

### Examples ###

    /UNQUERY
    /UNQUERY mike

### See also ###
[MSG](/documentation/help/msg/), [QUERY](/documentation/help/query/), [WINDOW](/documentation/help/window/)

