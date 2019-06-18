---
title: "Development news"
layout: post
date: 2001-12-03 18:23:20
author: cras
---
Even while there hasn't been any releases for a while, the CVS is still
pretty active, and I've been trying to get 0.7.99 out. Currently there's
just a few problems - I'd need to make a /STATUSBAR command to configure
it and I'm not really sure how it could be done best.

The other more important problem is that I seem to have broken something
in the last few weeks, since I've recently seen several strange crashes
that must be because of memory corruption somewhere. Hopefully I'll find
the cause of this soon and can release .99 then.

After .99 I'll begin some major changes including getting rid of glib
(or optional perhaps), using memory pools and to stop using so many
dynamic memory allocations (while still not using fixed size buffers,
I've some ideas about this).

