---
title: "CVS server problems"
layout: post
date: 2002-11-11 06:08:35
---

Too many people have asked this, so here's the answer for everyone:

Because of some bug in CVS 1.11.2 server, if you connect with older
clients and use -z option, it hangs at the end. Everything is
transferred, but it just gets stuck there. So your options are: a)
ignore and just hit Ctrl-C, b) upgrade to CVS 1.11.2, c) don't use -z
option, d) try to get CVS authors to fix it - this is not a new
problem.