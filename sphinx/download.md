# Getting the software

Irssi runs on Unix-like systems. If you download the source code, you have to compile it. If you do not want to compile it, you can try binary packages.

Current release source code download:

Download: https://codeberg.org/irssi/irssi/releases/download/1.4.5/irssi-1.4.5.tar.xz  
Signature: https://codeberg.org/irssi/irssi/releases/download/1.4.5/irssi-1.4.5.tar.xz.asc  


You should verify the signature file using `gpg --verify` to make sure that the download was not tampered with.

Alternatively, the current Git development source can be found [on Codeberg](https://codeberg.org/irssi/irssi).

## Compiling

You need [Ninja](https://ninja-build.org/) 1.5 and [Meson](https://mesonbuild.com/) 0.49

Then you type the following commands in your shell:

```shell
tar xJf irssi-*.tar.xz
cd irssi-*
meson Build
ninja -C Build && sudo ninja -C Build install
```

Some more details can be found in the [INSTALL](https://codeberg.org/irssi/irssi/src/tag/1.4.5/INSTALL) file.

## Distribution packages

Many distributions have an Irssi package! Search for `irssi` in your package manager of choice.

### Windows

If you want to use Irssi on Windows, you can do so either through [Cygwin](https://www.cygwin.com/install.html) (search for and enable irssi in the "Cygwin Setup - Select Packages" screen) or with Microsoft's Linux VM [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

## Binary packages

The [openSUSE Build Service](https://build.opensuse.org/) is creating binary builds for popular Linux distributions (Debian, Fedora). These can be installed with root permissions using the distribution package manager.

You can find there an automated build of the **[release](https://software.opensuse.org/download.html?project=home:ailin_nemui:irssi-an&package=irssi-an)** or the **[current Git](https://software.opensuse.org/download.html?project=home:ailin_nemui:irssi-git-an&package=irssi-git-an)**, together with the Build Service-provided installation instructions.
