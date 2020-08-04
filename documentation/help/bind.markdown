---
layout: page
title: "Help: bind"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/bind.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/keyboard.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

<div markdown="1" class="version">
* [v1.1](/documentation/help/bind_(1.1))
* v1.2
</div>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">BIND</span> <span class="syn10">[<span class="syn">-list</span>]</span> <span class="syn10">[<span class="syn">-delete</span> | <span class="syn">-reset</span>]</span> <span class="syn10">[<span class="syn09">&lt;key></span> <span class="syn14">[<span class="syn13">&lt;command></span> <span class="syn13">[<span class="syn14">&lt;data></span>]</span>]</span>]</span></code></pre></div>



### Parameters ###


| [`-list`](/documentation/help/bind_-list): |       Displays a list of all the bindable commands. |
| `-delete`: |     Removes the binding. |
| `-reset`: |      Reset a key to its default binding. |
{:.table.kv}

A name of the binding and the command to perform; if no parameter is given,
the list of bindings will be displayed.

Details:

Adds or removes a binding; the binding itself is case-sensitive and may
contain as many characters as you want.

Uppercase characters usually indicate that you need to keep the shift-key
pressed to use the binding.

### Examples ###

    /BIND
    /BIND meta-c /CLEAR
    /BIND meta-q change_window 16
    /BIND -delete meta-y
    /BIND ^W^C /WINDOW NEW HIDE
    /BIND ^W^K /WINDOW KILL
    /BIND ^[[11~ command AWAY I'm off for today :)
    /BIND ^[[12~ command AWAY

### See also ###
[ALIAS](/documentation/help/alias)

