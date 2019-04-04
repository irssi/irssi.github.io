---
layout: page
title: "Help: eval"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/eval.in
- https://github.com/irssi/irssi/blob/master/src/core/commands.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">EVAL</span> <span class="synB05">&lt;command(s)></span></code></pre></div>



### Parameters ###

The commands to evaluate.

### Description ###

Evaluates the given commands and executes them; you can use internal
variables and separate multiple commands by using the ';' character.

### Examples ###

    /EVAL echo I am connected to ${S} on ${chatnet} as ${N}
    /EVAL echo My user privileges are +${usermode}; echo Let's party!

### References ###



[https://github.com/irssi/irssi/blob/master/docs/special_vars.txt](https://github.com/irssi/irssi/blob/master/docs/special_vars.txt)



### See also ###
[CAT](/documentation/help/cat), [CD](/documentation/help/cd), [ECHO](/documentation/help/echo), [EXEC](/documentation/help/exec)

