---
layout: page
title: Getting Irssi
permalink: /download/
categories: [ _nav, _6 ]
version: 1.1.2
---

There are several ways you can get Irssi<span class="hidden-md hidden-lg">:</span>

<div class="hidden-md hidden-lg" markdown="1">

0. [Binary Packages](#binary-packages)
0. [Compiling from Sources](#release-sources)

</div>

[Security information](/security)

<div class="col-lg-6 col-md-7" markdown="1">

## Binary Packages

<div class="dlc row">{%
include dl_os_icon.html name="Windows" text="**Windows**" %}{%
include dl_os_icon.html name="debian" text="**Debian**" %}{%
include dl_os_icon.html name="ubuntu" text="**Ubuntu**" %}{%
include dl_os_icon.html name="macosx" text="**OS X**" %}{%
include dl_os_icon.html name="gentoo" text="**Gentoo**" %}{%
include dl_os_icon.html name="openSUSE" text="**SUSE**" %}{%
include dl_os_icon.html name="arch" text="**ArchLinux**" %}{%
include dl_os_icon.html name="fedora" text="**Fedora/RHEL**" %}{%
include dl_os_icon.html name="opencsw" text="**Solaris**" %}{%
include dl_os_icon.html name="slackware" text="**Slackware**"%}{%
include dl_os_icon.html name="freebsd" text="**FreeBSD**" %}{%
include dl_os_icon.html name="nixos" text="**NixOS**"
%}

<!-- the following sections are opened purely based on the order, it
     has to follow the buttons above. scrolling is done with javascript to
     the about-class -->
<div class="info about-Windows" markdown="1">

### Windows

Download setup.exe from [Cygwin][2]{:rel='external'} and select irssi during the package selection step. To start irssi, open MinTTY (link should be on your Desktop) and type `irssi`

[2]: https://www.cygwin.com/

</div>
<div class="info about-debian" markdown="1">

### Debian

`apt install irssi`.  
You may find more up to date version on [Debian Backports][5]{:rel='external'}

[5]: http://backports.debian.org/

</div>
<div class="info about-ubuntu" markdown="1">

### Ubuntu

`apt install irssi`.  

</div>
<div class="info about-macosx" markdown="1">

### OS X

Install [Homebrew][7]{:rel='external'}, then  
`brew install irssi`  
You can also install Git with `--HEAD`

[7]: http://brew.sh/

</div>
<div class="info about-gentoo" markdown="1">

### Gentoo

`emerge irssi`

</div>
<div class="info about-openSUSE" markdown="1">

### openSUSE/SUSE

`zypper in irssi`.

You may find more up to date versions on [openSUSE Package Search][20]{:rel='external'}

For SLES and SLED, you can also find irssi in the [SUSE Package Hub](https://packagehub.suse.com/){:rel='external'}

[20]: http://software.opensuse.org/package/irssi

</div>
<div class="info about-arch" markdown="1">

### ArchLinux

`pacman -S irssi`

</div>
<div class="info about-fedora" markdown="1">

### Fedora

`dnf install irssi` or  
`yum install irssi`

</div>
<div class="info about-opencsw" markdown="1">

### Solaris

`pkg-get install irssi`

</div>
<div class="info about-slackware" markdown="1">

### Slackware

`slackpkg install irssi`

</div>
<div class="info about-freebsd" markdown="1">

### FreeBSD

`pkg install irssi`

</div>
<div class="info about-nixos" markdown="1">

### Nix/NixOS

`nix-env -i irssi`

</div>
<div class="no-info" markdown="1">

If your system is not listed, you can still check your systems' package manager or otherwise compile Irssi from source<span class="visible-xs-inline visible-sm-inline">.</span><span class="hidden-xs hidden-sm"> **&#10230;**</span>

</div>

<!-- unfortunately we have to hard-code the display criteria for obs-info in the style.css -->
<div class="row obs-info" markdown="1">
<div class="col-sm-2 col-md-3" markdown="1">

![][19]{:class='obsicon'}

</div>
<div class="col-sm-10 col-md-9">
<div class="col-sm-12 col-lg-6" markdown="1">

The [openSUSE Build Service](http://build.opensuse.org/){:rel='external'} is building Irssi release packages and Irssi git snapshot packages for Debian, Fedora, Ubuntu, and openSUSE.

</div>
<div class="irssi-git col-sm-6" markdown="1">

[Install irssi-git](//software.opensuse.org/download.html?project=home:ailin_nemui:irssi-git;package=irssi-git){:class='btn btn-info'}

</div>
<div class="irssi-release col-sm-6" markdown="1">

[Install irssi release](//software.opensuse.org/download.html?project=home:ailin_nemui:irssi-test;package=irssi){:class='btn btn-success'}

</div>
</div>
</div>
</div>

</div>
<div class="col-lg-6 col-md-5" markdown="1">

## Release Sources

Latest release version: **{{ page.version }}** – [NEWS][14] &nbsp;

{% include relnews_artef_block.markdown ver=page.version %}


See the included [INSTALL][15]{:rel='external'} file for building instructions

To verify the signatures:

    gpg --keyserver pgp.mit.edu --recv-keys '7EE6 5E30 82A5 FB06 AC7C 368D 00CC B587 DDBE F0E1'

You shouldn't really trust this key without verifying its fingerprint. See it with `gpg --fingerprint staff@irssi.org` and ask someone if it matches (eg. on <tt>[#irssi][20]</tt>).

    gpg --verify irssi-{{ page.version }}.tar.xz.asc

(This key is different from the one used to sign binaries of versions before 0.8.10. More gpg help can be found from GPG manual)

## Development sources

[Source on GitHub][16]{:rel='external'} – You can also get the development version. To check it out, run

    git clone https://github.com/irssi/irssi

After check-out, you **must** run `./autogen.sh`. It may be necessary to install additional packages. More information can be found on [the wiki.][17]{:rel='external'}

See also: [Commit Log][18]{:rel='external'}

</div>

[14]: {{ site.baseurl }}/NEWS/#v{{page.version|slugify}}
[15]: //github.com/irssi/irssi/blob/master/INSTALL
[16]: //github.com/irssi/irssi
[17]: //github.com/shabble/irssi-docs/wiki/Irssi-0.8.17#compiling-from-git
[18]: //github.com/irssi/irssi/commits/master
[19]: {{ site.baseurl }}/assets/obs.png
[20]: {{ site.baseurl }}/support/irc
