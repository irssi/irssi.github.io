---
layout: page
title: "Help: script"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/script.in


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

### Syntax ###


### Parameters ###


| `LIST`: |           Displays the list of loaded scripts. |
| `EXEC`: |           Executes the given code. |
| `LOAD`: |           Loads the given script into the memory and executes it. |
| `UNLOAD`: |         Unloads the given script from the memory. |
| `RESET`: |          Unloads all the scripts. |
| `-permanent`: |     In combination with EXEC, the code will be loaded into the memory. |
| `-autorun`: |       When passed to RESET the scripts in the autorun folder are reloaded. |
{:.table.kv}

If no argument is given, the list of active scripts will be displayed.

### Description ###

Interact with the Perl engine to execute scripts.

### Examples ###

    /SCRIPT
    /SCRIPT LIST
    /SCRIPT LOAD ~/.irssi/scripts/nickserv.pl
    /SCRIPT UNLOAD nickserv
    /SCRIPT RESET
    /SCRIPT EXEC foreach my $channel (Irssi::channels()) { Irssi::print($channel->{name} . ' @ ' . $channel->{server}->{tag}); }

### See also ###
[LOAD](/documentation/help/load), [SAVE](/documentation/help/save), [UNLOAD](/documentation/help/unload)

