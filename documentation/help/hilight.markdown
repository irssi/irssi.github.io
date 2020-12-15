---
layout: page
title: "Help: hilight"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/hilight.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/hilight-text.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">HILIGHT</span> <span class="syn10">[<span class="syn">-nick</span> | <span class="syn">-word</span> | <span class="syn">-line</span>]</span> <span class="syn10">[<span class="syn">-mask</span> | <span class="syn">-full</span> | <span class="syn">-matchcase</span> | <span class="syn">-regexp</span>]</span> <span class="syn10">[<span class="syn">-color</span> <span class="syn09">&lt;color></span>]</span> <span class="syn10">[<span class="syn">-actcolor</span> <span class="syn09">&lt;color></span>]</span> <span class="syn10">[<span class="syn">-level</span> <span class="syn09">&lt;level></span>]</span> <span class="syn10">[<span class="syn">-network</span> <span class="syn09">&lt;network></span>]</span> <span class="syn10">[<span class="syn">-channels</span> <span class="syn09">&lt;channels></span>]</span> <span class="synB05">&lt;text></span></code></pre></div>



### Parameters ###


| `-nick`: |         Highlights only the nickname and not the whole line. |
| `-word`: |         Highlights only the word and not the whole line. |
| `-line`: |         Highlights the whole line. |
| `-mask`: |         Highlights all messages from users matching the mask. |
| `-full`: |         The text must match the full word. |
| `-matchcase`: |    The text must match case. |
| `-regexp`: |       The text is a regular expression. |
| `-color`: |        The color to display the highlight in. |
| `-actcolor`: |     The color to mark the highlight activity in the statusbar. |
| `-level`: |        Matches only on the given message level. |
| `-network`: |      Matches only on the given network. |
| `-channels`: |     Matches only on the given channels. |
| `-priority`: |     The priority to use when multiple highlights match. |
{:.table.kv}

The text to highlight on; if no argument is given, the list of highlights
will be displayed.

### Description ###

Highlights the keyword or pattern to make sure that you don't miss any
important messages.

### Examples ###

    /HILIGHT
    /HILIGHT mike
    /HILIGHT -regexp mi+ke+
    /HILIGHT -mask -color %G bob!*@*.irssi.org
    /HILIGHT -full -color %G -actcolor %Y redbull

### References ###



[https://github.com/irssi/irssi/blob/master/docs/formats.txt](https://github.com/irssi/irssi/blob/master/docs/formats.txt)



### See also ###
[DEHILIGHT](/documentation/help/dehilight/), [LEVELS](/documentation/help/levels/)

