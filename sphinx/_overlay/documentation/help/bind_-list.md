# bind -list

<!-- comment

Please submit changes to
- https://github.com/irssi/irssi.github.io/blob/sphinx/_overlay/documentation/help/bind_-list.md


endcomment -->

## Core bindable commands

| Key command | Description | Arguments |
| ----------- | ----------- | --------- |
| command | Run any command | Command |
| key | Specify name for key binding | Key name |
| multi | Run multiple key bindable commmands, separated with ; | Bindable commands |
| nothing | Do nothing |


## Bindable commands

| Default key(s) | Key command | Description | Arguments |
| -------------- | ----------- | ----------- | --------- |
| `←`  | backward_character | Move the cursor a character backward |
| `→`  | forward_character | Move the cursor a character forward |
| Ctrl-`←`, Alt-`b` | backward_word | Move the cursor a word backward |
| Ctrl-`→`, Alt-`f` | forward_word | Move the cursor a word forward |
|   | backward_to_space | Move the cursor backward to a space |
|   | forward_to_space | Move the cursor forward to a space |
| Home, Ctrl-`A` | beginning_of_line | Move the cursor to the beginning of the line |
| End, Ctrl-`E` | end_of_line | Move the cursor to the end of the line |
| `↑` | backward_history | Go back one line in the history |
| `↓` | forward_history | Go forward one line in the history |
| Ctrl-`↑` | backward_global_history | Go back one line in the global history |
| Ctrl-`↓` | forward_global_history | Go forward one line in the global history |
|   | erase_history_entry | Erase the currently active entry from the history |
| `⌫` (Backspace)  | backspace | Delete the previous character |
| Delete, Ctrl-`D` | delete_character | Delete the current character |
| Alt-`d` | delete_next_word | Delete the word after the cursor |
| Alt-`⌫` | delete_previous_word | Delete the word before the cursor |
| Ctrl-`W` | delete_to_previous_space | Delete up to the previous space |
|   | delete_to_next_space | Delete up to the next space |
| Ctrl-`U` | erase_line | Erase the whole input line |
|   | erase_to_beg_of_line | Erase everything before the cursor |
| Ctrl-`K` | erase_to_end_of_line | Erase everything after the cursor |
| Ctrl-`Y` | yank_from_cutbuffer | "Undelete", paste the last deleted text |
|   | yank_next_cutbuffer | Revert to the previous last deleted text |
|   | append_next_kill | Append next deletion to the cutbuffer |
| Ctrl-`T` | transpose_characters | Swap current and previous character |
|   | transpose_words | Swap current and previous word |
|   | capitalize_word | Capitalize the current word |
|   | downcase_word | Downcase the current word |
|   | upcase_word | Upcase the current word |
| `↵` | send_line | Execute the input line |
| `↹` | word_completion | Complete the current word |
| Shift-`↹` | word_completion_backward | Choose previous completion suggestion |
| Alt-`k` | erase_completion | Remove the completion added by word_completion |
| <code>   </code> (Space), `↵` | check_replaces | Check word replaces |
| Ctrl-`P` | previous_window | Go to the previous window |
| Ctrl-`N` | next_window | Go to the next window |
| Alt-`↑`  | upper_window | Go to the split window above |
| Alt-`↓`  | lower_window | Go to the split window below |
| Alt-`←`  | left_window | Go to the previous window in the current split window |
| Alt-`→`  | right_window | Go to the next window in the current split window |
| Alt-`a`  | active_window | Go to next window with the highest activity |
| Ctrl-`X`  | next_window_item | Go to the next channel/query. In empty windows change to the next server |
|   | previous_window_item | Go to the previous channel/query. In empty windows change to the previous server |
| Ctrl-`L`  | refresh_screen | Redraw screen |
| Page Up, Alt-`p`  | scroll_backward | Scroll to previous page |
| Page Down, Alt-`n`  | scroll_forward | Scroll to next page |
| Ctrl-Home  | scroll_start | Scroll to the beginning of the window |
| Ctrl-End  | scroll_end | Scroll to the end of the window |
|   | escape_char | Insert the next character exactly as-is to input line |
|   | insert_text | Append text to line | Text to append |
| Alt-`1`...`0`,`q`...`o`  | change_window | Change window | Window number |
| Ctrl-`Z`  | stop_irc | Send SIGSTOP to client |

## Default symbolic key names

| Default key | Name |
| ----------- | ---- |
| <code>   </code> (Space) | space |
| `↵`, Ctrl-`M`, Ctrl-`J` | return |
| `⌫`, Ctrl-`?`, Ctrl-`H` | backspace |
| `↹`, Ctrl-`I` | tab |
| Shift-`↹` | stab |
| `↑`  | up |
| `↓`  | down |
| `→`  | right |
| `←`  | left |
| Home | home |
| End  | end |
| Page Up | prior |
| Page Down | next |
| Insert  | insert |
| Delete  | delete |
| Ctrl-`↑`  | cup |
| Ctrl-`↓`  | cdown |
| Ctrl-`→`  | cright |
| Ctrl-`←`  | cleft |
| Ctrl-Home | chome |
| Ctrl-End  | cend |
| Alt-`↑`  | mup |
| Alt-`↓`  | mdown |
| Alt-`→`  | mright |
| Alt-`←`  | mleft |
