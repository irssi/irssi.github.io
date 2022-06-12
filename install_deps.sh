#!/bin/sh
set -e

pip install -r sphinx/requirements.txt
patch -d "$(python -c 'import sphinx.builders.html;print(sphinx.builders.html.__path__[0])')" -p4 < patches/9731.patch
pip install -e ./furo
cpm install --cpanfile=./irssi-website-tools/_tools/cpanfile
perl irssi-website-tools/_tools/issues_titles.pl
cd irssi.github.io
bundle install
cd ..
