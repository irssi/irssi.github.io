---
layout: page
title: "Help: stats"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/stats.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">STATS</span> <span class="synB05">&lt;type></span> <span class="syn10">[<span class="syn09">&lt;server></span>]</span></code></pre></div>



### Parameters ###

The statistic identifier and the remote server; if no remote server is
given, the active server will be used.

### Description ###

Displays statistics from the IRC server; some statistics require you to have
    IRC operators privileges and might differ between IRC networks.

Common statistics:


| `C`: |     Displays the servers the server may connect to. |
| `H`: |     Displays hub server the server may connect to. |
| `K`: |     Displays the permanent blacklist of hostnames which are prohibited from connecting to the server. |
| `k`: |     Displays the temporary blacklist of hostname which are prohibited from connecting to the server. |
| `I`: |     Displays the list of hostnames which are allowed to connect to the server. |
| `L`: |     Displays the list of connected users and servers. |
| `M`: |     Displays the list of commands and how many times they have been issued. |
| `O`: |     Displays the list of hostnames and users which are allowed to become IRC operators. |
| `P`: |     Displays the ports the server is listening on. |
| `p`: |     Displays the IRC operators and their idle time. |
| `u`: |     Displays the uptime of the server. |
| `Y`: |     Displays the list of connection groups users are placed into. |
| `?`: |     Displays information about the utilized bandwidth. |
{:.table.kv}

### Examples ###

    /STATS p
    /STATS I ircsource.irssi.org

### See also ###
[MOTD](/documentation/help/motd/), [OPER](/documentation/help/oper/)

