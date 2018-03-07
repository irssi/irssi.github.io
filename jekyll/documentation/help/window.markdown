---
layout: page
title: "Help: window"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/window.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-log.c
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/window-commands.c
- https://github.com/irssi/irssi/blob/master/src/fe-text/mainwindows.c
- https://github.com/irssi/irssi/blob/master/src/fe-text/textbuffer-commands.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LOG</span> <span class="synB">on</span>|<span class="synB">off</span>|<span class="synB">toggle</span> <span class="syn10">[<span class="syn09">&lt;filename></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">LOGFILE</span> <span class="synB05">&lt;file></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">NEW</span> <span class="syn10">[<span class="syn">HIDDEN</span>|<span class="syn">SPLIT</span>|<span class="syn">RSPLIT</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">CLOSE</span> <span class="syn10">[<span class="syn09">&lt;first></span> <span class="syn14">[<span class="syn13">&lt;last></span>]</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">REFNUM</span> <span class="synB05">&lt;number></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">GOTO</span> <span class="synB">active</span>|<span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">NEXT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LAST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">PREVIOUS</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">LEVEL</span> <span class="syn10">[<span class="syn09">&lt;level></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">IMMORTAL</span> <span class="synB">on</span>|<span class="synB">off</span>|<span class="synB">toggle</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">SERVER</span> <span class="syn10">[<span class="syn">-sticky</span> | <span class="syn">-unsticky</span>]</span> <span class="synB05">&lt;tag></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">PREV</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">NEXT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">GOTO</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">ITEM</span> <span class="synB">MOVE</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">NUMBER</span> <span class="syn10">[<span class="syn">-sticky</span>]</span> <span class="synB05">&lt;number></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">NAME</span> <span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">HISTORY</span> <span class="syn10">[<span class="syn">-clear</span>]</span> <span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">PREV</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">NEXT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">FIRST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">LAST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;direction></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LIST</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">THEME</span> <span class="syn10">[<span class="syn">-delete</span>]</span> <span class="syn10">[<span class="syn09">&lt;name></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">GROW</span> <span class="syn10">[<span class="syn09">&lt;lines></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">SHRINK</span> <span class="syn10">[<span class="syn09">&lt;lines></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">SIZE</span> <span class="synB05">&lt;lines></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">BALANCE</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">HIDE</span> <span class="syn10">[<span class="syn09">&lt;number></span>|<span class="syn09">&lt;name></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">SHOW</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">RSHOW</span> <span class="synB05">&lt;number></span>|<span class="synB05">&lt;name></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">RGROW</span> <span class="syn10">[<span class="syn09">&lt;columns></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">RSHRINK</span> <span class="syn10">[<span class="syn09">&lt;lines></span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">RSIZE</span> <span class="synB05">&lt;columns></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:14ch"><code><span class="synB">WINDOW</span> <span class="synB">RBALANCE</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:8ch"><code><span class="synB">WINDOW</span> <span class="synB">UP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:9ch"><code><span class="synB">WINDOW</span> <span class="synB">DUP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">DLEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">DOWN</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">DDOWN</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">DRIGHT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">WINDOW</span> <span class="synB">LEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:11ch"><code><span class="synB">WINDOW</span> <span class="synB">RIGHT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:12ch"><code><span class="synB">WINDOW</span> <span class="synB">STICK</span> <span class="syn10">[<span class="syn09">&lt;ref#></span>]</span> <span class="syn10">[<span class="syn">ON</span>|<span class="syn">OFF</span>]</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">LEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">RIGHT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DLEFT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:17ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DRIGHT</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">UP</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:15ch"><code><span class="synB">WINDOW</span> <span class="synB">MOVE</span> <span class="synB">DOWN</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:16ch"><code><span class="synB">WINDOW</span> <span class="synB">HIDELEVEL</span> <span class="syn10">[<span class="syn09">&lt;level></span>]</span></code></pre></div>



### Parameters ###


