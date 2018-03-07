---
layout: page
title: "Help: rawlog"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/rawlog.in
- https://github.com/irssi/irssi/blob/master/src/core/rawlog.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">RAWLOG</span> <span class="synB">SAVE</span> <span class="synB05">&lt;file></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">RAWLOG</span> <span class="synB">OPEN</span> <span class="synB05">&lt;file></span></code></pre></div>


RAWLOG CLOSE

### Parameters ###


| `SAVE`: |      Saves the raw server buffer into a file. |
| `OPEN`: |      Opens a log file and start logging all raw data. |
| `CLOSE`: |     Closes the log file |
{:.table.kv}

The filename to store the raw data into.

### Description ###

Saves all the raw data that is received from and transmitted to the active
server into a log file.

### Examples ###

    /RAWLOG SAVE ~/server.log
    /RAWLOG OPEN ~/debug.log
    /RAWLOG CLOSE

### See also ###
[LOG](/documentation/help/log)

