#!/bin/sh
set -eu
srcdir="$(dirname "$(realpath "$0")")"

. ./_conf.env

NL="
"

cd "$srcdir"

mkdir -p sphinx/"$NEWS_DIR"
HEADER="$srcdir"/"$NEWS_HEADER" perl "$srcdir"/irssi-website-tools/_tools/news2md.pl irssi/NEWS > sphinx/"$NEWS_DIR"/index.md

rm -fr _build || :
mkdir -p _build
irssi_src_orig="$srcdir"/irssi
for vtn in $VERS; do
    tag=$(echo "$vtn" | cut -d: -f3)
    ver=$(echo "$vtn" | cut -d: -f2)
    prj=$(echo "$vtn" | cut -d: -f1)

    { (
        cp -a sphinx sphinx-for-"$tag"
        cd sphinx-for-"$tag"

        irssi_src="$srcdir"/_tmp/irssi-"$tag"
        rm -fr "$irssi_src" || :
        git clone --no-local "$irssi_src_orig" "$irssi_src" && git -C "$irssi_src" checkout "$tag"
        mkdir -p "$irssi_src"/utils
        cp "$irssi_src_orig"/utils/syntax.pl "$irssi_src"/utils
        perl "$srcdir"/irssi-website-tools/_tools/help2md.pl "$irssi_src" tmp-"$tag"

        rm -fr documentation/help || :
        if [ "$ver" = "dev" ]; then
            mv tmp-"$tag"/documentation/help documentation
        else
            sed -i -e "s|/documentation/help/|/documentation/help/$ver/|g" tmp-"$tag"/documentation/help/*.md
            mkdir -p documentation/help
            mv tmp-"$tag"/documentation/help documentation/help/"$ver"
            sed -i -e "s|<help/\\([^/]*/\\)\\?index>\$|<help/$ver/index>|" documentation/index.md
        fi

        rm -fr tmp-"$tag"

        if [ "$ver" = "dev" ]; then
            rsync -aC _overlay/documentation/ documentation/
            find . -name \*.md -exec perl "$srcdir"/irssi-website-tools/_tools/ascidia_prerender.pl {} +

            rm -fr ../_build/main || :
            # BASEURL for sitemap
            { BASEURL=$BASEURL$ABS_BASE EDIT_LINK=$EDIT_LINK make "$SPHINXTYPE" BUILDDIR=../_build/main 2>&1 >&3 | sed -e "s|^|[main:E] |" >&2; } 3>&1 | sed -e "s|^|[main:O] |" &

            sphinxopts_rel=""
        else
            sphinxopts_rel="-D release=$ver"
        fi

        rm -fr ../_build/"$ver" || :
        VER="$ver" PRJ="$prj" VERS="$VERS" STABLE="$STABLE" make "$SPHINXTYPE" SPHINXOPTS="${sphinxopts_rel} -D project=$prj" BUILDDIR=../_build/"$ver"

        if [ "$ver" != "dev" ]; then
            sed -i -e "s|<help/\\([^/]*/\\)\\?index>\$|<help/index>|" documentation/index.md
        fi

        cd ..
        if [ "$ver" != "dev" ]; then
            rm -fr sphinx-for-"$tag"
	fi
    ) 2>&1 >&3 | sed -e "s|^|[${tag}:E] |" >&2; } 3>&1 | sed -e "s|^|[${tag}:O] |" &
done

rm -fr gh-pages || :
mkdir -p gh-pages

rm -fr tmp-site || :
cp -a irssi.github.io/_site tmp-site
( cd tmp-site && rm -v $(grep -FxRl '# sphinx') )
# need to investigate...
OIFS=$IFS
IFS=$NL
fix_source_link=$(grep -FRl '/tree/gh-pages/' tmp-site)
if [ -n "$fix_source_link" ]; then
    sed -i -e 's|/tree/gh-pages/|/tree/master/|g' $fix_source_link
fi
IFS=$OIFS
mv tmp-site/sitemap.xml tmp-site/sitemap2.xml

######################
wait
######################

rm -fr sphinx-for-dev

rsync -aC _build/main/"$SPHINXTYPE"/ gh-pages/
rm -fr gh-pages/documentation/help gh-pages/_sources/documentation/help

cp -r _build/dev/"$SPHINXTYPE"/documentation/help gh-pages/documentation/
cp -r _build/dev/"$SPHINXTYPE"/_sources/documentation/help gh-pages/_sources/documentation/

for vtn in $VERS; do
    ver=$(echo "$vtn" | cut -d: -f2)
    if [ "$ver" != "dev" ]; then
        cp -r _build/"$ver"/"$SPHINXTYPE"/documentation/help/"$ver" gh-pages/documentation/help
        cp -r _build/"$ver"/"$SPHINXTYPE"/_sources/documentation/help/"$ver" gh-pages/_sources/documentation/help
    fi
done

# fix sphinx_sitemap for sphinx 5
sed -i \
    -e 's|<loc>'"$BASEURL$ABS_BASE"'en/|<loc>'"$BASEURL$ABS_BASE"'|g' \
    gh-pages/sitemap.xml

# special fix for 404 as it can appear anywhere on the site
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

rsync -aC tmp-site/ gh-pages/
rm -fr tmp-site
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<sitemapindex xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">
   <sitemap>
      <loc>$BASEURL${ABS_BASE}sitemap1.xml</loc>
   </sitemap>
   <sitemap>
      <loc>$BASEURL${ABS_BASE}sitemap2.xml</loc>
   </sitemap>
</sitemapindex>" >gh-pages/sitemap.xml
