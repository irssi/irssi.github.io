---
layout: page
title: About Irssi
---

Introduction
------------

Irssi is a terminal based IRC client for UNIX systems. It also supports SILC
and ICB protocols via plugins.

### Greatest features
You might be wondering what makes Irssi such an easy and comfortable client
to use; Joost Vunderink wrote a summary of the most beneficial Irssi features.

### Autologging
Irssi will automatically log any channels, queries or special windows that
you want. The logfiles will be separated per IRC network, and even log
rotation is supported. Log file formats, themes and destination directories
can be easily configured with the Irssi log settings.

### Formats and themes
Theming is a popular item in todays desktop enviroments, it's an easy yet
powerful way to customize your Irssi client's look and feel. Irssi's
formatting is modular which means you can just change the appearance of the
objects and all items contaning that object will change into that format.

### Configurable keybindings
This feature is a piece of art; it allows you to modify the default
keybindings and create your own so you can customize your client. If these
keybindings are tuned, you can switch through the windows in no time, execute
commands and even complete objects with these bindings.

### Paste detection
If you have ever pasted a bunchload of text into a wrong channel, you know
how hard the consequences can be. Irssi tries to detect when you are pasting
large amounts of text, by looking at the speed that characters are entered;
if such pasting is detected [TAB]-characters are sent as-is instead of being
tab-completed and eventually ending up in a wrong destination window. When
Irssi detects such a pasting, you will get the option to either abort the
paste or execute the paste, this way you have total control of the pasting.

### Perl scripting
Perl is one of the most used programming languages around the globe and
integrating Perl into applications means flexible and powerful scripting
capabilities. The entire behavior and appearence of Irssi can be modified
within these Perl scripts. Irssi provides a script archive with many
contributed Irssi scripts which provide both useful extra features and the
required assistance to make your own scripts.

### Irssi-proxy
This is much more than just a bouncer, Irssi-proxy is a plugin which allows
to bind a port to each IRC server you are connected to. This means that
instead of having to remember to identify with a password, you can just
connect to the Irssi-proxy with a server password. The copy of Irssi running
the proxy works just as a normal client which you can use, but you can also
connect one or more clients to it to share the connections. Using Irssi as a
proxy has the major advantage of Irssi's power as an IRC client. You never
have to worry about losing your connection to IRC. Even if you don't want to
use Issi as a client, I can strongly recommend it as a proxy because you can
just connect to it with any IRC client by just connecting to the specified
port instead of SSH-ing to the machine that your Irssi is running on.

### Upgrades
Upgrading your Irssi client to the latest version can be easily done
without losing the connections to the IRC servers and without restarting
Irssi. You can use the UPGRADE command to load the new Irssi binary and
restoring your connections.
