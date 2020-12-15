## `help2md.pl`

Convert the Irssi `help` files into Markdown format for use on the
Irssi website.

### Prerequisite

* grep
* find

### Usage

    perl ./_tools/help2md.pl ../irssi-1.0.7 . 1.0
    perl ./_tools/help2md.pl ../irssi-1.1.1 . 1.1
    perl ./_tools/help2md.pl ../irssi-git   .       # for 1.2

This script should be run on each Irssi source folder where there are
help pages on the website, starting with the oldest version. (`.` in
the usage example specifies the current folder as the output folder
for the Markdown help pages). For multiple help versions to work
properly, it **must** be run in this order, on each version.

Help will be created in `/documentation/help/`. You need to **add** the
new/changed files to Git and are advised to review any changes.

### Configuration

Help layout is configured in [`help2md.yml`](/_tools/help2md.yml) config file.

#### Multiple help versions

By default, only a single version of each help is kept. If there are
changes in the syntax, a new entry must be added to the config file
under `multiversion_pages:`.

The default version to be used should be configured in the config
file, key `multiversion_pages: > - _default_:`.

For each help page that requires multiple versions, an entry like this
should be added:

    - page: commandname
      versions:
        - 1.0
        - 1.2

The default version should not be listed here.

#### subcommand pages

Complicated commands with many subcommands can be sorted into an
overview listing with dedicated sub-pages. This can be configured in
the key `subcommand_pages:`

For each command that should be thus split, a new entry should be added:

    - command: commandname
      pages:
        - name: sub_section_name
          title: Sub-Section Title
          commands:
            - subcommand1
            - subcommand2

#### Main categories

Next to a complete alphabetical listing, the help can be sorted into
categories on the main page. This is configured under the
`categories:` key. For each category, a new entry should be added:

    - category: Category title
      paths:
        - !!perl/regexp (?^:some regex to match the path/filename)
        - !!perl/regexp (?^:some other path/filename)

optionally, some commands which are caught by the path based regex can
be excluded from a category:

      excludes:
        - COMMAND1
        - COMMAND2

