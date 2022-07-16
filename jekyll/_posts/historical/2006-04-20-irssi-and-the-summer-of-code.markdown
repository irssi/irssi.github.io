---
title: "Irssi and the Summer of Code"
author: christel
date: 2006-04-20 00:00:01
layout: post
---

This year, the Irssi project is participating in Google's Summer of
Code, which provides funding for students to work on open source
projects over the summer. This page aims to provide some information
for students interested in taking part and working on Irssi. It
contains some project ideas to use as a basis for your proposal,
information on the mentors with whom you will be working, and some
tips on structuring your proposal.


### Some Proposal Ideas  

#### Console `GUI'

Add more gui-like abilities to the console irssi client. Add menus
and/or dialogs to ease configuration, especially:

- Managing networks and server lists, as well as ignore/hilight/notify settings.
- Managing the banlists in channels.
- Other important irssi settings -- nick/user/realname preferences, themes, etc.

Other ideas would be full xterm mouse support, as well as an interface
for perl scripts to add menus, or actions to existing menus, as well
as creating their own configuration windows.

#### Create a new GUI.

Write a complete GUI for irssi (using the common-ui layer, rather than
just the core/protocol handling, so that the existing irssi commands
will still function). An old, abandoned interface can be found in the
`xirssi' directory in subversion for inspiration. This client should
have graphical interfaces to all the basic actions and configuration
settings without needing the user to use /commands.

#### Script bindings for Ruby, PHP, Python, and/or other languages.

Irssi already has extensive bindings for Perl scripts. This project
would add bindings for other languages, including Ruby, PHP and/or
Python, which would allow scripts written in those languages most of
the capabilities currently afforded to Perl scripts. At the minimum,
the ability to access information about windows, window items, and
nicks, to bind signals, add commands, statusbar items, and settings,
and to manage redirections, timeouts, and formats would be required.

#### Bug-hunt project

Despite the success of Irssi, many minor bugs have been reported, and
it's time to fix them. We would like to close as many bugs as possible
during the Summer of Code. Most of the bugs require a lot of research
and input from the user community, so if you like R&D; and interacting
with users, this project could be for you.

#### Update existing script archive

Irssi has a great collection of scripts which enhance the
functionality of the client. However, some of these scripts are
outdated and use different `styles'. The Irssi-Script project would
update the entire script archive to conform to the new guidelines,
combine scripts where it is desirable, and make sure that scripts use
uniform settings, to make sure that every user can use the features
they provide without undue hassle.

#### Web site improvements

The Irssi website is currently undergoing a redesign and revamp, and
could benefit from some attention. Possible improvements would
include:

- Using some form of `miniature CMS' to manage the site content. Port the existing wiki, bug tracker, and shop into this framework.
- Allow users to create accounts and log in, in order to comment on news items (possibly with staff approval for comments).
- Add multiple language support, so that users can easily choose in which language they want to view the site.
- Allow staff to submit and preview news via the site. Export news via an RSS feed.
- Improve the script repository. Link scripts to user accounts, and give users an overview of their scripts, as well as the ability to submit new ones via the web interface, and manage their existing ones. Allow ratings and comments for scripts. Display information and documentation for each script, as submitted by its author. Allow staff to review new script submissions and approve/decline them.
- Allow users to create a user profile, with links to their scripts in the script repository, their themes, homepage, etc. Possibly allow users to register an FTP account, and some limited amount of webspace on http://users.irssi.org/.
- Allow staff to manage users and privileges from within the website, as well as email and DNS settings.
- Integrate the mailing list management with the website, to allow subscribe and unsubscribe operations from the website.

#### Mentors

If you have a project idea not mentioned above, or would like to
discuss one of the above projects before applying for it, please feel
free to contact us or get in touch with one of the mentors directly as
listed below.

- Christel Dahlskjær
- Geert Hauwaerts
- Wouter Coekaerts

#### Proposal Guidelines

Students must write their proposal and submit it to Google before the
application deadline. The following is a suggested outline for your
proposal, adapted from the [Perl foundation Open Source Proposal
HOWTO](https://www.perlfoundation.org/how-to-write-a-proposal.html),
and the [FreeBSD summer of code
page](https://www.freebsd.org/projects/summerofcode.html):

- Name
- E-mail address
- Project Title
- Benefits to the Irssi community -- A good project should be useful to others as well as to the student working on it.
- Deliverables -- List here what concrete improvements you expect to achieve.
- Project Schedule -- How long will it take to see the improvements promised? When can you begin, and when finish?
- Bio -- Explain who you are, and why you are the best candidate to implement the project in question.
