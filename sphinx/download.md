# Getting the software

Irssi runs on Unix-like systems. If you download the source code, you have to compile it. If you do not want to compile it, you can try binary packages.

Current release source code download:

Download: https://github.com/irssi/irssi/releases/download/1.4.1/irssi-1.4.1.tar.xz  
Signature: https://github.com/irssi/irssi/releases/download/1.4.1/irssi-1.4.1.tar.xz.asc

You should verify the signature file using `gpg --verify` to make sure that the download was not tampered with.

Alternatively, the current Git development source can be found [on Github](https://github.com/irssi/irssi).

## Compiling

You need [Ninja](https://ninja-build.org/) 1.5 and [Meson](https://mesonbuild.com/) 0.49

Then you type the following commands in your shell:

```shell
tar xJf irssi-*.tar.xz
cd irssi-*
meson Build
ninja -C Build && sudo ninja -C Build install
```

Some more details can be found in the [INSTALL](https://github.com/irssi/irssi/blob/master/INSTALL) file.

## Distribution packages

Many distributions have an Irssi package! Search for `irssi` in your package manager of choice.

## Binary packages

The [openSUSE Build Service](https://build.opensuse.org/) is creating binary builds for popular Linux distributions (Debian, Fedora). These can be installed with root permissions using the distribution package manager.

You can find there an automated build of the **[release](https://software.opensuse.org/download.html?project=home:ailin_nemui:irssi-an&package=irssi-an)** or the **[current Git](https://software.opensuse.org/download.html?project=home:ailin_nemui:irssi-git-an&package=irssi-git-an)**, together with the Build Service-provided installation instructions.
