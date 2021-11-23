---
layout: page
title: "Help: channel"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/channel.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-channels.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">CHANNEL</span> <span class="synB">LIST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">CHANNEL</span> <span class="synB">ADD</span>|<span class="synB">MODIFY</span> <span class="syn10">[<span class="syn">-auto</span> | <span class="syn">-noauto</span>]</span> <span class="syn10">[<span class="syn">-bots</span> <span class="syn09">&lt;masks></span>]</span> <span class="syn10">[<span class="syn">-botcmd</span> <span class="syn09">&lt;command></span>]</span> <span class="synB05">&lt;channel></span> <span class="synB05">&lt;network></span> <span class="syn10">[<span class="syn09">&lt;password></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">CHANNEL</span> <span class="synB">REMOVE</span> <span class="synB05">&lt;channel></span> <span class="synB05">&lt;network></span></code></pre></div>



### Parameters ###


| `LIST`: |        Displays the list of configured channels. |
| `ADD`: |         Adds a channel to your configuration. |
| `MODIFY`: |      Modifies a channel in your configuration. |
| `REMOVE`: |      Removes a channel from your configuration. |
{:.table.kv}


| `-auto`: |       Automatically join the channel. |
| `-noauto`: |     Don't join the channel automatically. |
| `-bots`: |       The list of hostnames send automated commands to. |
| `-botcmd`: |     The automated commands to perform. |
{:.table.kv}

The channel and network to add to the configuration; you can optionally
specify the password of a channel.

If no parameters are given, the list of channels you have joined will be
displayed.

### Description ###

Adds, removes or displays the configuration of channels; this method is
used to automate and simplify your workflow.

You can use the ADDALLCHANS command, which is a default alias, to add all
the channels you are present on into the configuration.

### Examples ###

    /CHANNEL
    /CHANNEL LIST
    /CHANNEL ADD -auto #irssi ExampleNet
    /CHANNEL ADD -auto #basementcat Quakenet secret_lair
    /CHANNEL ADD -auto -bots '*!@*.irssi.org *!bot@irssi.org' -botcmd 'msg $0 op WzerTrzq' #hideout ExampleNet
    /CHANNEL ADD -auto -bots 'Q!TheQBot@CServe.quakenet.org' -botcmd '^MSG Q op #irssi' #irssi Quakenet
    /CHANNEL MODIFY -noauto #irssi ExampleNet
    /CHANNEL REMOVE #hideout ExampleNet

### Special Example ###

    /ADDALLCHANS

### See also ###
[JOIN](/documentation/help/join), [TS](/documentation/help/ts)

