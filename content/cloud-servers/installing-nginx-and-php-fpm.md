---
permalink: installing-nginx-and-php-fpm/
audit_date:
title: Installing NGINX and PHP-FPM
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

You've [gotten your system ready](/how-to/installing-nginx-and-php-fpm-the-fun-begins)
to install PHP-FPM.

Now this is the most complicated and quite possibly the hardest piece to
the setup.

Here is the overwhelming and complicated command set that you will need
to enter in order to get NGINX and PHP-FPM installed on your Debian
System.

```
apt-get -t squeeze-backports install nginx-extras; apt-get install php5 php5-fpm php5-common php5-curl php5-dev php5-gd php5-imagick php5-mcrypt php5-memcache php5-mysql php5-pspell php5-snmp php5-sqlite php5-xmlrpc php5-xsl php-pear libssh2-php php5-cli
```

At this time I create a system user for NGINX.

```
adduser --system --no-create-home nginx
```

This command simply creates a system user with no home directory. We
will use this User later in our setup.

WOW, that was tough! I know you may be tired, so this is a good time to
take a break.

### Next section

[Installing NGINX and PHP-FPM](/how-to/installing-nginx-and-php-fpm)
