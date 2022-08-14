#!/bin/bash
set -eu

. ./_conf.env

in="$1" && shift

linkpath="$in"
linkpath="${linkpath%/index.html}"
linkpath="${linkpath##*/}"
if [ "$SPHINXTYPE" = "dirhtml" ]; then
    linkpath="../$linkpath"
fi

perl -Mwarnings=FATAL,inplace -0777 -p -e '
# use title from jekyll
s{(<title>).*?(</title>)}{${1}{%
        if layout.title_from %}{%
            assign title = page[layout.title_from] %}{%
        elsif page.title %}{%
            assign title = page.title %}{%
        else %}{%
            assign title = site.title %}{%
        endif %}{%
        unless page.title contains "Irssi" %}{%
            assign title = title | prepend: "Irssi - " %}{%
        endunless
        %}{{title}}${2}} or die;

# add compatibility style sheet
s{<link rel="stylesheet".*?/theme_tweak.css".*?>\n\K}{    <link rel="stylesheet" href="../assets/css/compat.css" />
} or die;

# create link to current page
s{(<li class=".*?current.*?"><a class=".*?current.*?" href=")#(">.*?</a></li>)}{${1}'"$linkpath"'${2}} or die;

# add jekyll edit page link
s{(<a class="muted-link" href=").*?(" title="Edit this page">)}{${1}{%
                if site.github
                    %}{{ site.github.tar_url | replace_first: "/tarball/", "/tree/" }}{%
                else
                    %}file://{{ site.source }}{%
                endif
                %}/{%
                if page.relative_path and page.collection == "security_html"
                    %}{{ page.relative_path | replace_first: "_security_html", "_security" }}{%
                elsif page.relative_path
                    %}{{ page.relative_path }}{%
                elsif paginator and paginator.page > 1 %}{%
                    assign temp0 = "/" | append: paginator.page | append: "/"
                    %}{{ page.path | replace_first: temp0, "/" }}{%
                else
                    %}{{ page.path }}{%
                endif
            %}${2}} or die;

# add page types for css
s{(<div class=".*?article-container.*?)(")}{${1} {{ page.container_class | default: layout.container_class }} {{ page.collection }} {{ page.layout }}${2}} or die;

# insert main content
s{<section.*?<h1>.*?</section>}{{{ content }}}s or die;

# include jekyll previous/next pages
s{(<div class="related-pages">)(\s*<a class="next-page" href=".*?">.*?</a>)(\s*<a class="prev-page" href=".*?">.*?</a>)(\s*</div>)}{${1}{%
          if page.previous.url and page.collection != "" and page.collection != "security" and page.previous.path != "_security_html/index.html" %}
          <a class="next-page" href="{{ page.previous.url }}">
              <div class="page-info">
                <div class="context">
                  <span>Older</span>
                </div>
                <div class="title">{{ page.previous.title }}</div>
              </div>
              <svg class="furo-related-icon"><use href="#svg-arrow-right"></use></svg>
            </a>{%
          else %}${2}{%
          endif %}{%
          if page.next.url and page.collection != "" and page.collection != "security" and page.next.path != "_security_html/index.html" %}
          <a class="prev-page" href="{{ page.next.url }}">
              <svg class="furo-related-icon"><use href="#svg-arrow-right"></use></svg>
              <div class="page-info">
                <div class="context">
                  <span>Newer</span>
                </div>
                <div class="title">{{ page.next.title }}</div>
              </div>
            </a>{%
          else %}${3}{%
          endif %}${4}}s or die;

# the original footer copied from old jekyll layout
s{(<div class="left-details">).*?(</div>)}{${1}            All the content of this site is copyright ©
            2000-{{ "now" | date: "%Y" }}
            <a href="https://github.com/irssi">The Irssi project</a>. &emsp;
            <br/>{%
            if page.licence and page.licence != "" %}
                This page is licensed under a {{ page.licence | markdownify | strip | split:"</p>" | join:"" | split:"<p>" }}.
{%
            else %}
                Unless otherwise noted, this site is licensed under a <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
{%
            endif %}
${2}}s or die;

s{(</body>)}{<script src="{{ site.baseurl }}/assets/js/anchor.js"></script>
<script>
  anchors.options = {
    icon: "¶",
    class: "small"
  }
  anchors.add()
</script>${1}} or die;

# fix href and src to be absolute (set ABS_BASE if needed)
s{\b(href|src)="([^"]+?)"}{
  my ($attr, $link) = ($1, $2);
  $link =~ s{^[.][.]/}{} if "dirhtml" eq "'"$SPHINXTYPE"'";
  $link = "'"$ABS_BASE"'/$link"
    unless $link =~ m{://} || $link =~ m@^[/#\{]@;
  qq{$attr="$link"}
}ge;
s{\b(data-url_root)="[^"]+?"}{$1="'"$ABS_BASE"'/"}g;

# remove canonical link
s{\s*<link.*?rel="canonical".*?>}{};
' "$in"
