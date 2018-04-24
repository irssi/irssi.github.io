---
layout: page
title: "Help: load"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/load.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-modules.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">LOAD</span> <span class="synB05">&lt;module></span> <span class="syn10">[<span class="syn09">&lt;submodule></span>]</span></code></pre></div>



### Parameters ###

The name of the module and submodule to load.

### Description ###

Loads a plugin; if the full path isn't given, it will attempt to load from
common directories in your installation path.

To load a perl script, you must use the SCRIPT command.

### Examples ###

    /LOAD fish
    /LOAD ~/irssi-fish/libfish.so

### See also ###
[SCRIPT](/documentation/help/script), [UNLOAD](/documentation/help/unload)

