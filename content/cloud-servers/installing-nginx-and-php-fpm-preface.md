---
permalink: installing-nginx-and-php-fpm-preface/
audit_date:
title: Installing NGINX and PHP-FPM - Preface
type: article
created_date: '2012-03-12'
created_by: Kevin Carter
last_modified_date: '2015-12-23'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Installing NGINX and PHP-FPM running on UNIX File Sockets](/how-to/installing-nginx-and-php-fpm-running-on-unix-file-sockets)

To preface this article, let me say that this is the exact stack that I
have set up and am running on a Rackspace Cloud Server, so I know that
it is portable and will work on a multitude of different environments. I
have attempted to be very verbose and comment on the different
configuration files that I will be showing so that you can make changes
to fit your environment. To that end, I will be showing the entire
configuration for the server and some of the other things that I have
been able to create.

To begin with, here are the specs for my server:

-   Rackspace Cloud Server
-   Operating System : Debian 6
-   Flavor : 256 MB RAM with 10 GB Disk Space

It should be noted that a 256MB server is not a production-ready server,
and that while this guide is a comprehensive guide to the applications,
NGINX and PHP-FPM are not a supported Rackspace service or product.  I
love NGINX and would not use anything else, and many of my fellow
Rackers feel the very same way.  However, with Rackspace Cloud Managed
Infrastructure, we do not support NGINX or any other server applications
at this time.

It should also be noted that I am a Debian guy, but I have love for my
RHEL-ish brothers and sisters too. This guide is specifically built for
Debian, though it could be used in a RHEL-ish OS setup. You simply need
to make a few changes to the placement of the files that you are
modifying, and the repositories that you are using.  Throughout this
guide I will be using Repositories for easy install, but if you are a
Gentoo, Arch Linux, or simply enjoy pain; you could compile your
services from source.

Once the server is provisioned and you have been able to login to the
server, I recommend that you do any and all necessary patching, which is
just a good practice with a new server. My thought is: It's better to
break things now rather than break things later. To do this in Debian /
Ubuntu enter this simple command set below:

```
apt-get update
apt-get dist-upgrade
reboot
```
Once you have finished updating, this set will allow you to restart the
server. This ensures that the updates have been installed and
initialized completely.

### Next section

[Installing NGINX and PHP-FPM - The Fun Begins](/how-to/installing-nginx-and-php-fpm-the-fun-begins)
