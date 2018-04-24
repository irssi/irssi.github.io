---
layout: post
title: "Help us test horizontal/vertical splits"
author: Nei
---

It all started in 2005, when I [asked in FS#310](http://bugs.irssi.org/index.php?do=details&task_id=310) whether vertical splits would be possible. By that, of course, I meant to split the windows horizontally in a line. At that time, the most popular version of Irssi had been 0.8.9 for several years.


Fast forward another ten years, Ido Rosen transferred (half of) this issue to the new [GitHub issue tracker](https://github.com/irssi/irssi/issues/224). He compared the situation to WeeChat, another popular text mode IRC client which does support this. Technically, that application is using the [curses](https://en.wikipedia.org/wiki/Ncurses) library for text mode user interfaces, which can handle most of the window drawing. <a href="/images/vsq.png"><img class="img-thumbnail" style="float:right;width:30%;margin-left:1em;margin-top:1em" src="/images/vsq.png" alt="[screenshot]" /></a>

Irssi has its own screen drawing implementation. One advantage of that is that long links can be displayed as "single word" even when they wrap at the terminal border. Another one is support for arbitrary colour pairs, which is limited in curses. However, it also means more work for window handling.

In 2016, I coerced [TheLemonMan](https://github.com/LemonBoy) into writing [an initial draft](https://github.com/irssi/irssi/pull/431) of the horizontal window splitting code. Turns out it wasn't that much code after all! A good deal of the required work had already been done by [Timo Sirainen](http://tss.iki.fi/) (the original Irssi author) in [2001](https://github.com/irssi/irssi/commit/adb7eced395ba88816a365768fee56e04a0a0ec5).

Any complicated window handling logic however did not exist. So after some vague promises in 2015, I picked up the ball again this year, and tied up the knots, making some compromises to keep the model simple and close to the original (arguably limiting the features somewhat in comparison with the competitors).

## How to test

12 years from my initial report, I am now close to resolving half of my own request. The resulting code is currently sitting in [PR 697: sideways split support](https://github.com/irssi/irssi/pull/697) and waiting for you -- or anyone else interested in this feature -- to test it.

After compiling this branch, your Irssi will understand new commands: `/window new rsplit` - to make a new sideways split, `/window rshow <number>` - to show an existing window to the right, and `/window rgrow/rshrink/rsize/rbalance` - to manipulate the size of your sideways split windows.

A short reminder how to use Irssi split windows. First, do not confuse split windows (internally called mainwindows) with windows (these windows are the ones that have numbers assigned to them, and most people use Irssi in the 1 window = 1 channel mode)

Generally, you have the choice of generating "transient" mainwindows, which allow you to display any window not currently visible (or stuck) in another mainwindow. The mainwindow contents changes whenever you change to another window while this mainwindow is active.

The second choice is to stick one or more windows to a mainwindow. This can be done with `/window stick`. When you switch to this window in the future, it will always appear in the corresponding mainwindow. Remember, you can always check the sticky state of a mainwindow by typing `/window` (without arguments). 

To move between your mainwindows, use Alt+Up/Down (`/window up/down`).

If you are mostly working with sticky windows, then you can move sticky windows from one mainwindow to another mainwindow using `/window move dup/ddown/dleft/dright`. If you try to move a transient mainwindow, the mainwindow will instead collapse.

One final tip, the default Irssi configuration makes it a bit hard to tell which (main)window is active. My personal favourite is this small configuration change:

```
/sbar prompt visible active
/sbar prompt position 0
/sbar prompt type window
```

that will move the input line **into** the active mainwindow. Another choice would be to change the statusbar colour in your theme, by adding `sb_window_inact_bg = "%6";` to the abstracts.

That said, there is still lots of things to do:

* vertical status bars
* and for those to work, multi line status bars
* mainwindow zoom/unzoom
* mainwindow swap/move/rotate
* multiple layout store/restore
* layout set code
* support for more complex mainwindow layouts

If any of that seems interesting to you, do not hesitate to contribute the code. We can also discuss any details if you feel unsure how to approach some things on IRC (#irssi on chat.freenode.net)

Happy window splitting!
