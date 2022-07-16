## `help2md.pl`

Convert the Irssi `help` files into Markdown format for use on the
Irssi website.

### Prerequisite

* grep
* find

### Usage

    perl ./_tools/help2md.pl ../irssi-git   .

This script should be run on the Irssi source folder. (`.` in
the usage example specifies the current folder as the output folder
for the Markdown help pages).

Help will be created in `/documentation/help`.

### Configuration

Help layout is configured in [`help2md.yml`](/_tools/help2md.yml) config file.

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

