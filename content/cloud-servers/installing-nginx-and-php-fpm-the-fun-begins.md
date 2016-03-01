---
node_id: 1317
title: Installing NGINX and PHP-FPM  - The Fun Begins
type: article
created_date: '2012-03-13'
created_by: Kevin Carter
last_modified_date: '2015-12-23'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Installing NGINX and PHP-FPM - Preface](/how-to/installing-nginx-and-php-fpm-preface)

Now that you've [read the preface](/how-to/installing-nginx-and-php-fpm-preface)
and know what you're getting yourself into, It is time to get your
system ready to install NGINX and PHP-FPM.

You can get the source from NGINX and/or add the NGINX repositories to
your system. There is a Debian specific Repository that you could use,
there are also other distro-specific repositories that you could use, if
your system happens to not be a Debian Server. You can find more
information on these repositories here: [NGINX Repositories](http://wiki.nginx.org/Install).

While the fore-mentioned REPO is perfectly valid, I choose to use
the [Debian Backports](http://backports-master.debian.org/Instructions/) as
my repository for NGINX. I chose this because this allowed for an easy
configuration, and allowed me to install a more up-to-date version of
NGINX on my system while giving me a more supported application for my
environment. To add the Debian Backports to your repositories simply
execute this echo command:

```
echo 'deb http://backports.debian.org/debian-backports squeeze-backports main' >> /etc/apt/sources.list.d/backports.list
```

After this has been added to your Source Repositories you will then need
to add the DotDeb Repositories to your system so that you can install
PHP-FPM.

To install the DotDeb Repositories into your system here is a crazy
little command set:

```
echo 'deb http://packages.dotdeb.org stable all' >> /etc/apt/sources.list.d/DotDeb.list
echo 'deb-src http://packages.dotdeb.org stable all' >> /etc/apt/sources.list.d/DotDeb.list
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
rm dotdeb.gpg
```

This set adds the DotDeb Repositories to your sources, it then adds the
GPG key to your system, and finally it removes the GPG key file from
your system; so there are no leftovers from the installation.

After you have added the repositories to your system, update your
sources with this simple command:

```
apt-get update
```

### Next section

[Installing NGINX and PHP-FPM](/how-to/installing-nginx-and-php-fpm)
