# Automation

## Automatically connect to a network

See the list of configured servers:

```
/SERVER LIST
```

Enable auto-connect on a server:

```
/SERVER MODIFY -auto irc.libera.chat
```

To disable it again, use `-noauto`.

## Automatically join channels

```
/CHANNEL ADD -auto #channelname NetworkName
```

(See your configured networks with: `/NETWORK`)

### Add all currently open channels as auto-join channels

```
/ADDALLCHANS
```

(This is a default alias which runs a Perl script to mass-execute `/CHANNEL ADD` commands)

### Scripts

The `autochannel` script can automatically manage your channels based on `/JOIN` and `/PART`.

(automatic-log-in-to-nickserv)=
## Automatic log-in to NickServ

Many networks support SASL log-in (check the network website or help channel for details). In such a case, please use it:

```
/NETWORK ADD -sasl_username yourname -sasl_password yourpassword -sasl_mechanism PLAIN liberachat
```

Some special cases apply. For the OFTC network, you can use this script: https://unit193.net/dump/holdjoin.pl in combination with [CertFP](https://oftc.net/NickServ/CertFP/).

Another possibility is to use the `WAIT` command inside the autosendcmd to add a delay after the identify command was sent and before auto-joining channels (but note that this is not reliable.)

```
/NETWORK MODIFY -autosendcmd "^msg NickServ identify YOURPASSWORD YOURNICK;wait -OFTC 2000" OFTC
```

## See also

https://github.com/shabble/irssi-docs/wiki/liberachat  
https://github.com/shabble/irssi-docs/wiki/liberachat_certfp
