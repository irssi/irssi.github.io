---
layout: page
title: "Help: ban"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/ban.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/irc/fe-irc-commands.c
- https://github.com/irssi/irssi/blob/master/src/irc/core/bans.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">BAN</span> <span class="syn10">[<span class="syn09">&lt;channel></span>]</span> <span class="syn10">[<span class="syn09">&lt;nicks></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">BAN</span> <span class="syn10">[<span class="syn">-normal</span> | <span class="syn">-user</span> | <span class="syn">-host</span> | <span class="syn">-domain</span> | <span class="syn">-custom</span> <span class="syn09">&lt;type></span>]</span> <span class="synB05">&lt;nicks/masks></span></code></pre></div>



### Parameters ###


| `-normal`: |     Uses the \*!\*user@*.domain.tld format. |
| `-user`: |       Uses the \*!\*user@* format. |
| `-host`: |       Uses the \*!\*@host.domain.tld format. |
| `-domain`: |     Uses the \*!\*@*.domain.tld format. |
| `-custom`: |     Uses the custom format. |
{:.table.kv}

A channel and the nicknames or hostnames to ban; if no arguments are given
the bans in the active channel are displayed.

If no ban format parameter is given, the value of the ban_type setting will
be used to generate the hostmask to ban.

### Description ###

Adds one or more bans to a channel.

### Configuring the custom format ###

You must set the custom ban_type to the format you would like to use. For
example, if you set the custom ban_type to 'nick domain', it will generate
a ban based on the nick!\*@\*.domain.tld format.

### Examples ###

    /BAN
    /BAN mike
    /BAN -host bob
    /BAN *!*@*.irssi.org
    /BAN -domain sarah

    /SET ban_type custom nick domain
    /SET ban_type custom user host

### See also ###
[DEOP](/documentation/help/deop), [KICKBAN](/documentation/help/kickban), [KNOCKOUT](/documentation/help/knockout), [OP](/documentation/help/op), [UNBAN](/documentation/help/unban)

