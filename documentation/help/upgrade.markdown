---
layout: page
title: "Help: upgrade"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/upgrade.in
- https://github.com/irssi/irssi/blob/master/src/core/session.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">UPGRADE</span> <span class="syn10">[<span class="syn09">&lt;irssi binary path></span>]</span></code></pre></div>



### Parameters ###

The location of the new binary; if no arguments are given, the current
binary file will be used.

### Description ###

Upgrades to a new version without disconnecting from non-SSL servers; please
bear in mind that it does not download or compile a new version.

### Examples ###

    /UPGRADE
    /UPGRADE /home/mike/irssi-dev/bin/irssi

### See also ###
[CONNECT](/documentation/help/connect/), [DISCONNECT](/documentation/help/disconnect/), [HELP](/documentation/help/help/)

