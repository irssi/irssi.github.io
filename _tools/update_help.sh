#!/bin/sh
set -e
#mydir=`pwd`

srcdir=`dirname "$0"`
test -z "$srcdir" && srcdir=.
cd "$srcdir"
srcdir=`pwd`

clonedir="$srcdir"/_tmp_irssi-src

git clone https://github.com/irssi/irssi "$clonedir"
cp _tmp_irssi-src/utils/syntax.pl "$clonedir"-syntax.pl

set -- 0.8.21 1.0.8 1.1.3 1.2.2 master
master_base=1.3

while [ $# -gt 0 ]; do
    (cd "$clonedir" && git reset --hard && git clean -fdx && git checkout $1)

    cd "$srcdir"/..
    basever=${1%.*}
    if [ "$1" = master ]; then
	basever=$master_base
    fi

    mkdir -p "$clonedir"/utils
    cp "$clonedir"-syntax.pl "$clonedir"/utils/syntax.pl
    perl ./_tools/help2md.pl "$srcdir"/_tmp_irssi-src . $basever

    shift
done

rm -fr "$clonedir" "$clonedir"-syntax.pl
