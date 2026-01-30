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
    # ruby version check
    ruby_max_ver=3.3.4
    if [[ "$(
              {
                  command -v ruby >/dev/null \
                      && ruby -v |awk '{print $2}' \
                          || { echo 9; echo ruby not found >&2; };
                  echo $ruby_max_ver;
              } | sort -Vr | head -n1
          )" = $ruby_max_ver ]]; then
        cd jekyll
        bundle exec jekyll build
        cd ..
    else
        # use docker
        docker run \
               --user "$(id -u):$(id -g)" \
               --rm \
               --workdir "$PWD" \
               -e "GITHUB_WORKSPACE=$PWD" \
               -e "INPUT_SOURCE=jekyll" \
               -e "INPUT_DESTINATION=jekyll/_site" \
               -e "INPUT_FUTURE=true" \
               -e "INPUT_BUILD_REVISION=$(git rev-parse HEAD)" \
               -e "INPUT_VERBOSE=true" \
               -e "GITHUB_REPOSITORY=irssi/irssi" \
               -v "$PWD:$PWD" \
               -v /dev/null:/etc/resolv.conf:ro \
               ghcr.io/actions/jekyll-build-pages
    fi
    ./_tools/jekyll_index.sh
else
    # skip building, for github actions
    :
fi
