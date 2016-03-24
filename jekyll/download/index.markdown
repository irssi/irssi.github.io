---
layout: page
title: Getting Irssi
permalink: /download/
categories: [ _nav, _6 ]
---

There are several ways you can get Irssi:

0. [Ready-Made Packages](#distributions-packages)
0. [Compiling from Sources](#sources)

## Distributions' Packages

<div class="row">
<div class="col-md-4" markdown="1">

![][1]{:class='osicon'}**Windows**

Download setup.exe from [Cygwin][2]{:rel='external'} and select irssi during the package selection step. To start irssi, open MinTTY (link should be on your Desktop) and type `irssi`

[1]: /assets/Windows.png
[2]: https://www.cygwin.com/

</div>
<div class="col-md-4" markdown="1">

![][3]{:class='osicon'}![][4]{:class='osicon'}**Debian/Ubuntu**

`apt-get install irssi`.  
You may find more up to date version on [Debian Backports][5]{:rel='external'}

[3]: /assets/debian.png
[4]: /assets/ubuntu.png
[5]: http://backports.debian.org/

</div>
<div class="col-md-4" markdown="1">

![][6]{:class='osicon'}**OS X**

Install [Homebrew][7]{:rel='external'}, then  
`brew install irssi`  
You can also install Git with `--HEAD`

[6]: /assets/macosx.png
[7]: http://brew.sh/

</div>
</div>
<div class="row">
<div class="col-md-4" markdown="1">

![][8]{:class='osicon'}**Gentoo**

`emerge irssi`

[8]: /assets/gentoo.png

</div>
<div class="col-md-4" markdown="1">

![][19]{:class='osicon'}**SuSE**

`zypper in irssi`.

You may find more up to date versions on [openSUSE Package Search][20]{:rel='external'}

[19]: /assets/openSUSE.png
[20]: http://software.opensuse.org/package/irssi

</div>
<div class="col-md-4" markdown="1">

![][9]{:class='osicon'}**ArchLinux**

`pacman -S irssi`

[9]: /assets/arch.png

</div>
</div>
<div class="row">
<div class="col-md-4" markdown="1">

![][10]{:class='osicon'}**Fedora/Red Hat**

`dnf install irssi` or  
`yum install irssi`

[10]: /assets/fedora.png

</div>
<div class="col-md-4" markdown="1">

![][11]{:class='osicon'}**Solaris**

`pkg-get install irssi`

[11]: /assets/opencsw.png

</div>
<div class="col-md-4" markdown="1">

![][12]{:class='osicon'}**Slackware**

`slackpkg install irssi`

[12]: /assets/slackware.png

</div>
</div>

## Sources

Latest release version: **0.8.19** – [Downloads][14]{:rel='external'}

See the included [INSTALL][15]{:rel='external'} file for building instructions

To verify the signatures:

    gpg --keyserver wwwkeys.pgp.net --recv-keys DDBEF0E1

You shouldn't really trust this key without verifying its fingerprint. See it with `gpg --fingerprint staff@irssi.org` and ask someone if it matches (eg. on `#irssi`).

    gpg --verify irssi-0.8.19.tar.xz.asc

(This key is different from the one used to sign binaries of versions before 0.8.10. More gpg help can be found from GPG manual)

### Development sources

[Git][16]{:rel='external'} – You can also get the development version. To check it out, run

    git clone https://github.com/irssi/irssi

After check-out, you **must** run `./autogen.sh`. It may be necessary to install additional packages. More information can be found on [the wiki.][17]{:rel='external'}

See also: [Commit Log][18]{:rel='external'}

[13]: //github.com/irssi-import/irssi/releases
[14]: //github.com/irssi/irssi/releases
[15]: //github.com/irssi/irssi/blob/master/INSTALL
[16]: //github.com/irssi/irssi
[17]: //github.com/shabble/irssi-docs/wiki/Irssi-0.8.17#compiling-from-git
[18]: //github.com/irssi/irssi/commits/master

