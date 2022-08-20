#!/bin/bash
set -eu
srcdir="$(dirname "$(realpath "$0")")"

. ./_conf.env

if [ $# -gt 0 ] && [ "$1" = "-no-help" ]; then
    shift
    NO_HELP=1
    VERS="$(echo "$VERS"|grep :dev:)"
else
    NO_HELP=0
fi

NL="
"

cd "$srcdir"

mkdir -p _tmp

rm -fr _tmp/site || :
[ -d jekyll/_site ] || { echo "The Jekyll part of the website was not built! Cannot continue"; exit 1; }
[ -d _build/main/"$SPHINXTYPE" ] || { echo "The Sphinx part of the website was not built! Cannot continue"; exit 1; }
[ $NO_HELP -eq 1 ] || [ -d _build/dev/"$SPHINXTYPE" ] || { echo "The Sphinx part of the website was not built! Cannot continue"; exit 1; }
cp -a jekyll/_site _tmp/site

( cd _tmp/site && rm -v $(grep -FxRl '# sphinx') )
# need to investigate...
OIFS=$IFS
IFS=$NL
fix_source_link=$(grep -FRl '/tree/gh-pages/' _tmp/site)
if [ -n "$fix_source_link" ]; then
    sed -i -e 's|/tree/gh-pages/|/tree/main/jekyll/|g' $fix_source_link
fi
IFS=$OIFS
mv _tmp/site/sitemap.xml _tmp/site/sitemap2.xml

rm -fr gh-pages || :
mkdir -p gh-pages

rsync -aC _build/main/"$SPHINXTYPE"/ gh-pages/
if [ $NO_HELP -eq 1 ]; then
    : # skip help versions, for quick preview only
else
    rm -fr gh-pages/documentation/help gh-pages/_sources/documentation/help

    cp -r _build/dev/"$SPHINXTYPE"/documentation/help gh-pages/documentation/
    cp -r _build/dev/"$SPHINXTYPE"/_sources/documentation/help gh-pages/_sources/documentation/
fi

for vtn in $VERS; do
    tag=$(echo "$vtn" | cut -d: -f3)
    ver=$(echo "$vtn" | cut -d: -f2)
    if [ "$ver" != "dev" ]; then
        cp -r _build/"$ver"/"$SPHINXTYPE"/documentation/help/"$ver" gh-pages/documentation/help
        cp -r _build/"$ver"/"$SPHINXTYPE"/_sources/documentation/help/"$ver" gh-pages/_sources/documentation/help
    else
        rm -fr _tmp/sphinx-for-"$tag"
    fi
done

# fix sphinx_sitemap for sphinx 5
sed -i \
    -e 's|<loc>'"$BASEURL$ABS_BASE"'en/|<loc>'"$BASEURL$ABS_BASE"'|g' \
    gh-pages/sitemap.xml

if [ "$SPHINXTYPE" = "dirhtml" ]; then
    mv gh-pages/404/index.html gh-pages/404.html
    rmdir gh-pages/404
    rm -fr gh-pages/genindex
    sed -i \
        -e 's|<url><loc>'"$BASEURL$ABS_BASE"'404/</loc></url>||g' \
        -e 's|<url><loc>'"$BASEURL$ABS_BASE"'genindex/</loc></url>||g' \
        gh-pages/sitemap.xml
else
    rm -f gh-pages/genindex.html
    sed -i \
        -e 's|<url><loc>'"$BASEURL$ABS_BASE"'404.html</loc></url>||g' \
        -e 's|<url><loc>'"$BASEURL$ABS_BASE"'genindex.html</loc></url>||g' \
        gh-pages/sitemap.xml
fi
mv gh-pages/sitemap.xml gh-pages/sitemap1.xml

# special fix for 404 as it can appear anywhere on the site
perl -i -p -e 's{\b(href|src)="([^"]+?)"}{
  my ($attr, $link) = ($1, $2);
  $link =~ s{^[.][.]/}{} if "dirhtml" eq "'"$SPHINXTYPE"'";
  $link = "'"$ABS_BASE"'/$link"
    unless $link =~ m{://} || $link =~ m{^[/#]};
  qq{$attr="$link"}
}ge;
s{\b(data-url_root)="[^"]+?"}{$1="'"$ABS_BASE"'/"}g;
$_="" if / rel="canonical" /' gh-pages/404.html

OIFS=$IFS
IFS=$NL
fix_base=$(grep -RlF "@@ABS_BASE@@" gh-pages | grep -v '^gh-pages/_sources')
if [ -n "$fix_base" ]; then
    sed -i -e 's|@@ABS_BASE@@|'"$ABS_BASE"'|g' $fix_base
fi
IFS=$OIFS

rsync -aC _tmp/site/ gh-pages/
rm -fr _tmp/site
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<sitemapindex xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">
   <sitemap>
      <loc>$BASEURL${ABS_BASE}sitemap1.xml</loc>
   </sitemap>
   <sitemap>
      <loc>$BASEURL${ABS_BASE}sitemap2.xml</loc>
   </sitemap>
</sitemapindex>" >gh-pages/sitemap.xml
