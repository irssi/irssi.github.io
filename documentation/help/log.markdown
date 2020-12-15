---
layout: page
title: "Help: log"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/log.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-log.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">LOG</span> <span class="synB">OPEN</span> <span class="syn10">[<span class="syn">-noopen</span>]</span> <span class="syn10">[<span class="syn">-autoopen</span>]</span> <span class="syn10">[<span class="syn">-window</span>]</span> <span class="syn10">[<span class="syn">-</span><span class="syn09">&lt;server tag></span>]</span> <span class="syn10">[<span class="syn">-targets</span> <span class="syn09">&lt;targets></span>]</span> <span class="syn10">[<span class="syn">-colors</span>]</span> <span class="synB05">&lt;fname></span> <span class="syn10">[<span class="syn09">&lt;levels></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">LOG</span> <span class="synB">CLOSE</span> <span class="synB05">&lt;id></span>|<span class="synB05">&lt;file></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">LOG</span> <span class="synB">START</span> <span class="synB05">&lt;id></span>|<span class="synB05">&lt;file></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">LOG</span> <span class="synB">STOP</span> <span class="synB05">&lt;id></span>|<span class="synB05">&lt;file></span></code></pre></div>



### Parameters ###


| `OPEN`: |              Opens a log file. |
| `CLOSE`: |             Closes a log file. |
| `START`: |             Starts logging a log entry. |
| `STOP`: |              Stops logging a log entry. |
{:.table.kv}


| `-noopen`: |           Saves the entry in the configuration, but doesn't actually start logging. |
| `-autoopen`: |         Automatically opens the log at startup. |
| `-window`: |           Displays the output to the active window, or the window specified in the targets parameter. |
| `-<server tag>`: |     The server tag the targets must be on. |
| `-targets`: |          Logs the specified nicknames or channels. |
| `-colors`: |           Also log the color codes of the messages. |
{:.table.kv}

The filename of the log and the levels to match; if no argument is given,
the list of open logs will be displayed.

### Description ###

Opens a log file and stores the messages of the given targets into it; the
log files will be locked so multiple clients cannot log to the same file.

You may use any of the date formats to create a log rotation; we strongly
recommend you to enable autolog if you are interested in keeping logs.

### Examples ###

    /LOG OPEN -targets mike ~/irclogs/mike.log MSGS
    /LOG OPEN -targets #irssi-freenode ~/irclogs/freenode/irssi-%Y-%m-%d
    /LOG CLOSE ~/irclogs/freenode/irssi-%Y-%m-%d
    /LOG STOP ~/irclogs/freenode/irssi-%Y-%m-%d
    /LOG START ~/irclogs/freenode/irssi-%Y-%m-%d

    /SET autolog ON

### References ###



[https://github.com/irssi/irssi/blob/master/docs/formats.txt](https://github.com/irssi/irssi/blob/master/docs/formats.txt)



### See also ###
[SET](/documentation/help/set/), [LOG](/documentation/help/log/), [WINDOW](/documentation/help/window/), [LOG](/documentation/help/log/)

