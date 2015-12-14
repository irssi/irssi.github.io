---
layout: page
title: Startup How-To
permalink: documentation/startup/
redirect_from: /beginner/
---
### To new Irssi users (not to new IRC users ..)

Copyright (c) 2000-2002 by Timo Sirainen, release under [GNU FDL][1] 1.1 license.

Index with some FAQ questions that are answered in the chapter:

1. [For all the ircII people](#for-all-the-ircii-people)
    * This window management is just weird, I want it exactly like ircII
2. [Basic user interface usage](#basic-user-interface-usage)
    * Split windows work in weird way
    * How can I easily switch between windows?
    * But alt-1 etc. don't work!
3. [Server and channel automation](#server-and-channel-automation)
    * How do I automatically connect to servers at startup?
    * How do I automatically join to channels at startup?
    * How do I automatically send commands to server at connect?
4. [Setting up windows and automatically restoring them at startup](#setting-up-windows-and-automatically-restoring-them-at-startup)
5. [Status and msgs windows & message levels](#status-and-msgs-windows--message-levels)
    * I want /WHOIS to print reply to current window
    * I want all messages to go to one window, not create new windows
6. [How support for multiple servers works in irssi](#how-support-for-multiple-servers-works-in-irssi)
    * I connected to some server that doesn't respond and now irssi keeps trying to reconnect to it again and again, how can I stop it??
    * I want to have own status and/or msgs window for each servers
7. [/LASTLOG and jumping around in scrollback](#lastlog-and-jumping-around-in-scrollback)
    * How can I save all texts in a window to file?
8. [Logging](#logging)
9. [Changing keyboard bindings](#changing-keyboard-bindings)
    * How do I make F1 key do something?
10. [Proxies and IRC bouncers](#proxies-and-irc-bouncers)
11. [Irssi's settings](#irssis-settings)
12. [Statusbar](#statusbar)
    * I loaded a statusbar script but it's not visible anywhere!

## 1\. For all the ircII people

These settings should give you pretty good defaults (the ones I use):

If colors don't work, and you know you're not going to use some weird non-VT compatible terminal (you most probably aren't), just say:


     /SET term_force_colors ON


I don't like automatic query windows, I don't like status window, I do like msgs window where all messages go:


     /SET autocreate_own_query OFF
     /SET autocreate_query_level DCCMSGS
     /SET use_status_window OFF
     /SET use_msgs_window ON


Disable automatic window closing when `/PART`ing channel or `/UNQUERY`ing query:


     /SET autoclose_windows OFF
     /SET reuse_unused_windows ON


Here's the settings that make irssi work exactly like ircII in window management (send me a note if you can think of more):


     /SET autocreate_own_query OFF
     /SET autocreate_query_level NONE
     /SET use_status_window OFF
     /SET use_msgs_window OFF
     /SET reuse_unused_windows ON
     /SET windows_auto_renumber OFF

     /SET autostick_split_windows OFF
     /SET autoclose_windows OFF
     /SET print_active_channel ON


And example how to add servers:

(OFTC network, identify with nickserv and wait for 2 seconds before joining channels)


     /NETWORK ADD -autosendcmd "/^msg nickserv ident pass;wait 2000" OFTC


(NOTE: use /IRCNET with 0.8.9 and older)

Then add some servers to different networks (network is already set up for them), irc.kpnqwest.fi is used by default for IRCNet but if it fails, irc.funet.fi is tried next:


     /SERVER ADD -auto -network IRCnet irc.kpnqwest.fi 6667
     /SERVER ADD -network IRCnet irc.funet.fi 6667
     /SERVER ADD -auto -network efnet efnet.cs.hut.fi 6667


Automatically join to channels after connected to server, send op request to bot after joined to efnet/#irssi:


     /CHANNEL ADD -auto #irssi IRCnet
     /CHANNEL ADD -auto -bots *!*bot@host.org -botcmd "/^msg $0 op pass" #irssi efnet


If you want lines containing your nick to hilight:


     /HILIGHT nick


## 2\. Basic user interface usage

Windows can be scrolled up/down with PgUp and PgDown keys. If they don't work for you, use Meta-p and Meta-n keys. For jumping to beginning or end of the buffer, use `/SB HOME` and `/SB END` commands.

By default, irssi uses "hidden windows" for everything. Hidden window is created every time you `/JOIN` a channel or `/QUERY` someone. There's several ways you can change between these windows:


     Meta-1, Meta-2, .. Meta-0 - Jump directly between windows 1-10
     Meta-q .. Meta-o          - Jump directly between windows 11-19
     /WINDOW <number>          - Jump to any window with specified number
     Ctrl-P, Ctrl-N            - Jump to previous / next window


Clearly the easiest way is to use Meta-number keys. And what is the Meta key? ESC key always works as Meta, but there's also easier ways. ALT could work as Meta, or if you have Windows keyboard, left Windows key might work as Meta. If they don't work directly, you'll need to set a few X resources (NOTE: these work with both xterm and rxvt):


     XTerm*eightBitInput:   false
     XTerm*metaSendsEscape: true


With rxvt, you can also specify which key acts as Meta key. So if you want to use ALT instead of Windows key for it, use:


     rxvt*modifier: alt


You could do this by changing the X key mappings:


     xmodmap -e "keysym Alt_L = Meta_L Alt_L"


And how exactly do you set these X resources? For Debian, there's `/etc/X11/Xresources/xterm` file where you can put them and it's read automatically when X starts. `~/.Xresources` and `~/.Xdefaults` files might also work. If you can't get anything else to work, just copy and paste those lines to `~/.Xresources` and directly call `xrdb -merge ~/.Xresources` in some xterm. The resources affect only the new xterms you start, not existing ones.

Many windows SSH clients also don't allow usage of ALT. One excellent client that does allow is putty, you can download it from [ http://www.chiark.greenend.org.uk/~sgtatham/putty/][2].

Irssi also supports split windows, they've had some problems in past but I think they should work pretty well now :) Here's some commands related to them:


     /WINDOW NEW                    - Create new split window
     /WINDOW NEW HIDE               - Create new hidden window
     /WINDOW CLOSE                  - Close split or hidden window

     /WINDOW HIDE [<number>|<name>] - Make the split window hidden window
     /WINDOW SHOW <number>|<name>   - Make the hidden window a split window

     /WINDOW SHRINK [<lines>]       - Shrink the split window
     /WINDOW GROW [<lines>]         - Grow the split window
     /WINDOW BALANCE                - Balance the sizes of all split windows


By default, irssi uses "sticky windowing" for split windows. This means that windows created inside one split window cannot be moved to another split window without some effort. For example you could have following window layout:


     Split window 1: win#1 - Status window, win#2 - Messages window
     Split window 2: win#3 - IRCnet/#channel1, win#4 - IRCnet/#channel2
     Split window 3: win#5 - efnet/#channel1, win#6 - efnet/#channel2


When you are in win#1 and press ALT-6, irssi jumps to split window #3 and moves the efnet/#channel2 the active window.

With non-sticky windowing the windows don't have any relationship with split windows, pressing ALT-6 in win#1 moves win#6 to split window 1 and sets it active, except if win#6 was already visible in some other split window irssi just changes to that split window. This it the way windows work with ircii, if you prefer it you can set it with


     /SET autostick_split_windows OFF


Each window can have multiple channels, queries and other "window items" inside them. If you don't like windows at all, you disable automatic creating of them with


     /SET autocreate_windows OFF


And if you keep all channels in one window, you most probably want the channel name printed in each line:


     /SET print_active_channel ON


If you want to group only some channels or queries in one window, use


     /JOIN -window #channel
     /QUERY -window nick


## 3\. Server and channel automation

Irssi's multiple IRC network support is IMHO very good - at least compared to other clients :) Even if you're only in one IRC network you should group all your servers to be in the same IRC network as this helps with reconnecting if your primary server breaks and is probably useful in some other ways too :) For information how to actually use irssi correctly with multiple servers see the chapter 6.

First you need to have your IRC network set, use `/NETWORK` command to see if it's already there. If it isn't, use `/NETWORK ADD yournetwork`. If you want to execute some commands automatically when you're connected to some network, use `-autosendcmd` option. (NOTE: use /IRCNET with 0.8.9 and older.) Here's some examples:


     /NETWORK ADD -autosendcmd '^msg bot invite' IRCnet
     /NETWORK ADD -autosendcmd "/^msg nickserv ident pass;wait 2000" OFTC


After that you need to add your servers. For example:


     /SERVER ADD -auto -network IRCnet irc.kpnqwest.fi 6667
     /SERVER ADD -auto -network worknet irc.mycompany.com 6667 password


The `-auto` option specifies that this server is automatically connected at startup. You don't need to make more than one server with `-auto` option to one IRC network, other servers are automatically connected in same network if the `-auto` server fails.

And finally channels:


     /CHANNEL ADD -auto -bots *!*bot@host.org -botcmd "/^msg $0 op pass" #irssi efnet
     /CHANNEL ADD -auto #secret IRCnet password


`-bots` and `-botcmd` should be the only ones needing a bit of explaining. They're used to send commands automatically to bot when channel is joined, usually to get ops automatically. You can specify multiple bot masks with `-bots` option separated with spaces (and remember to quote the string then). The $0 in `-botcmd` specifies the first found bot in the list. If you don't need the bot masks (ie. the bot is always with the same nick, like chanserv) you can give only the `-botcmd` option and the command is always sent.

## 4\. Setting up windows and automatically restoring them at startup

First connect to all the servers, join the channels and create the queries you want. If you want to move the windows or channels around use commands:


     /WINDOW MOVE LEFT/RIGHT/number    - move window elsewhere
     /WINDOW ITEM MOVE <number>|<name> - move channel/query to another window


When everything looks the way you like, use `/LAYOUT SAVE` command (and `/SAVE`, if you don't have autosaving enabled) and when you start irssi next time, irssi remembers the positions of the channels, queries and everything. This "remembering" doesn't mean that simply using `/LAYOUT SAVE` would automatically make irssi reconnect to all servers and join all channels, you'll need the `/SERVER ADD -auto` and `/CHANNEL ADD -auto` commands to do that.

If you want to change the layout, you just rearrange the layout like you want it and use `/LAYOUT SAVE` again. If you want to remove the layout for some reason, use `/LAYOUT RESET.`

## 5\. Status and msgs windows & message levels

By default, all the "extra messages" go to status window. This means pretty much all messages that don't clearly belong to some channel or query. Some people like it, some don't. If you want to remove it, use


     /SET use_status_window OFF


This doesn't have any effect until you restart irssi. If you want to remove it immediately, just `/WINDOW CLOSE` it.

Another common window is "messages window", where all private messages go. By default it's disabled and query windows are created instead. To make all private messages go to msgs window, say:


     /SET use_msgs_window ON
     /SET autocreate_query_level DCCMSGS  (or if you don't want queries to
     				      dcc chats either, say NONE)


use_msgs_window either doesn't have any effect until restarting irssi. To create it immediately say:


     /WINDOW NEW HIDE     - create the window
     /WINDOW NAME (msgs)  - name it to "(msgs)"
     /WINDOW LEVEL MSGS   - make all private messages go to this window
     /WINDOW MOVE 1       - move it to first window


Note that neither use_msgs_window nor use_status_window have any effect at all if `/LAYOUT SAVE` has been used.

This brings us to message levels.. What are they? All messages that irssi prints have one or more "message levels". Most common are PUBLIC for public messages in channels, MSGS for private messages and CRAP for all sorts of messages with no real classification. You can get a whole list of levels with


     /HELP levels


Status window has message level `ALL -MSGS`, meaning that all messages, except private messages, without more specific place go to status window. The `-MSGS` is there so it doesn't conflict with messages window.

## 6\. How support for multiple servers works in irssi

ircii and several other clients support multiple servers by placing the connection into some window. IRSSI DOES NOT. There is no required relationship between window and server. You can connect to 10 servers and manage them all in just one window, or join channel in each one of them to one single window if you really want to. That being said, here's how you do connect to new server without closing the old connection:


     /CONNECT irc.server.org


Instead of the `/SERVER` which disconnects the existing connection. To see list of all active connections, use `/SERVER` without any parameters. You should see a list of something like:


     -!- IRCNet: irc.song.fi:6667 (IRCNet)
     -!- OFTC: irc.oftc.net:6667 (OFTC)
     -!- RECON-1: 192.168.0.1:6667 () (02:59 left before reconnecting)


Here you see that we're connected to IRCNet and OFTC networks. The IRCNet at the beginning is called the "server tag" while the (IRCnet) at the end shows the IRC network. Server tag specifies unique tag to refer to the server, usually it's the same as the IRC network. When the IRC network isn't known it's some part of the server name. When there's multiple connections to same IRC network or server, irssi adds a number after the tag so there could be network, network2, network3 etc.

Server tags beginning with `RECON-` mean server reconnections. Above we see that connection to server at 192.168.0.1 wasn't successful and irssi will try to connect it again in 3 minutes.

To disconnect one of the servers, or to stop irssi from reconnecting, use


     /DISCONNECT network   - disconnect server with tag "network"
     /DISCONNECT recon-1  - stop trying to reconnect to RECON-1 server
     /RMRECONNS           - stop all server reconnections

     /RECONNECT recon-1   - immediately try reconnecting back to RECON-1
     /RECONNECT ALL       - immediately try reconnecting back to all
     		       servers in reconnection queue


Now that you're connected to all your servers, you'll have to know how to specify which one of them you want to use. One way is to have an empty window, like status or msgs window. In it, you can specify which server to set active with


     /WINDOW SERVER tag    - set server "tag" active
     Ctrl-X                - set the next server in list active


When the server is active, you can use it normally. When there's multiple connected servers, irssi adds [servertag] prefix to all messages in non-channel/query messages so you'll know where it came from.

Several commands also accept `-servertag` option to specify which server it should use:


     /MSG -tag nick message
     /JOIN -tag #channel
     /QUERY -tag nick


`/MSG` tab completion also automatically adds the `-tag` option when nick isn't in active server.

Window's server can be made sticky. When sticky, it will never automatically change to anything else, and if server gets disconnected, the window won't have any active server. When the server gets connected again, it is automatically set active in the window. To set the window's server sticky use


     /WINDOW SERVER -sticky tag


This is useful if you wish to have multiple status or msgs windows, one for each server. Here's how to do them (repeat for each server)


     /WINDOW NEW HIDE
     /WINDOW NAME (status)
     /WINDOW LEVEL ALL -MSGS
     /WINDOW SERVER -sticky network

     /WINDOW NEW HIDE
     /WINDOW NAME (msgs)
     /WINDOW LEVEL MSGS
     /WINDOW SERVER -sticky network


## 7\. /LASTLOG and jumping around in scrollback

`/LASTLOG` command can be used for searching texts in scrollback buffer. Simplest usages are


     /LASTLOG word     - print all lines with "word" in them
     /LASTLOG word 10  - print last 10 occurances of "word"
     /LASTLOG -topics  - print all topic changes


If there's more than 1000 lines to be printed, irssi thinks that you probably made some mistake and won't print them without `-force` option. If you want to save the full lastlog to file, use


     /LASTLOG -file ~/irc.log


With `-file` option you don't need `-force` even if there's more than 1000 lines. `/LASTLOG` has a lot of other options too, see `/HELP lastlog` for details.

Once you've found the lines you were interested in, you might want to check the discussion around them. Irssi has `/SCROLLBACK` (or alias `/SB`) command for jumping around in scrollback buffer. Since `/LASTLOG` prints the timestamp when the message was originally printed, you can use `/SB GOTO hh:mm` to jump directly there. To get back to the bottom of scrollback, use `/SB END` command.

## 8\. Logging

Irssi can automatically log important messages when you're set away (`/AWAY reason`). When you set yourself unaway (`/AWAY`), the new messages in away log are printed to screen. You can configure it with:


     /SET awaylog_level MSGS HILIGHT     - Specifies what messages to log
     /SET awaylog_file ~/.irssi/away.log - Specifies the file to use


Easiest way to start logging with Irssi is to use autologging. With it Irssi logs all channels and private messages to specified directory. You can turn it on with


     /SET autolog ON


By default it logs pretty much everything execept CTCPS or CRAP (`/WHOIS` requests, etc). You can specify the logging level yourself with


     /SET autolog_level ALL -CRAP -CLIENTCRAP -CTCPS (this is the default)


By default irssi logs to ~/irclogs/<servertag>/<target>.log. You can change this with


     /SET autolog_path ~/irclogs/$tag/$0.log (this is the default)


The path is automatically created if it doesn't exist. $0 specifies the target (channel/nick). You can make irssi automatically rotate the logs by adding date/time formats to the file name. The formats are in "man strftime" format. For example


     /SET autolog_path ~/irclogs/%Y/$tag/$0.%m-%d.log


For logging only some specific channels or nicks, see `/HELP log`

## 9\. Changing keyboard bindings

You can change any keyboard binding that terminal lets irssi know about. It doesn't let irssi know everything, so for example shift-backspace can't be bound unless you modify xterm resources somehow.

`/HELP bind` tells pretty much everything there is to know about keyboard bindings. However, there's the problem of how to bind some non-standard keys. They might differ a bit with each terminal, so you'll need to find out what exactly the keypress produces. Easiest way to check that would be to see what it prints in `cat`. Here's an example for pressing F1 key:


     [cras@hurina] ~% cat
     ^[OP


So in irssi you would use `/BIND ^[OP /ECHO F1 pressed`. If you use multiple terminals which have different bindings for the key, it would be better to use eg.:


     /BIND ^[OP key F1
     /BIND ^[11~ key F1
     /BIND F1 /ECHO F1 pressed.


## 10\. Proxies and IRC bouncers

Irssi supports connecting to IRC servers via a proxy. All server connections are then made through it, and if you've set up everything properly, you don't need to do any `/QUOTE SERVER` commands manually.

Here's an example: You have your bouncer (lets say, BNC or BNC-like) listening in irc.bouncer.org port 5000. You want to use it to connect to servers irc.dalnet and irc.efnet.org. First you'd need to setup the bouncer:


     /SET use_proxy ON
     /SET proxy_address irc.bouncer.org
     /SET proxy_port 5000

     /SET proxy_password YOUR_BNC_PASSWORD_HERE
     /SET -clear proxy_string
     /SET proxy_string_after conn %s %d


Then you'll need to add the server connections. These are done exactly as if you'd want to connect directly to them. Nothing special about them:


     /SERVER ADD -auto -network dalnet irc.dal.net
     /SERVER ADD -auto -network efnet irc.efnet.org


With the proxy `/SET`s however, irssi now connects to those servers through your BNC. All server connections are made through them so you can just forget that your bouncer even exists.

If you don't want to use the proxy for some reason, there's `-noproxy` option which you can give to `/SERVER` and `/SERVER ADD` commands.

**Proxy specific settings:**

All proxies have these settings in common:


     /SET use_proxy ON
     /SET proxy_address <Proxy host address>
     /SET proxy_port <Proxy port>


**HTTP proxy**

Use these settings with HTTP proxies:


     /SET -clear proxy_password
     /EVAL SET proxy_string CONNECT %s:%d HTTP/1.0\n\n


**BNC**


     /SET proxy_password your_pass
     /SET -clear proxy_string
     /SET proxy_string_after conn %s %d


**dircproxy**

dircproxy separates the server connections by passwords. So, if you for example have network connection with password ircpass and OFTC connection with oftcpass, you would do something like this:


     /SET -clear proxy_password
     /SET -clear proxy_string

     /SERVER ADD -auto -network IRCnet fake.network 6667 ircpass
     /SERVER ADD -auto -network OFTC fake.oftc 6667 oftcpass


The server name and port you give isn't used anywhere, so you can put anything you want in there.

**psyBNC**

psyBNC has internal support for multiple servers. However, it could be a bit annoying to use, and some people just use different users for connecting to different servers. You can manage this in a bit same way as with dircproxy, by creating fake connections:


     /SET -clear proxy_password
     /SET -clear proxy_string

     /NETWORK ADD -user networkuser IRCnet
     /SERVER ADD -auto -network IRCnet fake.network 6667 ircpass
     /NETWORK ADD -user oftcuser OFTC
     /SERVER ADD -auto -network OFTC fake.oftc 6667 oftcpass


So, you'll specify the usernames with `/NETWORK ADD` command, and the user's password with `/SERVER ADD`.

(NOTE: use /IRCNET with 0.8.9 and older.)

**Irssi proxy**

Irssi contains it's own proxy which you can build giving `\--with-proxy` option to configure. You'll still need to run irssi in a screen to use it though.

Irssi proxy is a bit different than most proxies, normally proxies create a new connection to IRC server when you connect to it, but **irssi proxy shares your existing IRC connection(s) to multiple clients**. And even more clearly: **You can use only one IRC server connection to IRC with as many clients as you want**. Can anyone figure out even more easier ways to say this, so I wouldn't need to try to explain this thing for minutes every time? :)

Irssi proxy supports sharing multiple server connections in different ports, like you can share network in port 2777 and efnet in port 2778.

Usage in proxy side:


     /LOAD proxy
     /SET irssiproxy_password <password>
     /SET irssiproxy_ports <network>=<port> ... (eg. IRCnet=2777 efnet=2778)


**NOTE**: you **MUST** add all the servers you are using to server and network lists with `/SERVER ADD` and `/NETWORK ADD`. ..Except if you really don't want to for some reason, and you only use one server connection, you may simply set:


     /SET irssiproxy_ports *=2777


Usage in client side:

Just connect to the irssi proxy like it is a normal server with password specified in `/SET irssiproxy_password`. For example:


     /SERVER ADD -network IRCnet my.irssi-proxy.org 2777 secret
     /SERVER ADD -network efnet my.irssi-proxy.org 2778 secret


Irssi proxy works fine with other IRC clients as well.

**SOCKS**

Irssi can be compiled with socks support (`\--with-socks` option to configure), but I don't really know how it works, if at all. `/SET proxy` settings don't have anything to do with socks however.

**Others**

IRC bouncers usually work like IRC servers, and want a password. You can give it with:


     /SET proxy_password <password>


Irssi's defaults for connect strings are


     /SET proxy_string CONNECT %s %d
     /SET proxy_string_after


The proxy_string is sent before NICK/USER commands, the proxy_string_after is sent after them. %s and %d can be used with both of them.

## 11\. Irssi's settings

You probably don't like Irssi's default settings. I don't like them. But I'm still convinced that they're pretty good defaults. Here's some of them you might want to change (the default value is shown): Also check the [Settings Documentation](/documentation/settings/)

**Queries**

/SET autocreate_own_query ON
: Should new query window be created when you send message to someone (with `/MSG`).

/SET autocreate_query_level MSGS
: New query window should be created when receiving messages with this level. MSGS, DCCMSGS and NOTICES levels work currently. You can disable this with `/SET -clear autocreate_query_level`.

/SET autoclose_query 0
: Query windows can be automatically closed after certain time of inactivity. Queries with unread messages aren't closed and active window is neither never closed. The value is given in seconds.

**Windows**

/SET use_msgs_window OFF
: Create messages window at startup. All private messages go to this window. This only makes sense if you've disabled automatic query windows. Message window can also be created manually with /WINDOW LEVEL MSGS, /WINDOW NAME (msgs).

/SET use_status_window ON
: Create status window at startup. All messages that don't really have better place go here, like all /WHOIS replies etc. Status window can also be created manually with `/WINDOW LEVEL ALL -MSGS`, `/WINDOW NAME (status)`.

/SET autocreate_windows ON
: Should we create new windows for new window items or just place everything in one window

/SET autoclose_windows ON
: Should window be automatically closed when the last item in them is removed (ie. `/PART`, `/UNQUERY`).

/SET reuse_unused_windows OFF
: When finding where to place new window item (channel, query) Irssi first tries to use already existing empty windows. If this is set ON, new window will always be created for all window items. This setting is ignored if autoclose_windows is set ON.

/SET window_auto_change OFF
: Should Irssi automatically change to automatically created windows - usually queries when someone sends you a message. To prevent accidentally sending text meant to some other channel/nick, Irssi clears the input buffer when changing the window. The text is still in scrollback buffer, you can get it back with pressing arrow up key.

/SET print_active_channel OFF
: When you keep more than one channel in same window, Irssi prints the messages coming to active channel as `<nick> text` and other channels as `<nick:channel> text`. If this setting is set ON, the messages to active channels are also printed in the latter way.

/SET window_history OFF
: Should command history be kept separate for each window.

**User information**

/SET nick
: Your nick name

/SET alternate_nick
: Your alternate nick.

/SET user_name
: Your username, if you have ident enabled this doesn't affect anything

/SET real_name
: Your real name.

**Server information**

/SET skip_motd OFF
: Should we hide server's MOTD (Message Of The Day).

/SET server_reconnect_time 300
: Seconds to wait before connecting to same server again. Don't set this too low since it usually doesn't help at all - if the host is down, the few extra minutes of waiting won't hurt much.

/SET lag_max_before_disconnect 300
: Maximum server lag in seconds before disconnecting and trying to reconnect. This happens mostly only when network breaks between you and IRC server.

**Appearance**

/SET timestamps ON
: Show timestamps before each message.

/SET hide_text_style OFF
: Hide all bolds, underlines, MIRC colors, etc.

/SET show_nickmode ON
: Show the nick's mode before nick in channels, ie. ops have `<@nick>`, voices `<+nick>` and others `< nick>`

/SET show_nickmode_empty ON
: If the nick doesn't have a mode, use one space. ie. ON: `< nick>`, OFF: `<nick>`

/SET show_quit_once OFF
: Show quit message only once in some of the channel windows the nick was in instead of in all windows.

/SET lag_min_show 100
: Show the server lag in status bar if it's bigger than this, the unit is 1/100 of seconds (ie. the default value of 100 = 1 second).

/SET indent 10
: When lines are longer than screen width they have to be split to multiple lines. This specifies how much space to put at the beginning of the line before the text begins. This can be overridden in text formats with `%|` format.

/SET activity_hide_targets
: If you don't want to see window activity in some certain channels or queries, list them here. For example `#boringchannel =bot1 =bot2`. If any highlighted text or message for you appears in that window, this setting is ignored and the activity is shown.

**Nick completion**

/SET completion_auto OFF
: Automatically complete the nick if line begins with start of nick and the completion character. Learn to use the tab-completion instead, it's a lot better ;)

/SET completion_char :
: Completion character to use.

## 12\. Statusbar

`/STATUSBAR` displays a list of statusbars:


     Name                           Type   Placement Position Visible
     window                         window bottom    0        always
     window_inact                   window bottom    1        inactive
     prompt                         root   bottom    100      always
     topic                          root   top       1        always


`/STATUSBAR <name>` prints the statusbar settings and it's items. `/STATUSBAR <name> ENABLE|DISABLE` enables/disables the statusbar. `/STATUSBAR <name> RESET` resets the statusbar to it's default settings, or if the statusbar was created by you, it will be removed.

Type can be window or root, meaning if the statusbar should be created for each split window, or just once. Placement can be top or bottom. Position is a number, the higher the value the lower in screen it is. Visible can be always, active or inactive. Active/inactive is useful only with split windows, one split window is active and the rest are inactive. These settings can be changed with:


     /STATUSBAR <name> TYPE window|root
     /STATUSBAR <name> PLACEMENT top|bottom
     /STATUSBAR <name> POSITION <num>
     /STATUSBAR <name> VISIBLE always|active|inactive


When loading a new statusbar scripts, you'll need to also specify where you want to show it. Statusbar items can be modified with:


     /STATUSBAR <name> ADD [-before | -after <item>] [-priority #] [-alignment left|right] <item>
     /STATUSBAR <name> REMOVE <item>


The item name with statusbar scripts is usually same as the script's name. Script's documentation should tell if this isn't the case. So, to add mail.pl before the window activity item (see the list with `/STATUSBAR` window), use: `/STATUSBAR window ADD -before act mail`.

[1]: http://www.gnu.org/licenses/fdl.html
[2]: http://www.chiark.greenend.org.uk/~sgtatham/putty/
