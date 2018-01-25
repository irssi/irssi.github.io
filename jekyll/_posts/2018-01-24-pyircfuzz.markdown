---
layout: post
title: "PyIRCFuzz"
author: "Joseph Bisch"
email: "jbisch@irssi.org"
---

This blog post is a follow up to [my first post on this blog about fuzzing
Irssi](https://irssi.org/2017/05/12/fuzzing-irssi/). This time we will look at
using pyircfuzz instead of afl-fuzz.

First we are going to get pyircfuzz itself and run it. Pyircfuzz acts as an IRC
server, but it sends a variety of messages (not always well formed) to the IRC
client(s) that are connected in an attempt to crash the client(s).

```
git clone https://github.com/josephbisch/pyircfuzz
cd pyircfuzz
python3 ircfuzz.py
```

Next we need to get Irssi and checkout 1.0.2, because we know it actually has
bugs for us to find. Then, after we have built Irssi, we are going to run it
and connect to the pyircfuzz instance on localhost and log the error output to
a file.

```
git clone https://github.com/irssi/irssi
cd irssi
git checkout 1.0.2
ASAN_OPTIONS=detect_leaks=0 ./autogen.sh CC=clang CFLAGS="-g -Og -fsanitize=address"
make
./src/fe-text/irssi -c localhost 2> asan.log
```

Here is a picture of what Irssi looks like at this point. It crashed so quickly
(remember we are using an outdated version of Irssi) that I didn't have time to
get a screenshot of the fuzzing in action.

<img style="max-width:100%" src="/images/irssi_pyircfuzz_crash.png" />

Here is the AddressSanitizer output (from asan.log):

```
ASAN:DEADLYSIGNAL
=================================================================
==31221==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000000d8 (pc 0x55c7bc8f46da bp 0x611000019540 sp 0x7ffd110925a0 T0)
==31221==The signal is caused by a READ memory access.
==31221==Hint: address points to the zero page.
    #0 0x55c7bc8f46d9 in dcc_request /home/joseph/irssi-blog-temp/irssi/src/fe-common/irc/dcc/fe-dcc-get.c:43:2
    #1 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #2 0x55c7bc9b717c in signal_emit /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:286:3
    #3 0x55c7bc978f39 in ctcp_msg_dcc_send /home/joseph/irssi-blog-temp/irssi/src/irc/dcc/dcc-get.c:525:2
    #4 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #5 0x55c7bc9b717c in signal_emit /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:286:3
    #6 0x55c7bc971658 in ctcp_msg_dcc /home/joseph/irssi-blog-temp/irssi/src/irc/dcc/dcc.c:371:7
    #7 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #8 0x55c7bc9b717c in signal_emit /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:286:3
    #9 0x55c7bc9714c8 in ctcp_msg /home/joseph/irssi-blog-temp/irssi/src/irc/dcc/dcc.c:339:2
    #10 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #11 0x55c7bc9b717c in signal_emit /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:286:3
    #12 0x55c7bc9693f4 in event_privmsg /home/joseph/irssi-blog-temp/irssi/src/irc/core/ctcp.c:287:3
    #13 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #14 0x55c7bc9b717c in signal_emit /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:286:3
    #15 0x55c7bc940cb6 in irc_server_event /home/joseph/irssi-blog-temp/irssi/src/irc/core/irc.c:308:7
    #16 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #17 0x55c7bc9b7b76 in signal_emit_id /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:304:3
    #18 0x55c7bc940f4e in irc_parse_incoming_line /home/joseph/irssi-blog-temp/irssi/src/irc/core/irc.c:362:3
    #19 0x55c7bc9b760c in signal_emit_real /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:242:3
    #20 0x55c7bc9b7b76 in signal_emit_id /home/joseph/irssi-blog-temp/irssi/src/core/signals.c:304:3
    #21 0x55c7bc94121a in irc_parse_incoming /home/joseph/irssi-blog-temp/irssi/src/irc/core/irc.c:383:3
    #22 0x55c7bc997b33 in irssi_io_invoke /home/joseph/irssi-blog-temp/irssi/src/core/misc.c:55:3
    #23 0x7f82e17d80bd in g_main_context_dispatch (/usr/lib/libglib-2.0.so.0+0x6b0bd)
    #24 0x7f82e17d9f68  (/usr/lib/libglib-2.0.so.0+0x6cf68)
    #25 0x7f82e17d9fad in g_main_context_iteration (/usr/lib/libglib-2.0.so.0+0x6cfad)
    #26 0x55c7bc8d8c30 in main /home/joseph/irssi-blog-temp/irssi/src/fe-text/irssi.c:321:3
    #27 0x7f82e06a3f69 in __libc_start_main (/usr/lib/libc.so.6+0x20f69)
    #28 0x55c7bc7af509 in _start (/home/joseph/irssi-blog-temp/irssi/src/fe-text/irssi+0x103509)

AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: SEGV /home/joseph/irssi-blog-temp/irssi/src/fe-common/irc/dcc/fe-dcc-get.c:43:2 in dcc_request
==31221==ABORTING
```

In the pyircfuzz directory, there is an ircfuzz.log file. This is a list of all
the IRC messages that the fuzzer sent to the IRC client leading up to the
crash. So it should act as a reproducer. Make sure you rename it if you want to
save it, because running pyircfuzz again will overwrite that file. I already
know from the stacktrace that the crash happened in the DCC code. So I can do
the following to filter out irrelevant lines from the reproducer:

```
grep -a "DCC" ircfuzz.log > ircfuzz-dcc.log
```

Pyircfuzz doesn't currently have a minimizer included, so you either have to
figure out yourself what line(s) cause the crash or use a minimizer from
another fuzzer like afl-tmin. But just greping for the lines with DCC in them
already limits the number of lines to look through (at least in my case).

You can reproduce the crash by doing the following:

```
cat ircfuzz.log | nc -l -p 6667
```

Then in another terminal:

```
./src/fe-text/irssi -c localhost
```

You should see the AddressSanitizer output in the terminal you ran Irssi in if
the bug is indeed reproducible.

### Conclusion

I have found pyircfuzz to be an effective tool for fuzzing IRC clients. It has
found bugs in Irssi that haven't been found other ways (such as with afl-fuzz
or libfuzzer). Part of the reason is the ease of fuzzing the whole client
without modification. That's not to say that afl-fuzz and libfuzzer aren't
capable of finding these bugs if the proper fuzz targets are written, but it is
just so easy to connect to the fuzzer as you would any other IRC server.

I hope you find pyircfuzz useful. As usual, we would like to hear about any
bugs you find, whether by fuzzing or other methods. You can report non-security
bugs via the [Irssi GitHub repo](https://github.com/irssi/irssi). Security bugs
can be reported to Irssi staff. Staff can be reached at staff@irssi.org.

Also, patches to improve pyircfuzz are welcome via the [GitHub
repo](https://github.com/josephbisch/pyircfuzz).
