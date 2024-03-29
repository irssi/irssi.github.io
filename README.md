# Irssi.org website repo

This repository builds the irssi.org website

The website consists of

- [Jekyll blog](jekyll)
- [Sphinx documentation](sphinx)
- [Irssi /help files](https://github.com/irssi/irssi/tree/master/docs/help/in)

To build it, you need

- [Ruby](https://www.ruby-lang.org) & [`bundle`](https://bundler.io/)
- [Python](https://www.python.org/) & [`pip`](https://pip.pypa.io/)
- Perl & [`cpm`](https://metacpan.org/pod/App::cpm::Tutorial)

Join us in [`#irssi`](https://irssi.org/support/irc/) on irc.libera.chat, if you are interested in
helping out.

## Manual process

Please resolve any errors you encounter at each step, before
proceeding!

### Clone subrepos

```
./clone.sh
```

### Install dependencies

```
./install_deps.sh
```

### Build website

This builds the website, and the help for all versions specified in
[_conf.env](_conf.env). At least the __dev__ version *must* be present
for a successful build.

```
./sphinx.sh
./jekyll.sh
./merge_pages.sh
```

To skip building the help, use the `-no-help` flag.

### Serve website

Use this to test the website in a browser. 

```
./serve.sh
```

## Github workflow

The same steps as above are encoded into a [Github
workflow](.github/workflows/pages.yml).

Unfortunately, they need to be kept in sync manually.
