#!/bin/sh
set -e

. ./_conf.env
sed -i -e 's|^baseurl: "[^"]*"|baseurl: "'"$ABS_BASE"'"|' irssi.github.io/_config.yml

cd irssi.github.io
bundle exec jekyll build
