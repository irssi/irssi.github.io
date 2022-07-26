## `news2md.pl`

Convert NEWS file from Irssi source to Markdown for use on Github
releases and Irssi.org Github Pages.

This script is automatically used from
[`update_release.sh`](Release.md) and `upload_release.sh`.

### Prerequisite

* [curl](https://curl.haxx.se/), for online mode

### Usage

    GITHUB=0 VER=1.1.1 ONLINE=0 perl news2md.pl /path/to/irssi/NEWS

It will print the resulting Markdown on STDOUT so you want to redirect
it into a .markdown file.

Some options can be specified in environment variables; see the top of
the script.
