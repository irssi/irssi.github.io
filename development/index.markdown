---
layout: page
title: Contributing
permalink: /development/
---

### Development sources

To get started with Irssi development, first check out the git repository:

    git clone https://github.com/irssi/irssi

After check-out, you **must** run `./autogen.sh`. It may be necessary to install additional packages. More information can be found on [the wiki.][1]{:rel='external'}

## Helping Development

Hey you! Irssi is desperately looking for developers. No groundbreaking development has occured since ten years. Apart from fixing [bugs][2]{:rel='external'} and reviewing [patches][3]{:rel='external'}, there are also many huge issues which noone is tackling at the moment. Some of those are:

* Rewrite the fe-text front-end to include vertical splits, flexible and multi-line status bars, vertical bars, zoom, layout pre-sets, dynamic themes, message tags, time-stamped messages, etc.
* Rewrite the core to optionally work in a distributed manner (where you can run the server connections on one server and connect to it with multiple fe-text front-ends)
* Revamp the API to better integrate multiple scripting languages (like Javascript, Lua) and require less (Perl-specific) glue code
* Fix and improve network Proxy support (SSL-enabled proxies, SSL connections over proxies, native SOCKS proxies in Irssi, better TOR support, per network proxies) ([#148][4]{:rel='external'})
* Extend the IRC code to work better with any IRCv3 features.
* XMPP improvements
* Website improvements

Also review the [Unofficial Roadmap][5]{:rel='external'} for a further source of TODOs.

If you're lucky, you might find issues in the tracker that are [labeled 'easy'][6]{:rel='external'}

### Scripts

Perl scripts can be submitted to the [Irssi Script Repository][7]{:rel='external'} by following the instructions and sending a Pull Request on Github. Next to the perl and signals [documentation][8], the [Unofficial Irssi Scripting Documentation Wiki][9]{:rel='external'} may have additional helpful resources about writing scripts.

### Themes

Most of the existing documentation regarding themes can be found in the `default.theme` file created by Irssi when you `/save`, or `/save -formats`. Much of themeing is artistic skills combined with trial and error. Nice themes can be submitted to the [Irssi Themes Collection][10]{:rel='external'} through a Github Pull Request.

[1]: https://github.com/shabble/irssi-docs/wiki/Irssi-0.8.17#compiling-from-git
[2]: //github.com/irssi/irssi/issues
[3]: //github/com/irssi/irssi/pulls
[4]: //github.com/irssi/irssi/pull/148
[5]: //github.com/shabble/irssi-docs/wiki/Roadmap
[6]: //github.com/irssi/irssi/labels/easy
[7]: http://scripts.irssi.org/
[8]: /documentation/
[9]: //github.com/shabble/irssi-docs/wiki
[10]: //irssi-import.github.io/themes/
