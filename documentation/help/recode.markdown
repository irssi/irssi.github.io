---
layout: page
title: "Help: recode"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/recode.in
- https://github.com/irssi/irssi/blob/master/src/fe-common/core/fe-recode.c


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:5ch"><code><span class="synB">RECODE</span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:10ch"><code><span class="synB">RECODE</span> <span class="synB">ADD</span> <span class="syn10">[<span class="syn14">[<span class="syn13">&lt;tag></span><span class="synB">/</span>]</span><span class="syn09">&lt;target></span>]</span> <span class="synB05">&lt;charset></span></code></pre></div>


<div class="highlight irssisyntax"><pre style="\-\-cmdlen:13ch"><code><span class="synB">RECODE</span> <span class="synB">REMOVE</span> <span class="syn10">[<span class="syn09">&lt;target></span>]</span></code></pre></div>



### Parameters ###


| `ADD`: |         Adds an entry into the conversion database. |
| `REMOVE`: |      Removes an entry from the conversion database. |
{:.table.kv}

The network tag and channel or nickname to add or remove; if no target is
given, the active nickname or channel will be used.

### Description ###

Recodes the data transmitted to and received from nicknames and channels
into a specific charset.

To get a list of supported charsets on your system, you can generally use
the 'iconv -l' command.

### Examples ###

    /RECODE
    /RECODE ADD ExampleNet/mike utf-8
    /RECODE ADD #korea euc-kr
    /RECODE REMOVE #korea

### Special Examples ###

    /SET term_charset utf-8
    /SET recode_fallback ISO-8859-15
    /SET recode_out_default_charset ISO-8859-15

    /TOGGLE recode_transliterate
    /TOGGLE recode_autodetect_utf8

### See also ###
[CONNECT](/documentation/help/connect), [MSG](/documentation/help/msg), [NETWORK](/documentation/help/network), [SERVER](/documentation/help/server)

