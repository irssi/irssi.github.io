---
layout: page
title: Tips and Tricks
---

### zsh completion for irssi options.
you can download/see it [here][1]  
the extensions in included in default zsh distribution since 2002-03-07 (should be version 4.0.1)

### hide aliases
sometimes i found it quite useful to have a much more quiet irssi :)

    /alias hideadd eval set activity_hide_targets $activity_hide_targets $-
    /alias hideclear set -c activity_hide_targets
    /alias hidelevels.clear set -c activity_hide_level
    /alias hidelevels.set set activity_hide_level parts joins quits nicks modes
    /alias hidelist set activity_hide_targets
    /alias hideset set activity_hide_targets $-

i have replaced the aliases with a simple script. see [hide.pl][2] ([source][3])

### mIRC-like flashing with putty
to get notified off activities, while im working, i use the following setup:

#### irssi

    /set beep_msg_level MSGS HILIGHT DCCMSGS


#### screen
Audible bell (switch Ctrl+a Ctrl+g)

#### putty
- no bell and steady on bell

### right aligned nicks

    /format own_msg {ownmsgnick $2 {ownnick $[-9]0}}$1
    /format own_msg_channel {ownmsgnick $3 {ownnick $[-9]0}{msgchannel $1}}$2
    /format pubmsg_me {pubmsgmenick $2 {menick $[-9]0}}$1
    /format pubmsg_me_channel {pubmsgmenick $3 {menick $[-9]0}{msgchannel $1}}$2
    /format pubmsg_hilight {pubmsghinick $0 $3 $[-9]1}$2
    /format pubmsg_hilight_channel {pubmsghinick $0 $4 $[-9]1{msgchannel $2}}$3
    /format pubmsg {pubmsgnick $2 {pubnick $[-9]0}}$1
    /format pubmsg_channel {pubmsgnick $3 {pubnick $[-9]0}{msgchannel $1}}$2

### uptime 

type

    /uptime

to view irssi's uptime

### ssh/telnet alias

    /alias TELNET window new hidden;window name telnet;exec -name telnet -nosh -interactive -window telnet $-
    /alias SSH window new hidden;window name ssh;exec -name ssh -nosh -interactive -window ssh $-

happy mudding, telnetting :)

### icq client in irssi?:)
`/alias MICQ window new hidden;window name micq;exec -name micq -nosh -interactive -window micq $-`
but you could also try [BitlBee][5]

### news reader in irssi?:)
no problem:  
`/alias NNTP window new hide;window name news;exec printf 'article <$0> quit '|nc news.helsinki.fi nntp|tr -d ' '`
hmm now there is a script for this purpose too. checkout [news.pl][6] ([source][7])

### autocorrect feature in irssi?

    /completion -auto .) :)
    /completion -auto anywya anyway
    /completion sio http://scripts.irssi.org/

Write `sio` press `<tab>` key and it will be replaced with `http://irssi.org/scripts/`.

### Where are my completions/replaces gone?
With latest irssi cvs the format changed a bit. cras merged replaces and completions

    completions = {
      wid = { value = ""; };
      sid = { value = "http://scripts.irssi.de/"; };
      ios = { value = "http://irssi.org/scripts/"; };
      ":9" = { value = ":)"; auto = "yes"; };
    };

And there is now a command to maintain the completions:

    /completion [-auto] <key> <value>
    /completion -delete <key>

To get the replaces like behavior add the completion with `-auto` to the commandline.

### `/ame` & `/asay`

    /alias AME foreach channel /me $-; foreach query /me $T $-
    /alias ASAY foreach channel /eval msg $$C $$-; foreach query /eval msg $$T $$-

for latest CVS you could use (cvs from 2002-10-14.18:24 or later)

    /alias AME foreach channel ${k}me $-; foreach query ${k}me $-
    /alias ASAY foreach channel ${k}msg * $-; foreach query ${k}msg * $-

the alias is command char independed now.

### Automatically updating the changed date in vim.

    <Geert> For editing Irssi scripts with vim auto-change timestamp on closing
    <Geert> autocmd BufWrite *.pl %s/changed     => '.*/="changed     => '" . strftime("%c") . "',"/e
    <Geert> on the .vimrc

### How to dump irssi perl variables for debugging?
`/alias dump script exec use Data::Dumper \; print Data::Dumper->new([\$0-])->Dump`

### how to send messages without showing up in scrollback/log?
I use `/alias QMSG quote privmsg $0 :$1-` for this purpose. it has the advantage over `/^msg` that it works with command char `^`.  
if you want to auth against some service like Q/Chanserv you now can use:  
`/network add -autosendcmd "qmsg Q@CServe.quakenet.org AUTH nick pass" Quakenet`

### How to protect irssi from being closed accidently?
`/alias quit echo dont do this at home`
if you like to close irssi for some reason use `//quit`.

### my anti annoyance filters ;)

    /ignore -channels #chan1,#chan2,#chan3 * JOINS PARTS QUITS NICKS
    /ignore -channels #chan1,#chan2,#chan3 -regexp -pattern (away|gone|back|playin|weg|wech|returned) * ACTIONS

Disclaimer: of course you will miss some stuff with this ignores. but for me it makes it more readable.

Another way to get rid of some message levels is `/scrollback levelclear`
I use: `/sb levelclear -levels JOINS,PARTS,QUITS,NICKS,CLIENTCRAP,CRAP,MODE,TOPICS,KICKS`.

### How to update all irssi scripts at once?
Use `git pull`

### How to use different formats for the statusbar clock and the timestamp in scrollback?
#### to set the scrollback format use:

    /format timestamp {timestamp %%H:%%M:%%S }

(default: `/format timestamp {timestamp $Z}`)

#### to set the statusbar clock format use:

    /set timestamp_format %H:%M:00

### How to toggle between 2 windows?

    /bind meta-x command window last

now pressing meta/alt+x toggles between 2 windows.

### The fastest way to close a query is...?
just type `/q` (without any parameters) in the query window.

### How to show the prompt in the active split window?
first make it only visible in the active window with  

    /statusbar prompt visible active

Then make it a window-statusbar  

    /statusbar prompt type window

### How can i change the timezone of the clock in irssi?

    /script exec $ENV{'TZ'}='<nameofyourtimezone>'

e.g. `/script exec $ENV{'TZ'}='UTC'` to run the clock in irssi on UTC while your system is maybe using CET.

### How can i add all my open channels to the irssi channel list?

    /alias ADDALLCHANNELS script exec foreach my $$channel (Irssi::channels()) { Irssi::command("channel add -auto $$channel->{name} $$channel->{server}->{tag} $$channel->{key}") }

this adds all your channels with auto join enabled. if you just wanna add them remove the `-auto`.  

thanks to Valentin Batz (senneth) for the alias.

### how can i disable snotes in the statuswindow again?

    /window level ALL -snotes
    /window new hidden  
    /window level +snotes

### How can i force irssi to redraw the whole screen?
you can use `/redraw`. on most terminals pressing `ctrl+l` (in screen `ctrl+a l`) should do the same.  
of course you can bind it in irssi aswell: `/bind ^L redraw`.

[1]: http://sourceforge.net/p/zsh/code/ci/master/tree/Completion/Unix/Command/_irssi?format=raw
[2]: http://scripts.irssi.org/scripts/hide.pl
[3]: //github.com/irssi/scripts.irssi.org/blob/gh-pages/scripts/hide.pl
[5]: https://www.bitlbee.org/
[6]: http://scripts.irssi.org/scripts/news.pl
[7]: //github.com/irssi/scripts/blob/gh-pages/scripts/news.pl
