---
layout: page
title: "Help: set"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/set.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-settings.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help/)
</nav>

<div markdown="1" class="version">
* v1.2
* [v1.3](/documentation/help/set_(1.3)/)
</div>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">SET</span> <span class="syn10">[<span class="syn">-clear</span> | <span class="syn">-default</span>]</span> <span class="syn10">[<span class="syn09">&lt;key></span> <span class="syn14">[<span class="syn13">&lt;value></span>]</span>]</span></code></pre></div>



### Parameters ###


| `-clear`: |       Removes the setting's value from the configuration. |
| `-default`: |     Restore the setting to its default value. |
{:.table.kv}

The setting and the value; if no value is given, the list of settings that
matched will be returned. If no arguments are given, all the settings will
be displayed.

### Description ###

Modifies the value of a setting; boolean settings accept only ON, OFF and
    TOGGLE.

Please remember that you need to use the SAVE command to store the changes
into your configuration.

### Examples ###

    /SET
    /SET nick mike
    /SET -clear nick
    /SET log_timestamp %H:%H:%S
    /SET -default log_timestamp
    /SET close

### See also ###
[SAVE](/documentation/help/save/), [TOGGLE](/documentation/help/toggle/)

