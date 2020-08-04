---
layout: page
title: "Help: server"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/server.in
- https://github.com/irssi/irssi/blob/master/src/core/chat-commands.c
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-server.c
- https://github.com/irssi/irssi/blob/master/src/fe-common/irc/fe-irc-server.c
- https://github.com/irssi/irssi/blob/master/src/irc/core/irc-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

<div markdown="1" class="version">
* [v1.0](/documentation/help/server_(1.0))
* v1.2
</div>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">SERVER</span> <span class="synB">CONNECT</span> <span class="syn10">[<span class="syn">-4</span> | <span class="syn">-6</span>]</span> <span class="syn10">[<span class="syn">-tls</span>]</span> <span class="syn10">[<span class="syn">-tls_cert</span> <span class="syn09">&lt;cert></span>]</span> <span class="syn10">[<span class="syn">-tls_pkey</span> <span class="syn09">&lt;pkey></span>]</span>  <span class="syn10">[<span class="syn">-tls_pass</span> <span class="syn09">&lt;password></span>]</span> <span class="syn10">[<span class="syn">-tls_verify</span>]</span> <span class="syn10">[<span class="syn">-tls_cafile</span> <span class="syn09">&lt;cafile></span>]</span>  <span class="syn10">[<span class="syn">-tls_capath</span> <span class="syn09">&lt;capath></span>]</span> <span class="syn10">[<span class="syn">-tls_ciphers</span> <span class="syn09">&lt;list></span>]</span> <span class="syn10">[<span class="syn">-tls_pinned_cert</span> <span class="syn09">&lt;fingerprint></span>]</span> <span class="syn10">[<span class="syn">-tls_pinned_pubkey</span> <span class="syn09">&lt;fingerprint></span>]</span> <span class="syn10">[<span class="syn">-!</span>]</span> <span class="syn10">[<span class="syn">-noautosendcmd</span>]</span> <span class="syn10">[<span class="syn">-noproxy</span>]</span> <span class="syn10">[<span class="syn">-network</span> <span class="syn09">&lt;network></span>]</span> <span class="syn10">[<span class="syn">-host</span> <span class="syn09">&lt;hostname></span>]</span> <span class="syn10">[<span class="syn">-rawlog</span> <span class="syn09">&lt;file></span>]</span> <span class="syn10">[<span class="syn">+</span>]</span><span class="synB05">&lt;address></span>|<span class="synB05">&lt;chatnet></span> <span class="syn10">[<span class="syn09">&lt;port></span> <span class="syn14">[<span class="syn13">&lt;password></span> <span class="syn13">[<span class="syn14">&lt;nick></span>]</span>]</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">SERVER</span> <span class="synB">REMOVE</span> <span class="synB05">&lt;address></span> <span class="syn10">[<span class="syn09">&lt;port></span>]</span> <span class="syn10">[<span class="syn09">&lt;network></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">SERVER</span> <span class="synB">ADD</span>|<span class="synB">MODIFY</span> <span class="syn10">[<span class="syn">-4</span> | <span class="syn">-6</span>]</span> <span class="syn10">[<span class="syn">-tls</span>]</span> <span class="syn10">[<span class="syn">-tls_cert</span> <span class="syn09">&lt;cert></span>]</span> <span class="syn10">[<span class="syn">-tls_pkey</span> <span class="syn09">&lt;pkey></span>]</span> <span class="syn10">[<span class="syn">-tls_pass</span> <span class="syn09">&lt;password></span>]</span> <span class="syn10">[<span class="syn">-tls_verify</span>]</span> <span class="syn10">[<span class="syn">-tls_cafile</span> <span class="syn09">&lt;cafile></span>]</span> <span class="syn10">[<span class="syn">-tls_capath</span> <span class="syn09">&lt;capath></span>]</span> <span class="syn10">[<span class="syn">-tls_ciphers</span> <span class="syn09">&lt;list></span>]</span> <span class="syn10">[<span class="syn">-auto</span> | <span class="syn">-noauto</span>]</span> <span class="syn10">[<span class="syn">-network</span> <span class="syn09">&lt;network></span>]</span> <span class="syn10">[<span class="syn">-host</span> <span class="syn09">&lt;hostname></span>]</span> <span class="syn10">[<span class="syn">-cmdspeed</span> <span class="syn09">&lt;ms></span>]</span> <span class="syn10">[<span class="syn">-cmdmax</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-port</span> <span class="syn09">&lt;port></span>]</span> <span class="synB05">&lt;address></span> <span class="syn10">[<span class="syn09">&lt;port></span> <span class="syn14">[<span class="syn13">&lt;password></span>]</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">SERVER</span> <span class="synB">LIST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">SERVER</span> <span class="synB">PURGE</span> <span class="syn10">[<span class="syn09">&lt;target></span>]</span></code></pre></div>



### Parameters ###


| `LIST`: |                Displays the list of servers you are connected to. |
| `CONNECT`: |             Connects to the given server. |
| `ADD`: |                 Adds a server to your configuration. |
| `MODIFY`: |              Modifies a server in your configuration. |
| `REMOVE`: |              Removes a server from your configuration. |
| `PURGE`: |               Purges the commands queued to be sent to the server. |
{:.table.kv}


| `-!`: |                  Doesn't autojoin the channels. |
| `-4`: |                  Connects using IPv4. |
| `-6`: |                  Connects using IPv6. |
| `-tls`: |                Connects using TLS encryption. |
| `-tls_cert`: |           The TLS client certificate file. |
| `-tls_pkey`: |           The TLS client private key, if not included in the certificate file. |
| `-tls_pass`: |           The password for the TLS client private key or certificate. |
| `-tls_verify`: |         Verifies the TLS certificate of the server. |
| `-tls_cafile`: |         The file with the list of CA certificates. |
| `-tls_capath`: |         The directory which contains the CA certificates. |
| `-tls_ciphers`: |        TLS cipher suite preference lists. |
| `-tls_pinned_cert`: |    Pinned x509 certificate fingerprint. |
| `-tls_pinned_pubkey`: |  Pinned public key fingerprint. |
| `-auto`: |               Automatically connects to the server on startup. |
| `-noauto`: |             Doesn't connect to the server on startup. |
| `-network`: |            The network the server belongs to. |
| `-host`: |               The hostname you would like to connect from. |
| `-cmdspeed`: |           Specifies the minimum amount of time, expressed in milliseconds, that the client must wait before sending additional commands to the server. |
| `-cmdmax`: |             Specifies the maximum number of commands to perform before starting the internal flood protection. |
| `-port`: |               Specifies the port to connect to the server. |
| `-noproxy`: |            Ignores the global proxy configuration. |
| `-rawlog`: |             Immediately open rawlog after connecting. |
| `-noautosendcmd`: |      Doesn't execute autosendcmd. |
{:.table.kv}

The server, port and network to add, modify or remove; if no argument is
given, the list of servers you are connected to will be returned.

### Description ###

Displays, adds, modifies or removes the network configuration of IRC
servers.

When using the ADD parameter on a server that already exists, the
configuration will be merged with each other.

When using the command without any of the given parameters, it will
connect to the specified server; the server in the active window will be
disconnected unless you prepend the server with the '+' character; the same
method is applicable to the CONNECT parameter.

Specify '-' as password to remove a server password

### Examples ###

    /SERVER
    /SERVER CONNECT chat.freenode.net
    /SERVER CONNECT +chat.freenode.net
    /SERVER ADD -network Freenode -noautosendcmd orwell.freenode.net
    /SERVER ADD -! -auto -host staff.irssi.org -4 -network Freenode -noproxy orwell.freenode.net 6667
    /SERVER MODIFY -network Freenode -noauto orwell.freenode.net
    /SERVER MODIFY -network Freenode orwell.freenode.net 6697 -
    /SERVER REMOVE orwell.freenode.net 6667 Freenode
    /SERVER PURGE
    /SERVER PURGE orwell.freenode.net

### See also ###
[CHANNEL](/documentation/help/channel), [CONNECT](/documentation/help/connect), [DISCONNECT](/documentation/help/disconnect), [NETWORK](/documentation/help/network), [RECONNECT](/documentation/help/reconnect), [RMRECONNS](/documentation/help/rmreconns)

