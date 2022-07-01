#!/bin/bash
set -eu
srcdir="$(dirname "$(realpath "$0")")"

. ./_conf.env

NL="
"

cd "$srcdir"

if [ -d local/lib/perl5 ]; then
    PERL5LIB="$(pwd)/local/lib/perl5${PERL5LIB+:}$PERL5LIB"
    export PERL5LIB
fi

PATH="$(pwd)/Ascidia:$PATH"
export PATH

rm -fr _build || :
mkdir -p _build
mkdir -p _tmp

rm -fr _tmp/site || :
[ -d jekyll/_site ] || echo "The Jekyll part of the website was not built! Cannot continue"
cp -a jekyll/_site _tmp/site

META_INFO="describe --always --long --tags --dirty"
github=https://github.com
rev_link() {
    local dir="$1"
    local url="$(git -C "$dir" remote get-url origin 2>/dev/null)"
    local desc="$(git -C "$dir" $META_INFO)"
    if [ -z "$url" ]; then
        echo "$desc"
    else
        url=${url/*@*:/$github/}
        url=${url%/}
        url=${url%.git}
        echo "[$desc]($url/tree/$(git -C "$dir" rev-parse HEAD))"
    fi
}
cat <<META >sphinx/build-meta.md
---
orphan: True
nosearch: True
generated: True
---

# Website build meta-data

- main site: $(rev_link .)

- jekyll-site: $(rev_link jekyll)

- sphinx-site: $(rev_link sphinx)

- irssi: $(rev_link irssi)

- irssi-website-tools: $(rev_link irssi-website-tools)

- furo: $(rev_link furo)

- Ascidia: $(rev_link Ascidia)

- sphinx-build: $(sphinx-build --version)

- docutils: $(rst2html5.py --version)

- build date: $(LC_ALL=C.UTF-8 date)
META

[ -d sphinx/"$NEWS_DIR" ] || mkdir sphinx/"$NEWS_DIR"
HEADER="$srcdir"/"$NEWS_HEADER" perl "$srcdir"/irssi-website-tools/_tools/news2md.pl irssi/NEWS > sphinx/"$NEWS_DIR"/index.md

irssi_src_orig="$srcdir"/irssi
for vtn in $VERS; do
    tag=$(echo "$vtn" | cut -d: -f3)
    ver=$(echo "$vtn" | cut -d: -f2)
    prj=$(echo "$vtn" | cut -d: -f1)

    { (
        rm -fr _tmp/sphinx-for-"$tag" || :
        cp -a sphinx _tmp/sphinx-for-"$tag"
        cd _tmp/sphinx-for-"$tag"

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

            rm -fr "$srcdir"/_build/main || :
            # BASEURL for sitemap
            { BASEURL=$BASEURL$ABS_BASE EDIT_LINK=$EDIT_LINK FORCE_COLOR=1 make "$SPHINXTYPE" BUILDDIR="$srcdir"/_build/main 2>&1 >&3 | sed -e "s|^|[main:E] |" >&2; } 3>&1 | sed -e "s|^|[main:O] |" &

            sphinxopts_rel=""
        else
            sphinxopts_rel="-D release=$ver"
        fi

        rm -fr "$srcdir"/_build/"$ver" || :
        VER="$ver" PRJ="$prj" VERS="$VERS" STABLE="$STABLE" FORCE_COLOR=1 make "$SPHINXTYPE" SPHINXOPTS="${sphinxopts_rel} -D project=$prj" BUILDDIR="$srcdir"/_build/"$ver"
        find "$srcdir"/_build/"$ver"/"$SPHINXTYPE"/documentation/help -type f -exec sed -i -e 's|\(- '"$prj"' '"$ver"'\)\(</title>\)|\1 help page\2|' {} +

        if [ "$ver" != "dev" ]; then
            sed -i -e "s|<help/\\([^/]*/\\)\\?index>\$|<help/index>|" documentation/index.md
        fi

        cd "$srcdir"
        if [ "$ver" != "dev" ]; then
            rm -fr _tmp/sphinx-for-"$tag"
        fi
    ) 2>&1 >&3 | sed -e "s|^|[${tag}:E] |" >&2; } 3>&1 | sed -e "s|^|[${tag}:O] |" &
done

######################
wait
######################

rm -fr gh-pages || :
mkdir -p gh-pages

( cd _tmp/site && rm -v $(grep -FxRl '# sphinx') )
# need to investigate...
OIFS=$IFS
IFS=$NL
fix_source_link=$(grep -FRl '/tree/gh-pages/' _tmp/site)
if [ -n "$fix_source_link" ]; then
    sed -i -e 's|/tree/gh-pages/|/tree/jekyll/|g' $fix_source_link
fi
IFS=$OIFS
mv _tmp/site/sitemap.xml _tmp/site/sitemap2.xml

rsync -aC _build/main/"$SPHINXTYPE"/ gh-pages/
rm -fr gh-pages/documentation/help gh-pages/_sources/documentation/help

cp -r _build/dev/"$SPHINXTYPE"/documentation/help gh-pages/documentation/
cp -r _build/dev/"$SPHINXTYPE"/_sources/documentation/help gh-pages/_sources/documentation/

for vtn in $VERS; do
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
