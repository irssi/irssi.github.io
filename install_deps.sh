#!/bin/sh
set -e

pip install -r sphinx/requirements.txt

patch --no-backup-if-mismatch -r - -R -f -d "$(python -c 'import sphinx.builders.html;print(sphinx.builders.html.__path__[0])')" -p4 < patches/9731.patch || :
patch -d "$(python -c 'import sphinx.builders.html;print(sphinx.builders.html.__path__[0])')" -p4 < patches/9731.patch

pip install -e ./furo

PERL5LIB="$(pwd)/local/lib/perl5${PERL5LIB+:}$PERL5LIB"
export PERL5LIB
cpm install --cpanfile=./_tools/cpanfile

perl ./_tools/issues_titles.pl

cd jekyll
bundle install
cd ..
