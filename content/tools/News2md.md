## `news2md.pl`

Convert NEWS file from Irssi source to Markdown for use on Github
releases and Irssi.org Github Pages.

This script is automatically used from
[`update_release.sh`](Release.md) and `upload_release.sh`.

The artefact data is stored in the `/_data/relnews_artef.yml` file and
**must** be committed to Github. It is also augmented with information
from online sync with Github releases.

### Prerequisite

* [curl](https://curl.haxx.se/), for online mode

### Usage

    GITHUB=0 VER=1.1.1 ONLINE=0 perl news2md.pl /path/to/irssi/NEWS

It will print the resulting Markdown on STDOUT so you want to redirect
it into a .markdown file.

Some options can be specified in environment variables:

* `GITHUB=1`

  enable mode for Github releases page, disable (manual) Github links

* `VER=version`

  only convert NEWS entry of the specified Irssi version

* `ONLINE=1`

  download list of artefacts as are uploaded to Github, to keep the
  links on the website synchronised with Github releases artefact
  uploads.
