## `ascidia_prerender.pl`

A preprocessor for [ascidia](https://github.com/ailin-nemui/Ascidia)
drawings embedded into Markdown.

### Prerequisite

* [ascidia](https://github.com/ailin-nemui/Ascidia)
* cpan Text::CharWidth
* cpan IPC::Run

### Usage

    find . -name \*.md -exec $PWD/_tools/ascidia_prerender.pl {} \;

Inside your markdown files, encode the ascidia diagrams like so:

    ```ascidia.repl#fig_ascidia_example
                   O     
                  -|-  -.
                  / \   | 
                  User  | Request
                        V
     Foobar         +--------+       .------.
      Layer         |  Acme  |       '------'
    - - - - - - +   | Widget |<----->|      |
       .----.   ;   +--------+       |      |
      | do-  |  ;       |            '------'
      |  dad |--^--<|---+            Database
       '----'   ;
                ;
    ```

The language `ascidia.repl` must be specified and an id (`#`) must be given. The
id is used as the filename for the replacement image.

Finally, include the javascript to replace the text with the images at
the end of your markdown file or footer:

    <script src="/_static/prerenderimg.js"></script>

Keep in mind that you have to rerun the prerender script each time you
update the ascidia drawings.
