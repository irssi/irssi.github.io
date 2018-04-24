---
layout: page
title: "Help: save"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/save.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-settings.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">SAVE</span> <span class="syn10">[<span class="syn09">&lt;file></span>]</span></code></pre></div>



### Parameters ###


| `-formats`: |     Saves all the formats into the theme file. |
{:.table.kv}

The file to save the configuration or theme into; if no parameter is given,
the active configuration or theme file will be used.

### Description ###

Saves the configuration file.

### Examples ###

    /SAVE
    /SAVE -formats
    /SAVE ~/.irssi/config-new

### See also ###
[RELOAD](/documentation/help/reload), [SET](/documentation/help/set)

