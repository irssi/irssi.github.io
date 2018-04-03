---
layout: page
title: "Help: statusbar (1.2)"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/statusbar.in
- https://github.com/irssi/irssi/blob/master/src/fe-text/statusbar-config.c


{% endcomment %}
[Help index](/documentation/help/index_(1.2))

[ [v1.1](/documentation/help/statusbar) ] - [ v1.2 ]

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">STATUSBAR</span> <span class="synB">ADD</span>|<span class="synB">MODIFY</span> <span class="syn10">[<span class="syn">-disable</span> | <span class="syn">-nodisable</span>]</span> <span class="syn10">[<span class="syn">-type</span> <span class="syn">window</span>|<span class="syn">root</span>]</span> <span class="syn10">[<span class="syn">-placement</span> <span class="syn">top</span>|<span class="syn">bottom</span>]</span> <span class="syn10">[<span class="syn">-position</span> <span class="syn">#</span>]</span> <span class="syn10">[<span class="syn">-visible</span> <span class="syn">always</span>|<span class="syn">active</span>|<span class="syn">inactive</span>]</span> <span class="synB05">&lt;statusbar></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">STATUSBAR</span> <span class="synB">RESET</span> <span class="synB05">&lt;statusbar></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">STATUSBAR</span> <span class="synB">ADDITEM</span>|<span class="synB">MODIFYITEM</span> <span class="syn10">[<span class="syn">-before</span> | <span class="syn">-after</span> <span class="syn09">&lt;item></span>]</span> <span class="syn10">[<span class="syn">-priority</span> <span class="syn">#</span>]</span> <span class="syn10">[<span class="syn">-alignment</span> <span class="syn">left</span>|<span class="syn">right</span>]</span> <span class="synB05">&lt;item></span> <span class="synB05">&lt;statusbar></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:20ch"><code><span class="synB">STATUSBAR</span> <span class="synB">REMOVEITEM</span> <span class="synB05">&lt;item></span> <span class="synB05">&lt;statusbar></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">STATUSBAR</span> <span class="synB">INFO</span> <span class="synB05">&lt;statusbar></span></code></pre></div>



### Parameters ###


| `ADD`: |           Adds a statusbar to the list of statusbars. |
| `MODIFY`: |        Modifies the configuration of a statusbar. |
| `RESET`: |         Restores the default statusbar configuration. |
| `ADDITEM`: |       Adds an item to the specified statusbar. It can be set to appear before/after another item and left/right aligned to a specified position on the screen. |
| `MODIFYITEM`: |    Changes an item position inside a bar. |
| `REMOVEITEM`: |    Removes an item from the specified statusbar. |
| `INFO`: |          List the current details and items of the specified statusbar. |
{:.table.kv}


| `-disable`: |      Removes a statusbar from the list. |
| `-type`: |         Sets the type of statusbar, for each split window or only for the current root screen. |
| `-placement`: |    Sets the placement of the statusbar, either at the top or the bottom of the screen. |
| `-position`: |     Sets the position of the statusbar. Represented as a number, with 0 implying the first position. |
| `-visible`: |      Sets the visibility of the statusbar or item. If set to always it is visible on all screens, otherwise if set to inactive or active then it is only visible on inactive or active screens, respectively. |
| `-before`: |       This item is added before the other item. |
| `-after`: |        This item is added after the other item. |
| `-priority`: |     When the statusbar items overflow, the item with the lowest priority is removed first |
| `-alignment`: |    Display the item on the right side. |
{:.table.kv}

Where statusbar refers to the name of the statusbar; if no argument is
given, the entire list of statusbars will be displayed.

### Description ###

Allows adjustment of the attributes and items of a statusbar, as well
as where it is located and whether or not it is currently visible.

### Examples ###

    /STATUSBAR
    /STATUSBAR INFO window
    /STATUSBAR REMOVEITEM time window
    /STATUSBAR ADDITEM time window
    /STATUSBAR RESET window
    /STATUSBAR MODIFY -disable topic
    /STATUSBAR MODIFY -nodisable topic

### Remarks ###

Statusbar syntax was changed in Irssi 1.2. The old syntax is still
accepted for backward compatibility, but no longer documented.

### See also ###
[WINDOW](/documentation/help/window_(1.2))