| `LOG`: | Turn on or off logging of the active window, optionally specifying the log file to use. |
| `LOGFILE`: | Sets the location of the log file to use for window logging without starting to log. |
| `NEW`: | Creates a new hidden or split window. |
| `CLOSE`: | Closes the current window, the specified one or all windows in the given range. |
| `REFNUM`: | Go to the window with the given number. |
| `GOTO`: | Go to the window with activity, with the given nickname, channel or with the specified number. |
| `NEXT`: | Go to the next window numerically. |
| `LAST`: | Go to the previously active window. |
| `PREVIOUS`: | Go to the previous window numerically. |
| `LEVEL`: | Changes the text levels to display in the window, or query the current level. |
| `IMMORTAL`: | Modifies or queries the window mortality status. Immortal windows have an extra protection against WINDOW CLOSE. |
| `SERVER`: | Change the active server of the window or the server stickyness. If the server is sticky, it cannot be cycled with next_window_item/previous_window_item |
| `ITEM PREV`: | Make the previous item in this window active. |
| `ITEM NEXT`: | Make the next item in this window active. |
| `ITEM GOTO`: | Change to the query with the specified nickname, channel with the given name or window item number. |
| `ITEM MOVE`: | Move the active window item to another window, or move the channel or query item specified by their name to the current window. |
| `NUMBER`: | Change the active window number to the specified number, swapping the window already in that place if required. With -sticky, protect the window number from renumbering done by windows_auto_renumber. (To re-set the sticky attribute, use WINDOW NUMBER again without -sticky.) |
| `NAME`: | Change or clear the window name. Window names must be unique. |
| `HISTORY`: | Set or clear a specific named history to use for this window. All windows with the same named history will share a history. |
| `MOVE PREV`: | Move the window to the place of the numerically previous window. At the first position, move the window to the end and renumber the consecutive block that it was part of. |
| `MOVE NEXT`: | Move the window to the place of the numerically next window. At the last position, move the window to the first position and renumber the consecutive block at first position (if any) |
| `MOVE FIRST`: | Move the window to the first position. Any windows inbetween are moved to their numerically next positions. |
| `MOVE LAST`: | Move the window to the last position. Any windows inbetween are moved to their numerically previous positions. |
| `MOVE`: | Move the window to the specified number or the first number that is in use when moving the window in the direction of the specified position. Any windows inbetween are shifted towards the old position of the window (unused positions remain empty) |
| `LIST`: | List all the windows. |
| `THEME`: | Applies or removes a per-window theme. |
| `GROW`: | Increase the size of the active split window by the specified number of lines. |
| `SHRINK`: | Decrease the size of the active split window by the specified number of lines. |
| `SIZE`: | Set the current split window size to the specified numer of lines. |
| `BALANCE`: | Balance the heights of all split windows. |
| `RGROW`: | Increase the width of the active split window by the specified number of columns. |
| `RSHRINK`: | Decrease the wodth of the active split window by the specified number of columns. |
| `RSIZE`: | Set the current split window width to the specified numer of columns. |
| `RBALANCE`: | Balance the widths of all split windows in this line. |
| `HIDE`: | Hides the current split window, or the split window specified by number or item name. |
| `SHOW`: | Show the window specified by number or item name as a new split windows. It is made sticky when autostick_split_windows is turned on. |
| `RSHOW`: | Show the window specified by number or item name as a new windows split to the right of the current window. It is made sticky when autostick_split_windows is turned on. |
| `UP`: | Set the split window left or above the current one active. At the top, wraps to the bottom. |
| `DOWN`: | Set the split window right or below the current one active. At the bottom, wraps to the top. |
| `DUP`: | Set the split window above the current one active. At the top, wraps to the bottom. |
| `DDOWN`: | Set the split window below the current one active. At the bottom, wraps to the top. |
| `DLEFT`: | Set the split window left to the current one active. At the left, wraps to the right. |
| `DRIGHT`: | Set the split window right to the current one active. At the right, wraps to the left. |
| `LEFT`: | Go to the previous window numerically that is part of the current sticky group (or not part of any sticky group). |
| `RIGHT`: | Go to the next window numerically that is part of the current sticky group (or not part of any sticky group). |
| `STICK`: | Make the currently active window sticky, or stick the window specified by number to the currently visible split window. Or turn off stickyness of the currently active window or the window specified by number. |
| `MOVE LEFT`: | Move the window to the numerically previous location inside the current sticky group. |
| `MOVE RIGHT`: | Move the window to the numerically next location inside the current sticky group. |
| `MOVE UP`: | Move the current window to the sticky group of the split window above. If no sticky group remains, the split window collapses. |
| `MOVE DOWN`: | Move the current window to the sticky group of the split window below. If no sticky group remains, the split window collapses. |
| `MOVE DLEFT`: | Move the current window to the sticky group of the split window to the left. If no sticky group remains, the split window collapses. |
| `MOVE DRIGHT`: | Move the current window to the sticky group of the split window to the right. If no sticky group remains, the split window collapses. |
{:.table.kv}

   Add the required arguments for the given command. Without arguments, the details (size, immortality, levels, server, name and sticky group) of the currently active window are displayed. If used with a number as argument, same as WINDOW REFNUM.

### Description ###

Manipulates the window layout and positioning attributes.

### Examples ###

    /WINDOW CLOSE
    /WINDOW ITEM MOVE 10
    /WINDOW GOTO 15
    /WINDOW GOTO ACTIVE
    /WINDOW GOTO mike
    /WINDOW GOTO #irssi
    /WINDOW NEW HIDDEN
    /WINDOW LOG OFF
    /WINDOW LOG ON ~/logs/debug.log
    /WINDOW LEVEL -ALL +NOTICES
    /WINDOW LOGFILE ~/logs/notices.log

### See also ###
[JOIN](/documentation/help/join), [LEVELS](/documentation/help/levels), [LOG](/documentation/help/log), [QUERY](/documentation/help/query)

