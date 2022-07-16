# The following signatures were invalid: EXPKEYSIG

If you see such a message

```
Err:4 home:/ailin_nemui:/irssi-an  InRelease
  The following signatures were invalid: EXPKEYSIG EDB7AED941EEDB57 home:ailin_nemui OBS Project <home:ailin_nemui@build.opensuse.org>
```

this means that the automatic signing key used by the Open Build Service expired. OBS renews the key periodically, but Debian does not support this.

## Fix

Download the key again, following the regular OBS instructions. If it still does not work, verify if there is a second expired copy of the key in `/etc/apt/trusted.gpg.d` or in `apt-key list` and remove it as well.
