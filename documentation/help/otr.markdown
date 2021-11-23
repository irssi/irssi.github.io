---
layout: page
title: "Help: otr"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/otr.in


{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help)
</nav>

<div class="highlight irssisyntax"><pre style="\-\-cmdlen:3ch"><code><span class="synB">OTR</span> <span class="syn10">[<span class="syn">OPTION</span>]</span></code></pre></div>



### Description ###

Command to control the OTR module. Without an option, /OTR INFO is printed.

This help contains three sections which are **options, quickstart and files.**

To add the OTR status bar (highly recommended):

    /statusbar window add otr

### Options ###

AUTH &lt;secret>
Start or respond to an authentication process.

AUTHQ &lt;question> &lt;secret>
Start a SMP authentication process.

Example: **/otr authq "My question is" "this is the secret"**

AUTHABORT
Abort an ongoing authentication process.

CONTEXTS
List known contexts which basically list the known fingerprints and their
state.

DEBUG
Turn on debugging.

DISTRUST &lt;fingerprint>
Distrust a specific fingerprint. This command can be done inside a private
window for which the current fingerprint of the other person will be used
or else set fp to a human readable OTR fingerprint available with the above
contexts command.

Examples: **/otr distrust 487FFADA 5073FEDD C5AB5C14 5BB6C1FF 6D40D48A**

FINISH
End the OTR session. This MUST be done inside a private conversation
window.

FORGET &lt;fingerprint>
Forget a specific fingerprint (deleted from the known fingerprints). The
behavior is the same as the distrust command explained above.

GENKEY &lt;name>
Generate OTR keys for a given account name. This is done automatically
if someone tries to establish a secure session.

This process is done in a background worker and can take an arbitrary
amount of time. The completion is checked when another irssi event is
catched.

HELP
Print this help.

INFO
Display the OTR fingerprint(s) of all your account(s).

INIT
Initialize an OTR conversation within a private conversation window.

TRUST &lt;fingerprint>
Trust a specific fingerprint. The behavior is the same as the forget and
distrust commands explained above.

VERSION
Print the version of the OTR module.

### Quickstart ###

Start a private conversation with the person you want to initiate a secure session. Once in the private message window:

    /otr init

Key generation should start if no key is found for your account name. Once the process is done, either type a message which should automatically start the session or redo the init command.

Time to authenticate the person. Either use a shared secret exchange through phone or GPG-signed email or use the socialist millionaire problem mechanism (SMP) which is basically to ask a question for which the answer can only be known by the other person.

**/otr auth &lt;shared-secret>** OR **/otr authq "A question" &lt;shared-secret>**

Or to respond to an authentication:

**/otr auth &lt;secret>**

### Files ###

This otr modules creates a directory in **$HOME/.irssi/otr** and creates three files:

* **otr.key**
Contains your OTR private key(s). NEVER shared this directory with someone
else unless you know what you are doing.

* **otr.fp**
The known fingerprints with their _trust_ status.

* **otr.instag**
Instance tag of the libotr. This should NEVER be copied to an other
computer. If unsure, just ignore this file.

For more information on OTR, see https://otr.cypherpunks.ca/

