---
layout: page
title: "Help: cat (1.3)"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/cat.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-core-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/index_(1.3))
</nav>

<nav markdown="1">
[ [v1.2](/documentation/help/cat) ] - [ v1.3 ]
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">CAT</span> <span class="syn10">[<span class="syn">-window</span>]</span> <span class="synB05">&lt;file></span> <span class="syn10">[<span class="syn09">&lt;seek position></span>]</span></code></pre></div>



### Parameters ###


| `-window`: |             Displays the output in the active window. |
{:.table.kv}

The file to display and optionally a position to seek in the file,
in bytes.

### Description ###

Displays the contents of the specified file in the active window if -window
is specified, otherwise to the closest matching window depending on levels.

The seek position parameter is used internally to display away logs, if
omitted the whole file is shown.

### Examples ###

    /CAT -window /etc/network/interfaces
    /CAT /home/mike/resume.txt
    /CAT contact_details.txt

### See also ###
[CD](/documentation/help/cd), [EXEC](/documentation/help/exec)

