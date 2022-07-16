# Right-aligned nicks

To create a "tabular" effect of the chat view, or to align nick names in a column, you can use Irssi's theme/format system. The basic commands are the following:

```
/format own_msg {ownmsgnick $2 {ownnick $[-9]0}}$1
/format own_msg_channel {ownmsgnick $3 {ownnick $[-9]0}{msgchannel $1}}$2
/format pubmsg_me {pubmsgmenick $2 {menick $[-9]0}}$1
/format pubmsg_me_channel {pubmsgmenick $3 {menick $[-9]0}{msgchannel $1}}$2
/format pubmsg_hilight {pubmsghinick $0 $3 $[-9]1}$2
/format pubmsg_hilight_channel {pubmsghinick $0 $4 $[-9]1{msgchannel $2}}$3
/format pubmsg {pubmsgnick $2 {pubnick $[-9]0}}$1
/format pubmsg_channel {pubmsgnick $3 {pubnick $[-9]0}{msgchannel $1}}$2
```

These are copied from the default theme's default values, which are responsible for displaying your own messages sent to a channel (`own_msg`) as well as received messages (`pubmsg`) and the two basic highlightings (`me` and `hilight`).

Then, in front of the argument that contains the nick name (`$0` in most cases, but `$1` in `pubmsg_hilight`), an alignment modifier (see [](a_b)) has been added: `[-9]`. This means that the nicks will be right-aligned and truncated to 9 characters.

**Note**: Modifiers *only* work in the `/format` section of a theme (this may change in the future)

There are also some scripts that try to do the alignment for you, like: `nm`, `nm2`.

There are also some nice themes that extend the alignment to further formats, like: [weed](https://github.com/ronilaukkarinen/weed).
