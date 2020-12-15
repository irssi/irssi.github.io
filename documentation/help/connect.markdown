---
layout: page
title: "Help: connect"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/connect.in
- https://github.com/irssi/irssi/blob/master/src/core/chat-commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:7ch"><code><span class="synB">CONNECT</span> <span class="syn10">[<span class="syn">-4</span> | <span class="syn">-6</span>]</span> <span class="syn10">[<span class="syn">-tls</span>]</span> <span class="syn10">[<span class="syn">-tls_cert</span> <span class="syn09">&lt;cert></span>]</span> <span class="syn10">[<span class="syn">-tls_pkey</span> <span class="syn09">&lt;pkey></span>]</span> <span class="syn10">[<span class="syn">-tls_pass</span> <span class="syn09">&lt;password></span>]</span> <span class="syn10">[<span class="syn">-tls_verify</span>]</span> <span class="syn10">[<span class="syn">-tls_cafile</span> <span class="syn09">&lt;cafile></span>]</span> <span class="syn10">[<span class="syn">-tls_capath</span> <span class="syn09">&lt;capath></span>]</span> <span class="syn10">[<span class="syn">-tls_ciphers</span> <span class="syn09">&lt;list></span>]</span> <span class="syn10">[<span class="syn">-tls_pinned_cert</span> <span class="syn09">&lt;fingerprint></span>]</span> <span class="syn10">[<span class="syn">-tls_pinned_pubkey</span> <span class="syn09">&lt;fingerprint></span>]</span> <span class="syn10">[<span class="syn">-!</span>]</span> <span class="syn10">[<span class="syn">-noautosendcmd</span>]</span> <span class="syn10">[<span class="syn">-noproxy</span>]</span> <span class="syn10">[<span class="syn">-network</span> <span class="syn09">&lt;network></span>]</span> <span class="syn10">[<span class="syn">-host</span> <span class="syn09">&lt;hostname></span>]</span> <span class="syn10">[<span class="syn">-rawlog</span> <span class="syn09">&lt;file></span>]</span> <span class="synB05">&lt;address></span>|<span class="synB05">&lt;chatnet></span> <span class="syn10">[<span class="syn09">&lt;port></span> <span class="syn14">[<span class="syn13">&lt;password></span> <span class="syn13">[<span class="syn14">&lt;nick></span>]</span>]</span>]</span></code></pre></div>



### Parameters ###


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
| `-noproxy`: |            Ignores the global proxy configuration. |
| `-network`: |            The network this connection belongs to. |
| `-host`: |               The hostname you would like to connect from. |
| `-rawlog`: |             Immediately open rawlog after connecting. |
| `-!`: |                  Doesn't autojoin channels. |
| `-noautosendcmd`: |      Doesn't execute autosendcmd. |
{:.table.kv}

A network or server to connect to; you can optionally specify a custom port,
password and nickname.

### Description ###

Opens a new connection to the specified network or server; existing
connections are kept.

### Examples ###

    /CONNECT Freenode
    /CONNECT -6 Freenode
    /CONNECT -4 -! -host staff.irssi.org -network Freenode orwell.freenode.net
    /CONNECT irc.irssi.org 6667 WzerT8zq mike

### See also ###
[DISCONNECT](/documentation/help/disconnect/), [RMRECONNS](/documentation/help/rmreconns/), [SERVER](/documentation/help/server/)

