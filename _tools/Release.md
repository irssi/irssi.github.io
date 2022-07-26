# Some tools to manage Irssi website and release

## `upload_release.sh`

Upload Irssi version to Github.

### Prerequisite

* [gh](https://cli.github.com/)
* `news2md.pl` and its prerequisites

### Usage

Put `irssi-VERSION.tar.xz{,.asc}` into parent folder.

    export GITHUB_TOKEN=your-secret-login-token
    ORG=github-org ./_tools/upload_release.sh /path/to/irssi-src VERSION

`ORG` specifies the Github organisation to upload to. 

### Example

    ORG=irssi-import ./_tools/upload_release.sh ../irssi-git 1.1.1
    ORG=irssi ./_tools/upload_release.sh ../irssi-git 1.0.7

It will run [news2md.pl](News2md.md) to convert the NEWS into Markdown
for Github. Then it will **delete** any old release
artifact. Finally it will upload `irssi-VERSION.tar.xz{,.asc}` from
parent folder to Github.
