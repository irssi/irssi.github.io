---
layout: page
title: "Help: ignore"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/ignore.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-ignore.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">IGNORE</span> <span class="syn10">[<span class="syn">-regexp</span> | <span class="syn">-full</span>]</span> <span class="syn10">[<span class="syn">-pattern</span> <span class="syn09">&lt;pattern></span>]</span> <span class="syn10">[<span class="syn">-except</span>]</span> <span class="syn10">[<span class="syn">-replies</span>]</span> <span class="syn10">[<span class="syn">-network</span> <span class="syn09">&lt;network></span>]</span> <span class="syn10">[<span class="syn">-channels</span> <span class="syn09">&lt;channel></span>]</span> <span class="syn10">[<span class="syn">-time</span> <span class="syn09">&lt;secs></span>]</span> <span class="synB05">&lt;mask></span> <span class="syn10">[<span class="syn09">&lt;levels></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">IGNORE</span> <span class="syn10">[<span class="syn">-regexp</span> | <span class="syn">-full</span>]</span> <span class="syn10">[<span class="syn">-pattern</span> <span class="syn09">&lt;pattern></span>]</span> <span class="syn10">[<span class="syn">-except</span>]</span> <span class="syn10">[<span class="syn">-replies</span>]</span> <span class="syn10">[<span class="syn">-network</span> <span class="syn09">&lt;network></span>]</span> <span class="syn10">[<span class="syn">-time</span> <span class="syn09">&lt;secs></span>]</span> <span class="synB05">&lt;channels></span> <span class="syn10">[<span class="syn09">&lt;levels></span>]</span></code></pre></div>



### Parameters ###


| `-regexp`: |       Indicates that the pattern is a regular expression. |
| `-full`: |         Indicates that the pattern must match a full word. |
| `-pattern`: |      The text pattern to ignore. |
| `-except`: |       Negates the ignore. |
| `-replies`: |      Also ignore nicknames who are talking to anyone who matches the ignore. |
| `-network`: |      Ignores only on a specific network. |
| `-channels`: |     Ignores only on specific channels. |
| `-time`: |         The timeout to automatically remove the ignore. |
{:.table.kv}

The mask, channels and levels to ignore; if no argument is provided, the
list of ignores will be displayed.

### Description ###

Ignores nicknames or text that matches a pattern.

The special level 'NO_ACT' can be used to ignore activity in the statusbar
without actually ignoring the message; this behavior is somewhat special
because it is allowed in addition to other ignores for the same target.
The special level 'HIDDEN' can be used to hide matching messages that can
later be revealed using /WINDOW HIDELEVEL -HIDDEN

### Examples ###

    /IGNORE
    /IGNORE * JOINS
    /IGNORE * CTCPS
    /IGNORE -except *!*@*.irssi.org CTCPS
    /IGNORE #irssi ALL -PUBLIC -ACTIONS
    /IGNORE -replies *!*@*.irssi.org ALL
    /IGNORE -regexp -pattern (away|gone|back|playing|returned) * ACTIONS
    /IGNORE *zzz* NICKS
    /IGNORE *afk* NICKS
    /IGNORE *away* NICKS
    /IGNORE #irssi NO_ACT JOINS PARTS QUITS
    /IGNORE mike NO_ACT -MSGS
    /IGNORE mike HIDDEN PUBLIC JOINS PARTS QUITS
    /IGNORE -regexp -pattern

### See also ###
[ACCEPT](/documentation/help/accept/), [SILENCE](/documentation/help/silence/), [UNIGNORE](/documentation/help/unignore/)

