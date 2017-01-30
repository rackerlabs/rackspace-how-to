---
permalink: rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console/
audit_date:
title: Rackspace Cloud Essentials - Checking a server's SSH host fingerprint with the web console
type: article
created_date: '2011-05-31'
created_by: Jered Heeschen
last_modified_date: '2016-07-08'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

One of the fundamentals of [SSH](/how-to/connecting-to-linux-from-windows-by-using-putty)
is that it uses a "fingerprint" generated using a server's unique "host
key" to identify the server to a client. You may have seen a warning
sometime related to the host fingerprint, either that it can't be
verified or that it has changed.

The host key is randomly generated when the SSH server is set up and is
used to identify the server you're connecting to. Warnings about it are
more than just a devilish developer's effort to inconvenience us (though
it's difficult to rule that motivation out entirely).

No, the host key is actually central to the security provided by SSH
when you make a connection to your server. If someone malicious tries
to set up a program to intercept your connection and steal your login
credentials - a "man in the middle" attack - then the only warning
you'll get is your SSH client complaining that the host key has changed.

###  Why the host key might change

The more innocent explanations for a changed host key include
recompiling or upgrading SSH, rebuilding the server, or just using a
different address to get to the same host.  When your system stores the
host key it records it by address, so even if "localhost" and
"127.0.0.1" point to the same server an SSH client will treat them as
entirely different entries.

Thus, sometimes that message is expected. But even an expected warning
doesn't mean that there couldn't be a man-in-the-middle attack in
progress. It sounds a little paranoid, but that's good security for you - anything can happen, at any time, and the more you do to rule out any
variables the better.

So let's look at when and how to check the host fingerprint without
using an SSH connection. We'll do it by going in through the server's
web console.

###  A dire warning

First we'll look at the error message that probably brought you to this
article, a warning that the host's identification has changed:

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle attack)!
    It is also possible that the RSA host key has just been changed.
    The fingerprint for the RSA key sent by the remote host is
    xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx.
    Please contact your system administrator.
    Add correct host key in /home/demo/.ssh/known_hosts to get rid of this message.
    Offending key in /home/demo/.ssh/known_hosts:15
    RSA host key for 1.2.3.4 has changed and you have requested strict checking.
    Host key verification failed.

The warning can be summed up as: The fingerprint that identifies the SSH
server is different from what it was the last time you connected to it.
Expected or not, you'll want to check on that.

###  Check your server's SSH fingerprint

If you have your server's SSH fingerprint written down somewhere you can
compare it to what SSH shows you to make sure you're connecting to the
right machine. Most of us don't write that down, but it's a pretty good
idea to do so if you connect from multiple machines or from unfamiliar
computers (like from a consulting client's desktop or server).

If you don't have the host fingerprint handy you can use the control
panel's web console to find it.

The web console lets you connect to your server as if you were, well,
sitting at the console. If anything weird is going on with SSH it won't
interfere with you connecting directly to the console through the Cloud
Control Panel.

You can connect to the web console for your server through the Cloud
Control Panel.  If you need assistance opening the web console, [see this article](/how-to/start-a-console-session).

If you don't have a username and password to use (if you've disabled
passwords for all accounts, for example) you can use the Cloud Control
Panel to reset your server's root password. Then you can use the new
credentials to get in.

Now that you're on the server it's time to get that host key
fingerprint.

####  Use ssh-keygen

The official way to get that fingerprint is to run the `ssh-keygen`
command against the server's public key, as in:

    ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key.pub

The `-l` option tells ssh-keygen you want to list the fingerprint, and
the `-f /etc/ssh_host_rsa_key.pub` part tells ssh-keygen where it can
find the host's public key file. That location is typical for Linux
servers, but you may need to poke around a bit to find the file if it's
not in that default location.

The output should be reminiscent of the fingerprint your SSH client
showed you earlier:

    2048 xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx /etc/ssh/ssh_host_rsa_key.pub (RSA)

The first number indicates the strength of the key (in this case, 2048
bits). The fingerprint follows, along with the location of the key it
analyzed and the type of key it's using (usually RSA).

####  ssh to localhost

This isn't a bad method to getting the fingerprint, it's just not as
technical and fancy as the official way. It also only works when the SSH
server is actively running on the machine. It's handy if you can't find
the host's public key file easily.

To get the fingerprint this way, get into the web console and then ssh
to localhost:

    ssh localhost

If you've never completed an ssh connection to localhost before (you
probably haven't) you'll see a warning:

    The authenticity of host 'localhost (::1)' can't be established.
    RSA key fingerprint is xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx.
    Are you sure you want to continue connecting (yes/no)?

