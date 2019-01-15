---
permalink: install-and-configure-phpmyadmin/
audit_date: '2019-01-11'
title: Install and configure phpMyAdmin
type: article
created_date: '2019-01-11'
created_by: 'Stephanie Fillmon & Paul Dolbear'
last_modified_date: '2019-01-11'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

phpMyAdmin is a free and open source administration tool for MySQL&reg; and
MariaDB&reg;. As a portable web application written primarily in PHP,
phpMyAdmin has become one of the most popular MySQL administration tools,
especially for web hosting services.

This article describes how to install and configure phpMyAdmin on your
webserver for CentOS&reg; 7, Red Hat&reg; Enterprise Linux&reg; 7, and
Ubuntu&reg; 16.04 LTS.

### Prerequisites

Before you can install phpMyAdmin, you must have the following installed
on your server:

- A webserver, such as Apache&reg; or NGINX&reg;
- PHP

#### Check whether a webserver is installed

Use the commands in the following table to check whether a webserver is
installed:

| Operating System | Webserver | Command |
| --- | --- | --- |
| CentOS and RHEL | Apache | `rpm -qa | grep httpd` |
| CentOS and RHEL | NGINX | `rpm -qa | grep nginx` |
| Ubuntu | Apache | `dpkg -l | grep apache` |
| Ubuntu | NGINX | `dpkg -l | grep nginx` |

#### Check whether PHP is installed

Use the following command to check whether PHP is installed on CentOS
or RHEL:

    rpm -qa | grep php

Use the following command to check whether PHP is installed on Ubuntu:

    dpkg -l | grep php

### Install phpMyAdmin

Use the instructions in the following sections to install phpMyAdmin.

#### CentOS and RHEL

Install phpMyAdmin by using the following command:

    yum install phpmyadmin

The output should be similar to the following example:

    Loaded plugins: fastestmirror, langpacks
    Loading mirror speeds from cached hostfile
     * base: mirror.mhd.uk.as44574.net
     * epel: mirror.freethought-internet.co.uk
     * extras: mirror.mhd.uk.as44574.net
     * updates: mirror.mhd.uk.as44574.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package phpMyAdmin.noarch 0:4.4.15.10-3.el7 will be installed
    --> Processing Dependency: php-mysqli >= 5.3.7 for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Processing Dependency: php-mbstring >= 5.3.7 for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Processing Dependency: php-gd >= 5.3.7 for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Processing Dependency: php-xmlwriter for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Processing Dependency: php-tcpdf-dejavu-sans-fonts for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Processing Dependency: php-tcpdf for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Processing Dependency: php-php-gettext for package: phpMyAdmin-4.4.15.10-3.el7.noarch
    --> Running transaction check

#### Ubuntu

Install phpMyAdmin by using the following command:

    apt-get install php phpmyadmin

The output should be similar to the following example:

    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following additional packages will be installed:
      dbconfig-common dbconfig-mysql fontconfig-config fonts-dejavu-core javascript-common libfontconfig1 libgh3 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc libjs-underscore libtiff5 libvpx3 libxpm4 libxslt1.1 php-gd php-gettext php-mbstring php-pear php-phpseclib php-tcpdf php-xml php7.0-gd php7.0-mbstring php7.0-xml
    Suggested packages:
      libgd-tools php-libsodium php-gmp php-imagick www-browser
    The following NEW packages will be installed:
      dbconfig-common dbconfig-mysql fontconfig-config fonts-devaju-core javascript-common libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc libjs-underscore libtiff5 libvpx3 libxpm4 libxslt1.1 php-gd php-gettext php-mbstring php-pear php-phpseclib php-tcpdf php-xml php7.0-gd php7.0-mbstring php7.0-xml phpmyadmin
    0 upgraded, 28 newly installed, 0 to remove and 6 not upgraded.
    Need to get 16.3 MB of archives.
    After this operation, 61.5 MB of additional disk space will be used.
    Do you want to continue? [Y/n]

Press **Y** and then press the enter key to continue to the configuration
process. See the **Configure phpMyAdmin on Ubuntu** section for further
instructions.

### Configure phpMyAdmin on CentOS and RHEL



### Configure phpMyAdmin on Ubuntu
