# Tor (The Onion Router)

[Tor](https://www.torproject.org/) is an overlay network for anonymous communication. It operates a local [SOCKS](https://en.wikipedia.org/wiki/SOCKS) proxy for applications to use.

Unfortunately, Irssi currently does not support SOCKS proxies natively. As a workaround, you can install the [ProxyChains-NG](https://github.com/rofl0r/proxychains-ng) program (note, it must be the NG version).

Afterwards, you can launch Irssi like this:

```
proxychains4 irssi
```

Now your connections will go through the Proxy configured in ProxyChains-NG (Tor by default).

IRC networks may have different requirements to be able to connect via Tor. For the Libera Chat network, you will first need to set up [](certfp) using a clearnet connection, and then connect to their [Onion Service](https://libera.chat/guides/connect#accessing-liberachat-via-tor) `palladium.libera.chat`.
