---
layout: page
title: "Help: cat"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/cat.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-core-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">CAT</span> <span class="synB05">&lt;file></span> <span class="syn10">[<span class="syn09">&lt;seek position></span>]</span></code></pre></div>



### Parameters ###

The file to display and optionally a position to seek in the file,
in bytes.

### Description ###

Displays the contents of the specified file into the active window.

The seek position parameter is used internally to display away logs, if
omitted the whole file is shown.

### Examples ###

    /CAT /etc/network/interfaces
    /CAT /home/mike/resume.txt
    /CAT contact_details.txt

### See also ###
[CD](/documentation/help/cd), [EXEC](/documentation/help/exec)

