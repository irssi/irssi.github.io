#!/bin/sh
set -e

github=https://github.com
for repo in \
    irssi/irssi \
    ailin-nemui/furo \
    ailin-nemui/irssi-website-tools \
    ailin-nemui/Ascidia \
    ;
do
    [ -d "$(basename "$repo")" ] && git -C "$(basename "$repo")" pull --rebase || git clone "$github/$repo"
done

for worktree in \
    sphinx \
    jekyll \
    ;
do
    [ -d "$worktree" ] || git worktree add "$worktree" "$worktree"
done
