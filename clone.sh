#!/bin/sh
set -e

github=https://github.com
[ -d irssi ]               || git clone $github/irssi/irssi
[ -d sphinx ]              || git worktree add sphinx sphinx
[ -d irssi.github.io ]     || git worktree add irssi.github.io master
[ -d furo ]                || git clone $github/ailin-nemui/furo
[ -d irssi-website-tools ] || git clone $github/ailin-nemui/irssi-website-tools
[ -d Ascidia ]             || git clone $github/ailin-nemui/Ascidia
