---
layout: page
title: "Help: unban"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/unban.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/bans.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">UNBAN</span> <span class="synB">-first</span> | <span class="synB">-last</span> | <span class="synB05">&lt;id></span> | <span class="synB05">&lt;masks></span></code></pre></div>



### Parameters ###


| `-normal`: |     Uses the \*!\*user@*.domain.tld format. |
| `-user`: |       Uses the \*!\*user@* format. |
| `-host`: |       Uses the \*!\*@host.domain.tld format. |
| `-domain`: |     Uses the \*!\*@*.domain.tld format. |
| `-custom`: |     Uses the custom format. |
| `-first`: |      Removes the first ban from the list. |
| `-last`: |       Removes the last ban from the list. |
{:.table.kv}

A channel and the nicknames, hostnames or ban identifier to unban; if no
channel is given, the active channel will be used.

If no ban format parameter is given, the value of the ban_type setting will
be used to generate the hostmask to ban.

### Description ###

Removes one or more bans from a channel.

### Configuring the custom format ###

You must set the custom ban_type to the format you would like to use. For
example, if you set the custom ban_type to 'nick domain', it will generate
a ban based on the nick!\*@\*.domain.tld format.

### Examples ###

    /UNBAN mike
    /UNBAN -host bob
    /UNBAN *!*@*.irssi.org
    /UNBAN *!*@*.users.irssi.org *!*@*.staff.irssi.org
    /UNBAN -first
    /UNBAN 5

    /SET ban_type custom nick domain
    /SET ban_type custom user host

### See also ###
[BAN](/documentation/help/ban), [DEOP](/documentation/help/deop), [KICKBAN](/documentation/help/kickban), [KNOCKOUT](/documentation/help/knockout), [OP](/documentation/help/op)

