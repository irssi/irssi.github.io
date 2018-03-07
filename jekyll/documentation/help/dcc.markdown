---
layout: page
title: "Help: dcc"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/dcc.in
- https://github.com/irssi/irssi/blob/master/src/irc/dcc/dcc-chat.c
- https://github.com/irssi/irssi/blob/master/src/irc/dcc/dcc-get.c
- https://github.com/irssi/irssi/blob/master/src/irc/dcc/dcc-resume.c
- https://github.com/irssi/irssi/blob/master/src/irc/dcc/dcc-server.c
- https://github.com/irssi/irssi/blob/master/src/irc/dcc/dcc.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">DCC</span> <span class="synB">CHAT</span> <span class="syn10">[<span class="syn">-passive</span>]</span> <span class="syn10">[<span class="syn09">&lt;nick></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">DCC</span> <span class="synB">GET</span> <span class="syn10">[<span class="syn09">&lt;nick></span> <span class="syn14">[<span class="syn13">&lt;file></span>]</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">DCC</span> <span class="synB">RESUME</span> <span class="syn10">[<span class="syn09">&lt;nick></span> <span class="syn14">[<span class="syn13">&lt;file></span>]</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">DCC</span> <span class="synB">SERVER</span> <span class="syn10">[<span class="syn">+</span>|<span class="syn">-scf</span>]</span> <span class="syn10">[<span class="syn">port</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">DCC</span> <span class="synB">CLOSE</span> <span class="synB05">&lt;type></span> <span class="synB05">&lt;nick></span> <span class="syn10">[<span class="syn09">&lt;file></span>]</span></code></pre></div>



### Parameters ###


| `CHAT`: |         Initiates or accept a chat request. |
| `GET`: |          Accepts a file transfer request. |
| `RESUME`: |       Resumes a file transfer. |
| `SERVER`: |       Starts a DCC server. |
| `CLOSE`: |        Closes a DCC connection. |
| `LIST`: |         Displays all the open DCC connections. |
{:.table.kv}


| `-passive`: |     Uses the passive DCC protocol. |
| `-scf`: |         Use any combination of the flags to indicate: 's' - send 'c' - chat 'f' - fserver |
{:.table.kv}

The nickname of the person to chat with, or the name of the file to
transfer.

### Description ###

The DCC protocol is used to initiate client-to-client chat connections
and file transfers.

If you are behind NAT, or if the firewall is too restrictive, you might
want to try if using the passive parameter resolves your connection
problem.

You can send files which contain special character or spaces by enclosing
the filename within quotes. For example: 'my file with spaces.txt'.

### Examples ###

    /DCC CHAT mike
    /DCC GET bob "summer vacation.mkv"
    /DCC SEND sarah "summer vacation.mkv"
    /DCC CLOSE get mike
    /DCC CLOSE send bob "summer vacation.mkv"

### See also ###
[CD](/documentation/help/cd)

