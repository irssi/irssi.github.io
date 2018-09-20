#!/bin/sh

set -e

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

ORG=${ORG:-irssi}

mydir=$(pwd)

srcdir=$(dirname "$0")
test -z "$srcdir" && srcdir=.
cd "$srcdir"
srcdir=$(pwd)

cd "$mydir"
cd "$P"
P=$(pwd)

cd "$mydir"
cd "$relpath"
relpath=$(pwd)

cd "$srcdir"

description="$(GITHUB=1 VER="$VER" perl news2md.pl "$P"/NEWS)"

if [ -z "$description" ]; then
    echo could not find version "$VER" in "$P"
    exit 1
fi

if github-release info -u "$ORG" -r irssi -t "$VER" >/dev/null; then
    echo release "$VER" already exists
    exit 1
fi

echo deleting old draft...
github-release delete -u "$ORG" -r irssi -t "$VER" >/dev/null
github-release release -u "$ORG" -r irssi -t "$VER" --draft -d "$description"

for f in irssi-"$VER".tar.xz irssi-"$VER".tar.xz.asc irssi-"$VER".tar.gz irssi-"$VER".tar.gz.asc; do
    if [ -f "$relpath"/"$f" ]; then
	echo uploading "$f"
	github-release upload -u "$ORG" -r irssi -t "$VER" -n "$f" -f "$relpath"/"$f"
    else
	echo \*\*Warning\*\* "$f" not found
    fi
done
file="$(mktemp)"
echo 'Use tarball or git clone instead!' > "$file"
github-release upload -u "$ORG" -r irssi -t "$VER" -n ZZZZZ_DO_NOT_USE_GITHUB_SOURCE_LINK -f "$file"
rm "$file"