And there's the fingerprint you wanted.

If you didn't get that message then you've completed an ssh connection
to localhost before. To clear the stored key go into your account's
**.ssh** directory:

    cd ~/.ssh

And then edit the "known_hosts" file. Look for a line that starts with
"localhost", delete it, save the file, and try again. You should get the
fingerprint this time.

**Note**: Write the fingerprint down or put it in a note on your cell phone or
something. You went to all this trouble to get the key, you might as
make sure you have it handy in case you need to do this again.

###  Completing the connection

Now that we have the host key fingerprint in-hand we can see if the SSH
connection is a good one.

If your client was connecting to the server for the first time and you
were just confirming the host key before accepting it, you're set.
Compare the fingerprint you dug up with what the client is showing you
and if they match, accept the key.

If they don't match then don't complete the connection. If you're on a
public wi-fi network (like at a coffee shop or a hotel) then disconnect
from it and find someplace else to connect from - the interference may
have been local, so moving may get the jerk out of your hair. Otherwise
it might be a good time to get in touch with our support staff and they
can help you figure out your options.

###  Host key has changed

If the warning you got was that the fingerprint didn't match what the
client was expecting then you'll need to edit your client's list of
known hosts before you can connect.

####  Linux and Mac OS X

On Linux, Mac OS X, and other Unix-based operating systems you usually
use the "ssh" command to connect to a server via SSH. That should mean
there's a directory named **.ssh** in your home directory. Inside that
will be the "known_hosts" file that contains the known SSH host keys.

So basically, the file should be at:

    ~/.ssh/known_hosts

Sometimes you may see a "known_hosts2" file in place of or in addition
to "known_hosts". If both are there then "known_hosts2" is usually the
file being used when you make a connection.

Once you have the file identified, open it for editing and look for a
line that starts with your server's address. It could be the IP address
or the domain name, so look for whichever one you use when you're
connecting via SSH.

If you were using the IP address to connect to the server at 1.2.3.4 it
would look something like:

    1.2.3.4 ssh-rsa AAAAB3NzaC1yc2EAAAABIwGAAQEA2Km5iIlopDndzSTbiaQZq8ynh8RPrvzBJ7dICnvAZWuH/YeNO+9DPnngzsOiYazwRD/CRSGEGRY6tS3GLclFO3Ae370aafbcq...

Once you find the line listing the key for your server you can delete
the line and save the edited file. The next time you make a connection
it will be as if you'd never connected to the server before. Remember to
check the host fingerprint again before completing the connection!

####  Windows and PuTTY

There are a variety of SSH clients that can be used on Windows, but
we'll talk about the free and widely-used PuTTY terminal program. If you
use another program check your user documentation to find out where the
client stores its known host keys.

PuTTY stores its host keys in the Windows registry. That means that
before you continue with this you'll want to be sure you're comfortable
editing your registry. If you don't have Administrator rights on your
workstation then you might need to ask an admin to make this change for
you.

To find the known host keys go to the Windows menu, then in the "search"
or "run" box enter:

    regedit

The registry is arranged as a hierarchy of a whole bunch of folders. The
one you want to navigate to is:

    HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\SshHostKeys

And in there, you'll find one or more entries with names like:

    rsa2@22:1.2.3.4

That key entry would be for an RSA version 2 encrypted key at port 22,
address "1.2.3.4". With that format in mind, look for the one for the
address you're connecting to.

Once you find the entry for your server right-click it and select
**Delete** from the contextual menu. You'll get a warning that editing the
registry can cause problems and you will be asked to confirm the action. Go ahead
and do it.

Exit the registry editor and try your SSH connection again. You should
get a warning that the server's host key is unknown and it will show the
fingerprint again.

Double-check against the fingerprint you pulled up in the web console,
and if it matches, accept the key.

###  Summary

It took a little poking around, but now you should have your server's
host key fingerprint handy in case you need to check it again. At the
least, you know how to bring it up some other time.

You might consider making a habit of recording the host key fingerprints
of servers when you create them. That way you'll always have a reference
handy if you need to check the fingerprint again. It's a little
inconvenience at the outset in return for a pretty comforting security
check you can run through easily when you connect from a new machine.

Next we are going to look at the the [basics of security in a Linux system](/how-to/basic-cloud-server-security),
adding to what we learned about SSH connections and host keys.

**Next section:** [Basics of security in a Linux system](/how-to/basic-cloud-server-security)
