# CertFP Log-in

CertFP, short for Certificate Finger Print, is another method to log you in to NickServ. Instead of a password, it uses a [Client Certificate](https://en.wikipedia.org/wiki/Client_certificate).

In order to use it, you

* first need a certificate,
* then configure Irssi to use this certificate,
* and finally register the certificate with NickServ.

Irssi does not have built-in certificate management commands, so you need to use an external tool like `openssl` to create the certificate.

A step-by-step guide for the Libera Chat network can be found here => https://github.com/shabble/irssi-docs/wiki/liberachat_certfp

It is necessary that the certificate be available as a file; PKCS#11 is not supported.
