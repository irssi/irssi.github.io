# Irssi.org website repo

This repository builds the irssi.org website

The website consists of

- Jekyll blog
- Sphinx documentation
- Irssi /help files

To build it, you need

- Ruby & `bundle`
- Python & `pip`
- Perl & `cpm`

Join us in `#irssi` on irc.libera.chat, if you are interested in
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
./make_help_build.sh
```

### Serve website

Use this to test the website in a browser. 

```
./serve.sh
```

## Github workflow

The same steps as above are encoded into a [Github
workflow](.github/workflows/pages.yml).

Unfortunately, they need to be kept in sync manually.
