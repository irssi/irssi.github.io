Irssi.org
=========

We need a new shiny website! We would like help with that. We want a
bootstrap-based, statically-generated, Jekyll-based website :-)

Join us in `#irssi` on freenode, if you are interested in helping out.

# What do we want?

We want to have a modern, easily updatable, website that we can use together
with our already well-functioning Github infrastructure. A contribution should
arrive as a pull-request such that our contributor team can easily review the
commits.

Sections we need:

- More or less everything from irssi.org (news, release information, all that
  jazz).
- A way to submit articles to the website using Markdown. I'm thinking an index
  page at `/articles/` and the individual articles as
  `/articles/my-cool-new-irssi-feature/` where the directory contains an
  index.markdown with the article itself. The individual article directory can
  contain images and everything else needed to make the article look shiny.
- Fancy "how to install irssi page" with the various popular distributions
  listed + how to do it directly from Git. ahf quite likes something like
  https://mosh.mit.edu
- More ideas? :-)

Things to think about:

- [Permalinks](http://jekyllrb.com/docs/permalinks/) in jekyll are... tricky.
  The best optioned seemed to be to hardcode a permalink into every page to
  get [cool URIs](http://www.w3.org/Provider/Style/URI).
- While jekyll does obfuscate email addresses in markdown, this functionality
  is not available in filters. Hence contributor's email addresses are
  on the site.
- There was some objection to adding {{ site.baseurl }} to links in templates.
  Using the `<base>` tag does not seem to be a viable option due to the
  inflexible URI schemes, jekyll doesn't seem to want to generate relative
  URIs it requires.

These issues might be fixable with or without plugins.
