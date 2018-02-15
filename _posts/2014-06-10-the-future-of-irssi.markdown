---
layout: post
title: "The Future of Irssi"
author: "Alexander Færøy"
email: "ahf@irssi.org"
---

Hello,

Irssi hasn't been under active development for the last few years. We want to
change that. To make it easier for new contributors to get involved and stick
around, we moved to where most open source contributors are spending their
time: the source is now maintained on [Github](https://github.com/irssi/).

### Contribution Model

The repositories that are currently available at
[svn.irssi.org](http://svn.irssi.org/) will, over a period of the next month,
be migrated to our newly created [Github
organization](https://github.com/irssi). This means that no new commits will be
made to our Subversion repositories and the Git repositories available on
Github are from today the official way of getting the source code of Irssi. The
primary Irssi client repository has already been migrated to Github and is
available at [github.com/irssi/irssi](https://github.com/irssi/irssi).

We will, starting today, expect contributors to fork the official Irssi
repositories on Github, do their changes on a feature branch, and submit Github
pull requests to us. The team will then review your changes and hopefully,
together, we will be able to get your code into the official Irssi repository.
This will make getting your contributions reviewed and merged smoother and it
has the added benefit that your patches appears to be coming from you which in
turn is helping to make the gap between being a core developer and a
contributor close to non-existing.

### Issue Tracking

This is one of the more controversial changes. Over time, you guys have
submitted tons of bugs to our bug tracker at
[bugs.irssi.org](http://bugs.irssi.org/) only to see them rot.

We will, starting today, stop using [bugs.irssi.org](http://bugs.irssi.org/)
and use Github's issue tracker instead.

We have decided ***not*** to do any automated migration of the
[bugs.irssi.org](http://bugs.irssi.org/) database. We realize that if we
migrate everything over to Github, 1:1, it will only end up rotting in two bug
trackers rather than in just one.

We hope to see interested contributors help us checking which bugs that are
still affecting Irssi and resubmit them to our Github issue tracker.

We will manually go over opened bugs that contains patches to ensure that no
code is left behind in the old tracker.

The bug tracker will remain online as a reference, but we will redirect to
Github for people interested in reporting bugs.

### Scripts

Submitting scripts is historically something you guys have been good at.

The way submitting scripts is currently done is that you write an email to
scripts@irssi.org and someone from our team will manually add the script to the
website. We're well aware that we've lagged behind requests to add new scripts
and update existing ones so we're hoping to improve that too.

From now on, new scripts ***must*** be submitted, in a pull request, to the
[irssi/scripts repository](https://github.com/irssi/scripts). The repository
contains a description on how to contribute.

This will make it much easier for our contributors to both add and maintain
their scripts in the repository. It will also make it a lot easier for us to
review and get code into the repository.

#### Scriptassist Users

For users using `scriptassist.pl`, you can start using the new repository right
away using:

    /set scriptassist_script_sources http://ghscripts.irssi.org/scripts.dmp

Otherwise, you can wait a month and the website will be migrated and everything
should be working as usual, without you having to touch anything.

### Official IRC Channels

We are moving the official development and user support channel to `#irssi` on
freenode. Historically, we have had our official development channel on IRCnet,
a social channel on EFnet and a user support channel on freenode, but we
realize it makes more sense to keep everything together at freenode.

### Closing Words

The changes to our contribution model will also affect people who are pulling
from Subversion or [scripts.irssi.org](http://scripts.irssi.org/)
automatically.

***Access to our Subversion repositories will be revoked and the move of
[scripts.irssi.org](http://scripts.irssi.org/) to the new Github site will
happen on July 31st, 2014.*** Until then, neither of the two systems will be
maintained and no new content will be published there.

Until the migration to Github is completed, you can find our official script
repository at [ghscripts.irssi.org](http://scripts.irssi.org/).  tomaw will
continue being in charge of scripts and will happily review your pull requests
on Github.

Feel free to reach out to anyone within the development team for questions,
comments or ideas. We are hanging out in the `#irssi` channel on freenode,
EFnet and IRCnet. You can contact us using email at staff@irssi.org.  You are
also welcome to PM me directly for questions; I am `ahf` on most of the larger
IRC networks.

On behalf of the Irssi development team,

[Alex](mailto:ahf@irssi.org).
