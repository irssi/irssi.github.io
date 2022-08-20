#!/bin/bash
set -eu

. ./_conf.env

[ -d _build/main/"$SPHINXTYPE" ] || { echo "The Sphinx part of the website was not built! Cannot continue"; exit 1; }
[ -d jekyll/_site ] || { echo "The Jekyll part of the website was not built! Cannot continue"; exit 1; }

if [ $# -eq 0 ] || [ "$1" != "-x" ]; then
    cp -v _build/main/"$SPHINXTYPE"/searchindex.js jekyll/_site/
    idx=./jekyll/_site/searchindex.js
else
    # late index after merge, for github actions
    idx=./gh-pages/searchindex.js
fi

[ -f "$idx" ] || { echo "Could not find $idx! Cannot continue"; exit 1; }

echo '>>>' index blog posts for sphinx search
python ./_tools/manual_index.py "$idx" ./jekyll/_posts/*.markdown ./jekyll/_posts/historical/*.markdown ./jekyll/_security_html/*_sa_*.txt
