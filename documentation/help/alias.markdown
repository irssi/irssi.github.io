---
layout: page
title: "Help: alias"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/alias.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-settings.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">ALIAS</span> <span class="syn10">[<span class="syn14">[<span class="synB">-</span>]</span><span class="syn09">&lt;alias></span> <span class="syn14">[<span class="syn13">&lt;command></span>]</span>]</span></code></pre></div>



### Parameters ###

A name of the alias and the command to execute. You can prepend the alias
with the '-' character to remove the alias; if no argument is given, your
aliases will be displayed.

### Description ###

Creates or updates an alias; you can use the ';' character to separate
multiple commands.

The parameters given to the alias are expanded in '$[\d]'; for example $0,
    $1, $2, $8, ..., as well as any other special variable.

If you don't use any parameters in your alias, all parameters will be
automatically appended after it.

### Examples ###

    /ALIAS
    /ALIAS UH USERHOST
    /ALIAS COMEBACK SAY I was hoping for a battle of wits, but you seem to be unarmed.
    /ALIAS -COMEBACK
    /ALIAS UNACT SCRIPT EXEC \$_->activity(0) for Irssi::windows
    /ALIAS QOP ^MSG Q op $C

### References ###



[https://github.com/irssi/irssi/blob/master/docs/special_vars.txt](https://github.com/irssi/irssi/blob/master/docs/special_vars.txt)



### See also ###
[BIND](/documentation/help/bind/), [UNALIAS](/documentation/help/unalias/)

