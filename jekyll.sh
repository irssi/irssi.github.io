#!/bin/bash
set -eu

. ./_conf.env
sed -i -e 's|^baseurl: "[^"]*"|baseurl: "'"$ABS_BASE"'"|' jekyll/_config.yml

[ -d _build/main/"$SPHINXTYPE" ] || { echo "The Sphinx part of the website was not built! Cannot continue"; exit 1; }

if [ "$SPHINXTYPE" = "dirhtml" ]; then
    ext=/index.html
else
    ext=.html
fi

./_tools/sphinx_to_jekyll_layout.sh _build/main/"$SPHINXTYPE"/security"$ext" >jekyll/_layouts/sphinx_security.html
./_tools/sphinx_to_jekyll_layout.sh _build/main/"$SPHINXTYPE"/posts"$ext" >jekyll/_layouts/sphinx_posts.html
WELCOME=1 ./_tools/sphinx_to_jekyll_layout.sh _build/main/"$SPHINXTYPE"/index.html >jekyll/_layouts/sphinx_welcome.html

if [ $# -eq 0 ] || [ "$1" != "-x" ]; then
    cd jekyll
    bundle exec jekyll build
else
    # skip building, for github actions
    :
fi
