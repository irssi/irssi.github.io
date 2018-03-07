---
layout: page
title: "Help: exec"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/exec.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-exec.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">EXEC</span> <span class="syn10">[<span class="syn">-</span>]</span> <span class="syn10">[<span class="syn">-nosh</span>]</span> <span class="syn10">[<span class="syn">-out</span> | <span class="syn">-msg</span> <span class="syn09">&lt;target></span> | <span class="syn">-notice</span> <span class="syn09">&lt;target></span>]</span> <span class="syn10">[<span class="syn">-name</span> <span class="syn09">&lt;name></span>]</span> <span class="synB05">&lt;cmd line></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">EXEC</span> <span class="synB">-out</span> | <span class="synB">-window</span> | <span class="synB">-msg</span> <span class="synB05">&lt;target></span> | <span class="synB">-notice</span> <span class="synB05">&lt;target></span> | <span class="synB">-close</span> | <span class="synB">-</span><span class="synB05">&lt;signal></span> <span class="synB">%</span><span class="synB05">&lt;id></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:4ch"><code><span class="synB">EXEC</span> <span class="synB">-in</span> <span class="synB">%</span><span class="synB05">&lt;id></span> <span class="synB05">&lt;text to send to process></span></code></pre></div>



### Parameters ###


| `-`: |                Suppresses the process termination notification. |
| `-nosh`: |            Doesn't execute the command through /bin/sh. |
| `-out`: |             Sends the output to the active channel or query. |
| `-msg`: |             Sends the output to the specified nickname or channel. |
| `-notice`: |          Sends the output to the specified nickname or channel as notices. |
| `-name`: |            Gives the process the specified name. |
| `-window`: |          Displays the output in the active window. |
| `-close`: |           Forcibly closes a process that doesn't die. |
| `-<signal>`: |        Sends the given signal to the process. |
| `-in`: |              Sends text to the standard input of the process. |
| `-interactive`: |     Executes the process in a new window item. |
{:.table.kv}

The command to execute; if no output parameter is given, the active window
will be used and if no parameters are given at all, the list of active
processes will be displayed.

### Description ###

Executes the specified command in the background; the process can be
accessed by its id or the name you gave it.

The output of the process can be redirected to various targets, such as
a window, a channel, a nickname or a query.

The process identifier must always begin with the '%' character. For
example %0.

If you remove a process with the close parameter, it will only make Irssi
detach from it; the process will keep running until it terminates.

### Examples ###

    /EXEC
    /EXEC ls
    /EXEC -msg #irssi cat unicorn.txt
    /EXEC -out cat /etc/passwd | grep $USER | awk -F: '{print $5}'
    /EXEC -name ssh -nosh -interactive -window ssh staff.irssi.org
    /EXEC -close mailserver
    /EXEC -close %0

### See also ###
[CAT](/documentation/help/cat), [CD](/documentation/help/cd), [ECHO](/documentation/help/echo), [EVAL](/documentation/help/eval)

