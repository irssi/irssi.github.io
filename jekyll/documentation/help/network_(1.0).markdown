---
layout: page
title: "Help: network (1.0)"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/network.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/irc/fe-ircnet.c


{% endcomment %}
[Help index](/documentation/help/index_(1.0))

[ v1.0 ] - [ [v1.1](/documentation/help/network) ]

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">NETWORK</span> <span class="synB">ADD</span>|<span class="synB">MODIFY</span> <span class="syn10">[<span class="syn">-nick</span> <span class="syn09">&lt;nick></span>]</span> <span class="syn10">[<span class="syn">-user</span> <span class="syn09">&lt;user></span>]</span> <span class="syn10">[<span class="syn">-realname</span> <span class="syn09">&lt;name></span>]</span> <span class="syn10">[<span class="syn">-host</span> <span class="syn09">&lt;host></span>]</span> <span class="syn10">[<span class="syn">-usermode</span> <span class="syn09">&lt;mode></span>]</span> <span class="syn10">[<span class="syn">-autosendcmd</span> <span class="syn09">&lt;cmd></span>]</span> <span class="syn10">[<span class="syn">-querychans</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-whois</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-msgs</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-kicks</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-modes</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-cmdspeed</span> <span class="syn09">&lt;ms></span>]</span> <span class="syn10">[<span class="syn">-cmdmax</span> <span class="syn09">&lt;count></span>]</span> <span class="syn10">[<span class="syn">-sasl_mechanism</span> <span class="syn09">&lt;mechanism></span>]</span> <span class="syn10">[<span class="syn">-sasl_username</span> <span class="syn09">&lt;username></span>]</span> <span class="syn10">[<span class="syn">-sasl_password</span> <span class="syn09">&lt;password></span>]</span> <span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">NETWORK</span> <span class="synB">REMOVE</span> <span class="synB05">&lt;network></span></code></pre></div>



### Parameters ###


| `LIST`: |             Displays the list of configured networks. |
| `ADD`: |              Adds a network to your configuration. |
| `MODIFY`: |           Modifies a network in your configuration. |
| `REMOVE`: |           Removes a network from your configuration. |
{:.table.kv}


| `-nick`: |            Specifies the nickname to use. |
| `-user`: |            Specifies the user identity to use. |
| `-realname`: |        Specifies the real name to use. |
| `-host`: |            Specifies the hostname to use. |
| `-usermode`: |        Specifies the user modes to set on yourself. |
| `-autosendcmd`: |     Specifies the commands, separated by the ';' character, and enclosed within two "'" characters, to perform after connecting. |
| `-querychans`: |      Specifies the maximum number of channels to put in one MODE or WHO command when synchronizing. |
| `-whois`: |           Specifies the maximum number of nicknames in one WHOIS command. |
| `-msgs`: |            Specifies the maximum number of nicknames in one PRIVMSG command. |
| `-kicks`: |           Specifies the maximum number of nicknames in one KICK command. |
| `-modes`: |           Specifies the maximum number of nicknames in one MODE command. |
| `-cmdspeed`: |        Specifies the minimum amount of time, expressed in milliseconds, that the client must wait before sending additional commands to the server. |
| `-cmdmax`: |          Specifies the maximum number of commands to perform before starting the internal flood protection. |
| `-sasl_mechanism` | Specifies the mechanism to use for the SASL authentication. At the moment irssi only supports the 'plain' and the 'external' mechanisms. Use '' to disable the authentication. |
| `-sasl_username` | Specifies the username to use during the SASL authentication. |
| `-sasl_password` | Specifies the password to use during the SASL authentication. |
{:.table.kv}


The name of the network to add, edit or remove; if no parameter is given,
the list of networks will be displayed.

### Description ###

Displays, adds, modifies or removes the network configuration of IRC
networks.

When using the ADD parameter on a network that already exists, the
configuration will be merged with each other.

We recommend using 'WAIT 2000' between the automated commands in order to
prevent you from being kicked from the network due to flooding commands.

### Examples ###

    /NETWORK ADD -usermode +giw EFnet
    /NETWORK ADD -usermode +iw -nick mike -realname 'The one and only mike!' -host staff.irssi.org Freenode
    /NETWORK ADD -autosendcmd '^MSG NickServ identify WzerT8zq' Freenode
    /NETWORK ADD -autosendcmd '^MSG Q@CServe.quakenet.org AUTH mike WzerT8zq; WAIT 2000; OPER mike WzerT8zq; WAIT 2000; MODE mike +kXP' Quakenet
    /NETWORK MODIFY -usermode +gi EFnet
    /NETWORK REMOVE Freenode

### See also ###
[CHANNEL](/documentation/help/channel), [CONNECT](/documentation/help/connect), [SERVER](/documentation/help/server)

