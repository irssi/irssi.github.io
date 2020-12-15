---
layout: page
title: "Help: lastlog"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/lastlog.in
- https://github.com/irssi/irssi/blob/master/src/fe-text/lastlog.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">LASTLOG</span> <span class="syn10">[<span class="syn">-</span>]</span> <span class="syn10">[<span class="syn">-file</span> <span class="syn09">&lt;filename></span>]</span> <span class="syn10">[<span class="syn">-window</span> <span class="syn09">&lt;ref#|name></span>]</span> <span class="syn10">[<span class="syn">-new</span> | <span class="syn">-away</span>]</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;level></span> <span class="syn">-</span><span class="syn09">&lt;level...></span>]</span> <span class="syn10">[<span class="syn">-clear</span>]</span> <span class="syn10">[<span class="syn">-count</span>]</span> <span class="syn10">[<span class="syn">-case</span>]</span> <span class="syn10">[<span class="syn">-date</span>]</span> <span class="syn10">[<span class="syn">-regexp</span> | <span class="syn">-word</span>]</span> <span class="syn10">[<span class="syn">-before</span> <span class="syn14">[<span class="syn13">&lt;#></span>]</span>]</span> <span class="syn10">[<span class="syn">-after</span> <span class="syn14">[<span class="syn13">&lt;#></span>]</span>]</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;# before+after></span>]</span> <span class="syn10">[<span class="syn09">&lt;pattern></span>]</span> <span class="syn10">[<span class="syn09">&lt;count></span> <span class="syn14">[<span class="syn13">&lt;start></span>]</span>]</span></code></pre></div>



### Parameters ###


| `-`: |           Doesn't print the 'Lastlog:' and 'End of Lastlog' messages. |
| `-file`: |       Output the lastlog to a file instead of the active window. |
| `-window`: |     Specifies the window to check. |
| `-new`: |        Only displays results since the previous lastlog. |
| `-away`: |       Only displays results since you previous away status. |
| `-<level>`: |    Specifies the levels to check (e.g. -joins -quits -hilight) |
| `-clear`: |      Removes the previous results from the active window. |
| `-count`: |      Displays how many lines match. |
| `-case`: |       Performs a case-sensitive matching. |
| `-date`: |       Prepends each row with the message's date |
| `-regexp`: |     The given text pattern is a regular expression. |
| `-word`: |       The text must match full words. |
| `-force`: |      Forces to display the lastlog, even if it exceeds 1000 lines. |
| `-after`: |      Include this many lines of content after the match. |
| `-before`: |     Include this many lines of content before the match. |
| `-<#>`: |        Include this many lines of content around the match. |
| `<count>`: |     Display a maximum number of `count` lines. |
| `<start>`: |     Skip the last `start` lines. |
{:.table.kv}

The pattern to search for and the maximum of lines to display; if no
parameter is given, the entire window buffer will be displayed.

### Description ###

Searches the active window for a pattern and displays the result.

### Examples ###

    /LASTLOG holiday
    /LASTLOG 'is on vacation' 10
    /LASTLOG -force -file ~/mike.log 'mike'
    /LASTLOG -hilight
    /LASTLOG -5 searchterm

### See also ###
[HILIGHT](/documentation/help/hilight/), [SCROLLBACK](/documentation/help/scrollback/)

