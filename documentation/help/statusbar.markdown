---
layout: page
title: "Help: statusbar"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/statusbar.in
- https://github.com/irssi/irssi/blob/master/src/fe-text/statusbar-config.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">ENABLE</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">DISABLE</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">RESET</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">TYPE</span> <span class="synB">window</span>|<span class="synB">root</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">PLACEMENT</span> <span class="synB">top</span>|<span class="synB">bottom</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">POSITION</span> <span class="synB05">&lt;num></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">VISIBLE</span> <span class="synB">always</span>|<span class="synB">active</span>|<span class="synB">inactive</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">ADD</span> <span class="syn10">[<span class="syn">-before</span> | <span class="syn">-after</span> <span class="syn09">&lt;item></span>]</span> <span class="syn10">[<span class="syn">-priority</span> <span class="syn">#</span>]</span> <span class="syn10">[<span class="syn">-alignment</span> <span class="syn">left</span>|<span class="syn">right</span>]</span> <span class="synB05">&lt;item></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">STATUSBAR</span> <span class="synB05">&lt;name></span> <span class="synB">REMOVE</span> <span class="synB05">&lt;item></span></code></pre></div>



### Parameters ###


| `ENABLE`: |        Adds a statusbar to the list of statusbars. |
| `DISABLE`: |       Removes a statusbar from the list. Note that for built-in statusbars they can be enabled again should the user wish to add back the default statusbars. |
| `RESET`: |         Restores the default statusbar configuration. |
| `TYPE`: |          Sets the type of statusbar, for each split window or only for the current root screen. |
| `PLACEMENT`: |     Sets the placement of the statusbar, either at the top or the bottom of the screen. |
| `POSITION`: |      Sets the position of the statusbar. Represented as a number, with 0 implying the first position. |
| `VISIBLE`: |       Sets the visibility of the statusbar or item. If set to always it is visible on all screens, otherwise if set to inactive or active then it is only visible on inactive or active screens, respectively. |
| `ADD`: |           Adds an item to the specified statusbar. It can be set to appear before/after another item and left/right aligned to a specified position on the screen. |
| `REMOVE`: |        Removes an item from the specified statusbar. |
{:.table.kv}

Where name refers to the name of the statusbar; if no argument is
given, the entire list of statusbars will be displayed.

### Description ###

Allows adjustment of the attributes and items of a statusbar, as well
as where it is located and whether or not it is currently visible.

### Examples ###

    /STATUSBAR
    /STATUSBAR window
    /STATUSBAR window REMOVE time
    /STATUSBAR window ADD time
    /STATUSBAR window RESET
    /STATUSBAR topic DISABLE
    /STATUSBAR topic ENABLE

### See also ###
[WINDOW](/documentation/help/window)

