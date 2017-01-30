---
permalink: ssh-remote-host-identification-has-changed/
audit_date:
title: 'SSH - "REMOTE HOST IDENTIFICATION HAS CHANGED"'
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The first time you try to connect to a newly-rebuilt Cloud Server, you
may be greeted with a message similar to the following:

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle attack)!
    It is also possible that the RSA host key has just been changed.
    The fingerprint for the RSA key sent by the remote host is
    xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx.
    Please contact your system administrator.
    Add correct host key in /home/scott/.ssh/known_hosts to get rid of this message.
    Offending key in /home/scott/.ssh/known_hosts:15
    RSA host key for 1.2.3.4 has changed and you have requested strict checking.
    Host key verification failed.

It may seem alarming to the unaware, but in this case it is harmless.
The RSA key on your Cloud Server was changed when you rebuilt it, and
your SSH client is simply trying to warn you that (it thinks) the
discrepancy may be fault of an attacker. **Please note that if you see
this message at any other time, you should *not* enter your credentials
and should investigate further.**

To reset the known host key, pay attention to these two lines:

    Offending key in /home/scott/.ssh/known_hosts:15
    RSA host key for 1.2.3.4 has changed...

The first line tells you the file name and the line number of the old
key; in this case, you could simply open up the .ssh/known\_hosts file
in your favorite editor and delete line 15 to resolve the issue.
Alternatively, you could run this Linux command...

    sed -i '/1.2.3.4/d' /home/scott/.ssh/known_hosts

... replacing the IP and pathname as appropriate.

The next time you attempt to log in, SSH should tell you that the host
key is unknown and ask if you want to connect and save the new key.

For more information about the SSH key and its security implications,
please see [this article about checking the SSH key via the web
console](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console).

