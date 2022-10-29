#!/bin/bash
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo Usage: "$0" /path/to/irssi VERSION [path to release files]
    exit 1
fi
P="$1" && shift
if [ ! -f "$P"/NEWS ]; then
    echo could not find Irssi in "$P"
    exit 1
fi
VER="$1" && shift
if [ -n "$1" ]; then
    relpath="$1" && shift
else
    relpath=..
fi

if [ "${VER%-an}" = "$VER" ]; then
    ORG=${ORG:-irssi}
else
    ORG=${ORG:-ailin-nemui}
fi

mydir=`pwd`

srcdir=`dirname "$0"`
test -z "$srcdir" && srcdir=.
cd "$srcdir"
srcdir=`pwd`

cd "$mydir"
cd "$P"
P=`pwd`

cd "$mydir"
cd "$relpath"
relpath=`pwd`

cd "$srcdir"

description="$(GITHUB=1 VER="$VER" perl news2md.pl "$P"/NEWS)"

if [ -z "$description" ]; then
    echo could not find version "$VER" in "$P"
    exit 1
fi

if tea release ls -r "$ORG"/irssi -o simple | grep "^$VER " >/dev/null; then
    echo release "$VER" already exists
    exit 1
fi

files_a=()
for f in irssi-"$VER".tar.xz irssi-"$VER".tar.xz.asc irssi-"$VER".tar.gz irssi-"$VER".tar.gz.asc; do
    if [ -f "$relpath"/"$f" ]; then
	files_a+=("-a" "$relpath"/"$f")
    else
	echo \*\*Warning\*\* "$f" not found
    fi
done
file="$(mktemp -d)"
echo 'Use tarball or git clone instead!' > "$file/ZZZZZ_DO_NOT_USE_GITHUB_SOURCE_LINK"
files_a+=("-a" "$file/ZZZZZ_DO_NOT_USE_GITHUB_SOURCE_LINK")

tea release create -r "$ORG"/irssi -d -n "$description" -t "$VER" --tag "$VER" "${files_a[@]}"

rm "$file/ZZZZZ_DO_NOT_USE_GITHUB_SOURCE_LINK"
rmdir "$file"
