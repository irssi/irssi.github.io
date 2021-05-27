---
layout: post
title: "On freenode and the move to libera.chat"
---

We would like to provide clarification on the recent confusion with [a
commit][c2] (titled "Irssi does not take a political stance") which
inadvertently took the political stance of reverting [a previous commit][c1]
(titled "update default network") that replaced every instance of "freenode" in
the source code to say "libera.chat", and removed freenode as a network from
the default config.

This was the result of an internal disagreement between staff members - those
who were happy to move everything immediately, and those who wanted to wait for
things to settle down and allow us to assess the possible legal issue of
removing freenode as a network in our source code.

The [first commit][c1] ("update default network") was acked by several of us
who didn't like the idea of keeping the main support channel in freenode, and
seemed like a reasonable thing to do given how the broader open source
community was doing the same at the time.

The [other commit][c2] ("Irssi does not take a political stance") was, of
course, extremely poorly worded. The intent was "we would have wanted to not
have to take any political stance to begin with" - but political stances were
taken in both cases and history can't be rewritten, neither in git nor in real
life.

We want to make it explicitly clear that the entire irssi team was always
aligned with the general plan and shared the goal to migrate from freenode
to another network. In no way do we endorse any recent actions taken by new
representatives of freenode staff, nor are we associated with freenode in
any manner besides it hosting our former primary support channel. However, the
initial commit created a possible legal issue which had to be investigated.
This was not a case of rogue developers taking decisions on their own, and no
changes to the development team have taken place nor are any anticipated.

Moving forward, we will do the following:

 - The main support channel is #irssi on libera.chat, as most people have
   already moved there
 - We will add libera.chat as a network to the default config
 - We will change all references to specific networks in the documentation to
   use generic examples
 - We will not remove freenode from the default config
 - #irssi on freenode will remain part of our presence on all major networks,
   alongside EFnet, IRCnet, OFTC, and Quakenet.

Note that changes to the default config only affect new installations -
existing users will have to add and remove networks manually.

The Irssi Team.

[c1]: https://github.com/irssi/irssi/commit/1ba48840a112dfacf13cbbf6b77c1e3489fefcf8
[c2]: https://github.com/irssi/irssi/commit/a4486c236a3bf15192d0500b3a1892f7465826c7
