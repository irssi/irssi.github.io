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

- irssi: $(rev_link irssi)

- furo: $(rev_link furo)

- Ascidia: $(rev_link Ascidia)

- sphinx-build: $(sphinx-build --version)

- docutils: $(rst2html5.py --version)

- build date: $(LC_ALL=C.UTF-8 date)
META

[ -d sphinx/"$NEWS_DIR" ] || mkdir sphinx/"$NEWS_DIR"
HEADER="$srcdir"/"$NEWS_HEADER" perl "$srcdir"/_tools/news2md.pl irssi/NEWS > sphinx/"$NEWS_DIR"/index.md

irssi_src_orig="$srcdir"/irssi
for vtn in $VERS; do
    tag=$(echo "$vtn" | cut -d: -f3)
    ver=$(echo "$vtn" | cut -d: -f2)
    prj=$(echo "$vtn" | cut -d: -f1)

    { (
        rm -fr _tmp/sphinx-for-"$tag" || :
        cp -a sphinx _tmp/sphinx-for-"$tag"
        cd _tmp/sphinx-for-"$tag"

        if [ $NO_HELP -eq 1 ]; then
            : # skip building help, for quick preview only
        else
            irssi_src="$srcdir"/_tmp/irssi-"$tag"
            rm -fr "$irssi_src" || :
            git clone --no-local "$irssi_src_orig" "$irssi_src" && git -C "$irssi_src" checkout "$tag"
            mkdir -p "$irssi_src"/utils
            cp "$irssi_src_orig"/utils/syntax.pl "$irssi_src"/utils
            perl "$srcdir"/_tools/help2md.pl "$irssi_src" tmp-"$tag"
            rm -fr "$irssi_src"

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
        fi

        if [ "$ver" = "dev" ]; then
            rsync -aC _overlay/documentation/ documentation/
            find . -name \*.md -exec perl "$srcdir"/_tools/ascidia_prerender.pl {} +

            if [ $NO_HELP -eq 1 ]; then
                : # skip cleaning build folder, for quick preview only
            else
                rm -fr "$srcdir"/_build/main || :
            fi
            # BASEURL for sitemap
            { BASEURL=$BASEURL$ABS_BASE EDIT_LINK=$EDIT_LINK FORCE_COLOR=1 make "$SPHINXTYPE" BUILDDIR="$srcdir"/_build/main 2>&1 >&3 | sed -e "s|^|[main:E] |" >&2; } 3>&1 | sed -e "s|^|[main:O] |" &

            sphinxopts_rel=""
        else
            sphinxopts_rel="-D release=$ver"
        fi

        if [ $NO_HELP -eq 1 ]; then
            : # skip building version specific editions, for quick preview only
        else
            rm -fr "$srcdir"/_build/"$ver" || :
            VER="$ver" PRJ="$prj" VERS="$VERS" STABLE="$STABLE" FORCE_COLOR=1 make "$SPHINXTYPE" SPHINXOPTS="${sphinxopts_rel} -D project=$prj" BUILDDIR="$srcdir"/_build/"$ver"
            find "$srcdir"/_build/"$ver"/"$SPHINXTYPE"/documentation/help -type f -exec sed -i -e 's|\(- '"$prj"' '"$ver"'\)\(</title>\)|\1 help page\2|' {} +
        fi

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
