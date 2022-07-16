#!/bin/sh -e
if [ $# -ne 1 ]; then
    echo Usage: "$0" /path/to/irssi
    exit 1
fi
P="$1" && shift
if [ ! -f "$P"/NEWS ]; then
    echo could not find Irssi in "$P"
    exit 1
fi

mydir=`pwd`

srcdir=`dirname "$0"`
test -z "$srcdir" && srcdir=.
cd "$srcdir"
srcdir=`pwd`

cd "$mydir"
cd "$P"
P=`pwd`

cd "$srcdir"

unset VER
unset GITHUB
ONLINE=${ONLINE-1} TITLES=${TITLES-1} \
      perl news2md.pl "$P"/NEWS > ../_includes/relnews.markdown~tmp~
export version="$(grep '^## ' ../_includes/relnews.markdown~tmp~|grep -v '-head$'|head -1|awk '{print $2}')"
if [ -z "$version" ]; then
    echo No version found
    exit 2
fi
mv ../_includes/relnews.markdown~tmp~ ../_includes/relnews.markdown

perl -i -p -e '$found = s{^version: \K(.*)$}{$ENV{version}} unless $found' ../download.markdown
