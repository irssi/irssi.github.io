---
layout: page
title: "Help: toggle"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/toggle.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-settings.c


{% endcomment %}
[Help index](/documentation/help)

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:6ch"><code><span class="synB">TOGGLE</span> <span class="synB05">&lt;key></span> <span class="syn10">[<span class="syn">on</span>|<span class="syn">off</span>|<span class="syn">toggle</span>]</span></code></pre></div>



### Parameters ###

   The setting to modify and the new value; if no value is given, its opposite
   will be used.

### Description ###

Modifies a setting to its counter value; you can also give ON or OFF as a
value.

### Examples ###

    /TOGGLE resolve_prefer_ipv6
    /TOGGLE channels_rejoin_unavailable ON

### See also ###
[SET](/documentation/help/set)

