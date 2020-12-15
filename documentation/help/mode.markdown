---
layout: page
title: "Help: mode"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/mode.in
- https://github.com/irssi/irssi/blob/master/src/irc/core/modes.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">MODE</span> <span class="synB05">&lt;your nick></span>|<span class="synB05">&lt;channel></span> <span class="syn10">[<span class="syn09">&lt;mode></span> <span class="syn14">[<span class="syn13">&lt;mode parameters></span>]</span>]</span></code></pre></div>



### Parameters ###

The target nickname or channel and the modes with their parameters to set or
remove.

If the target nickname or channel is omitted, the active nickname or channel
will be used.

### Description ###

Modifies the user or channel modes for which you are privileged to modify.

You can specify multiple modes in one command and prepend them by using the
    '+' sign to set or '-' sign to unset; modes that require a parameter will be
retrieved from the argument list.

Some common channel modes are:


| `b <mask>`: |         Adds or removes a ban; a ban will prevent a user who matches the given mask from joining the channel unless he or she is invited or in the exempt list. |
| `e <mask>`: |         Adds or removes a ban exception; users who match a mask on the exempt list are able to join a channel even if they also match an entry on the ban list. |
| `i`: |                When enabled, users need to be invited into the channel or have a matching entry in the invite list. |
| `I <mask>`: |         Adds or removes an invite; users who match a mask on the invite list are able to join even if the channel is set to invite only. |
| `k <key>`: |          Adds or removes a channel key, aka a password; users will not be able to join the channel without providing the key. |
| `l <count>`: |        Adds, removes or updates the maximum amount of users that may join the channel. |
| `m`: |                When enabled, users who are not opped or voiced cannot send messages to the channel. |
| `n`: |                When enabled, users who are not on the channel cannot send messages to it. |
| `p`: |                When enabled, the channel will not be displayed in your WHOIS output. |
| `s`: |                When enabled, the channel will not be displayed in the LIST output. |
| `t`: |                When enabled, users who are not opped or voices cannot modify the channel topic. |
| `o <nickname>`: |     Adds or removes the operator status from a nickname. |
| `v <nickname>`: |     Adds or removes the voice status from a nickname. |
{:.table.kv}

Some common user modes are:


| `i`: |                When enabled, other users will not be able to see you on a WHO output unless they are in the channel themselves. |
| `w`: |                When enabled, you will receive WALLOP messages from IRC operators. |
| `s`: |                When enabled, you will receive special notices or debug messages from the server. |
{:.table.kv}

Many networks have additional user and channel modes; we highly recommend
you to read the documentation of the networks you frequently connect to and
maximize your IRC experience.

### Examples ###

    /MODE #irssi +o mike
    /MODE #irssi -o+iI mike mike!*@*.irssi.org
    /MODE +b mike!*@*.irssi.org
    /MODE -o mike
    /MODE +impsnkl secret_hideout 100
    /MODE mike +iw

### See also ###
[BAN](/documentation/help/ban/), [DEOP](/documentation/help/deop/), [DEVOICE](/documentation/help/devoice/), [OP](/documentation/help/op/), [UNBAN](/documentation/help/unban/), [VOICE](/documentation/help/voice/)

