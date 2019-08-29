---
title: "Historical &ndash; CVS Upgrade Information"
date: 2002-05-17
layout: post
---

### Completion changes

Before if you wanted to add completion words, or auto-completions, you
had to edit config file directly. Now there exists a nice `/COMPLETION`
command to change them. However while doing this I decided the old
config file format was stupid and replaced it with a new and better one,
breaking the old formats.. So, you'll need to add them again in new
format if you used them before. Here's an example of the new format:

    completions = {
      ".)" = { value = ":)"; auto = "yes"; };
      ":9" = { value = ":)"; auto = "yes"; };
      ".9" = { value = ":)"; auto = "yes"; };
      irssi = { value = "http://irssi.org/"; };
    };

The syntax is: `/COMPLETION [[-auto | -delete] <key> [<value>]]`

### Scripting changes

[\!channels](http://www.irchelp.org/ircd/ircnet/ircnet210.html)
are a feature of IRCNet. When you join to \!channel, it actually joins
you into \!ABCDEchannel where ABCDE is "channel id". This looks quite
ugly, so I added some code to convert them into pretty looking
\!channels again without the ID. This change however affects some
scripts.

When you print to some channel using `$server->print(name, ..)`, use
`$channel->{visible_name}` as `name` instead of `->{name}`, and in
general when you need to print channel's name use the `visible_name`.
Also you shouldn't rely on all window items having `name` field -
channels and queries have it, but not for example items created by
`/EXEC -interactive`. `visible_name` exists with all window items.
