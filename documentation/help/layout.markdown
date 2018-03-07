---
layout: page
title: "Help: layout"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/layout.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/window-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">LAYOUT</span> <span class="synB">SAVE</span></code></pre></div>


LAYOUT RESET

### Parameters ###


| `SAVE`: |      Saves your layout to the configuration. |
| `RESET`: |     Removes the saved layout from the configuration. |
{:.table.kv}

### Description ###

Saves the layout of your window configuration; the next time you connect
to the server, you will join the channels in the same window as before.

This method enables you to keep the same window layout when you start Irssi
the next time.

You will need to use the SAVE command to confirm and commit the changes
into the configuration file.

### Examples ###

    /LAYOUT SAVE
    /LAYOUT RESET

### See also ###
[SAVE](/documentation/help/save), [WINDOW](/documentation/help/window)

