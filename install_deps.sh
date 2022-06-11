#!/bin/sh
set -e

pip install -r sphinx/requirements.txt
pip install -e ./furo
cpm install --cpanfile=./irssi-website-tools/_tools/cpanfile
perl irssi-website-tools/_tools/issues_titles.pl
cd irssi.github.io
bundle install
cd ..
