#!/bin/sh
set -e

. ./_conf.env
sed -i -e 's|^baseurl: "[^"]*"|baseurl: "'"$ABS_BASE"'"|' jekyll/_config.yml

cd jekyll
bundle exec jekyll build
