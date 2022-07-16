#!/bin/sh
set -e

github=https://github.com
for repo in \
    irssi/irssi \
    ailin-nemui/furo \
    ailin-nemui/Ascidia \
    ;
do
    [ -d "$(basename "$repo")" ] && git -C "$(basename "$repo")" pull --rebase || git clone "$github/$repo"
done
