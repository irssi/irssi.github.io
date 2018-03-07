---
layout: page
title: "Help: completion"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/completion.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/completion.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">COMPLETION</span> <span class="syn10">[<span class="syn">-auto</span>]</span> <span class="syn10">[<span class="syn">-delete</span>]</span> <span class="synB05">&lt;key></span> <span class="synB05">&lt;value></span></code></pre></div>



### Parameters ###


| `-auto`: |       Inserts the completion without pressing a word completion character. |
| `-delete`: |     Removes the completion from the configuration. |
{:.table.kv}

A key and the value to use as a replacement. If no argument is given, the
list of completions will be displayed.

### Description ###

Replaces or completed words or letters; you can write just the first few
letters of the word and press TAB to insert a replacement.

When a replacement has been found, Irssi will choose the most probable
matching word and replaces it; you may press TAB repeatedly to swap between
matches.

If you want to remove a completion which has the auto parameter set, you
need to enclose the completion between "'" characters.

### Examples ###

    /COMPLETION w/h without
    /COMPLETION -auto anywya anyway
    /COMPLETION -delete 'anywya'
    /COMPLETION -delete without

### See also ###
[BIND](/documentation/help/bind)

