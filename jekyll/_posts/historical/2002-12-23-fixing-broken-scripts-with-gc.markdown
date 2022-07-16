---
title: "Fixing broken scripts with GC"
layout: post
date: 2002-12-23 09:04:27
---

Scripts can crash irssi too easily, fixing that properly would require
major changes. But while I was again getting annoyed at those crashes,
without any easy way to figure out why and where the heap corruption
happened, I started thinking and figured out that the corrupted
accesses happen only through one function, when accessing perl
object's _irssi pointer. So, if we only could check that address to be
valid.. And then I remembered GCs could easily do that.

So, get yourself a [Boehm's GC](https://www.hboehm.info/gc/) (`apt-get
install libgc6-dev`), GLIB2 and [CVS
irssi](https://github.com/irssi/irssi). Make sure configure says that
GC is enabled, then `/SET perl_memory_check_level` can be used to
control how well irssi checks for valid memory references. Default is
`1` which should prevent at least some crashes, `2` is more slower (it
runs GC before each check) but notices most invalid
references. Whenever error occurs, you'll get a nice error message
about accessing free'd memory, with a line number to script and
everything.