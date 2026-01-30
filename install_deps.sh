#!/bin/sh
set -e

python -m venv local
. ./local/bin/activate

python -m pip install -r sphinx/requirements.txt

patch --no-backup-if-mismatch -r - -R -f -d "$(python -c 'import sphinx.builders.html;print(sphinx.builders.html.__path__[0])')" -p4 < patches/9731.patch || :
patch -d "$(python -c 'import sphinx.builders.html;print(sphinx.builders.html.__path__[0])')" -p4 < patches/9731.patch

patch --no-backup-if-mismatch -r - -R -f -d "$(python -c 'import myst_parser.mdit_to_docutils;print(myst_parser.mdit_to_docutils.__path__[0])')" -p3 < patches/760.patch || :
patch -d "$(python -c 'import myst_parser.mdit_to_docutils;print(myst_parser.mdit_to_docutils.__path__[0])')" -p3 < patches/760.patch

python -m pip install -e ./furo

PERL5LIB="$(pwd)/local/lib/perl5${PERL5LIB+:}$PERL5LIB"
export PERL5LIB
cpm install --cpanfile=./_tools/cpanfile

perl ./_tools/issues_titles.pl

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
    bundle install
    cd ..
else
    # use docker
    docker pull ghcr.io/actions/jekyll-build-pages
fi
