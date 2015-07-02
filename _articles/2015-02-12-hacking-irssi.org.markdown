---
layout: post
title: Hacking irssi.org
author: Nicolas Kuttler
web: http://kuttler.eu
---

Get a local copy
----------------

If you would like to work on the source code of [irssi.org](http://irssi.org)

1. Fork [the code](https://github.com/irssi/irssi.github.io).
2. Clone your repository to your local machine.
3. [Install](http://jekyllrb.com/) jekyll and see their instructions for serving
   the project.
4. Have fun!

Make your changes previewable
-----------------------------

If you want your changes merged it might be a good idea to make them
previewable. To do this:

1. Create a branch called `gh-pages` with `git checkout -b gh-pages` and
   `git push origin gh-pages`
2. In this branch, and in this branch only, edit the `_config.yml` file and
   modify the `baseurl` setting to `"/irssi.github.io"` (the project name).
3. Never work on this branch again. But when you create a pull request for
   your main work branch merge your main work branch into `gh-pages` and push
   it to github. So it will be possible to preview your changes under
   `http://username.github.io/irssi.github.io/` which displays your `gh-pages`
   branch.

Notes
-----

<!--
Yeah, it's really weird how liquid renders the curly braces below...
-->
All urls should be prefixed with `{{ "{{" }} site.baseurl {{ }} }}`.
