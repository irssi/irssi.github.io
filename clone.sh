#!/bin/sh
set -e

github=https://github.com
[ -d irssi ]               || git clone $github/irssi/irssi
[ -d sphinx ]              || git clone --no-local . sphinx -b sphinx
[ -d irssi.github.io ]     || git clone --no-local . irssi.github.io -b master
[ -d furo ]                || git clone $github/ailin-nemui/furo
[ -d irssi-website-tools ] || git clone $github/ailin-nemui/irssi-website-tools
[ -d Ascidia ]             || git clone $github/ailin-nemui/Ascidia
