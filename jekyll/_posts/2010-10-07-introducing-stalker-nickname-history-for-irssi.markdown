---
layout: post
title: "Introducing Stalker: Nickname History For Irssi"
author: "Geert Hauwaerts"
email: "geert@irssi.org"
---

Stalker is an Irssi plugin to correlate information on an IRC network and
discover users' previously used nicknames. The concept is fairly
straightforward: given a nickname identify previously used hostnames.

From those hostnames, extract all nicknames they have used. Repeat until you
have identified all nicknames a user might have used.

The advantage of this method over the more traditional "given a hostname
identify all nicknames it has used" is that you can identify nicknames across
hostmask addresses.

Stalker can be found on GitHub at
[https://github.com/symkat/Stalker](https://github.com/symkat/Stalker).

More information can be found on [the authors
blog](http://symkat.com/132/introducing-stalker-nickname-history-for-irssi/).
