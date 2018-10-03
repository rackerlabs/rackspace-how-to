---
permalink: install-and-configure-phpmyadmin/
audit_date: '2018-10-02'
title: Install and configure phpMyAdmin
type: article
created_date: '2018-09-12'
created_by: Rackspace Support
last_modified_date: '2018-10-02'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

phpMyAdmin is a free software tool written in php, designed to handle
the administration of MySQL over the web. This article describes how
to install and configure phpMyAdmin.

### Check if a web engine and php are installed

Use the commands in the following sections to determine whether a web engine
and php are installed. If you do have a web engine and php
installed, the output is similar to the examples shown.

#### CentOS and RedHat

Use the following command to check for a httpd web engine:

    rpm -qa | grep httpd

If a httpd web engine is installed, the output is similar to the following:

    httpd-2.4.6-80.el7.centos.x86_64

    httpd-tools-2.4.6-80.el7.centos.x86_64

Use the following command to check for a nginx web enging:

    rpm -qa | grep nginx

If a nginx web engine is installed, the output is similar to the following:

    nginx-mod-mail-1.12.2-2.el7.x86_64

    nginx-1.12.2-2.el7.x86_64

    nginx-filesystem-1.12.2-2.el7.noarch

    nginx-mod-http-geoip-1.12.2-2.el7.x86_64

    nginx-mod-http-xslt-filter-1.12.2-2.el7.x86_64

    nginx-all-modules-1.12.2-2.el7.noarch

    nginx-mod-stream-1.12.2-2.el7.x86_64

    nginx-mod-http-perl-1.12.2-2.el7.x86_64

    nginx-mod-http-image-filter-1.12.2-2.el7.x86_64

Use the following command to check if php is installed:

    rpm -qa | grep php

If php is installed, the output is similar to the following:

    php-common-5.4.16-45.el7.x86_64

    php-cli-5.4.16-45.el7.x86_64

    php-5.4.16-45.el7.x86_64

#### Ubuntu and Debian

Use the following command to check if php is installed:

    dpkg -l | grep php

If php is installed, the output is similar to the following:

    ii  php7.0                           7.0.30-0ubuntu0.16.04.1                    all          server-side, HTML-embedded scripting language (metapackage)

### Install a web engine, php, and phpMyAdmin

If you don't have a web engine or php installed already, use the steps in the following sections to install them.

#### CentOS and RedHat

Use the following command to install a httpd web engine:

    yum install httpd

Use the following command to install php and phpMyAdmin:

    yum install php.x86_64 phpmyadmin -y

#### Ubuntu and Debian

Use the following command to install an apache2 web engine:

    apt-get install apache2

Use the following command to install php and phpMyAdmin:

    apt-get install php phpmyadmin -y

### Start, check status, and enable a web engine

After you have installed a web engine, you must start and enable it. You can also check the status of a web engine.
