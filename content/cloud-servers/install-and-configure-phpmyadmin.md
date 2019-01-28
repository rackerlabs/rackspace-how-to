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

After you have installed phpMyAdmin on your webserver, there are some settings
that you must configure. Use the instructions in the following sections to
configure phpMyAdmin.

#### Apache webserver

You first need to add the IP address that you want to use to access phpMyAdmin
to the **/etc/phpMyAdmin/config.inc.php** configuration file.

1. Open the **/etc/phpMyAdmin/config.inc.php** file in a text editor.
2. In the section beginning with the line **<IfModule !mod_authz_core.c>**, add
   the IP address as in the following example:

       <IfModule !mod_authz_core.c>
       # Apache 2.2
       Order Deny,Allow
       Deny from All
       Allow from 127.0.0.1
       Allow from ::1
       Allow from
       Require ip 94.236.7.190
       </IfModule>
       </Directory>

3. Save and close the file.

##### Set a URL alias (optional)

The standard URL for a phpMyAdmin installation is
**http://ipaddress/phpMyAdmin**, where **ipaddress** is the IP address that you
added to the configuration file in the previous section. If you want to
change the URL, you can set an alias.

1. Open the **/etc/httpd/conf.d/phpMyAdmin.conf** file in a text editor.
2. Find the lines beginning with **Alias** and change **/phpMyAdmin** to the
   alias of your choice, as shown in the following example:

       Alias /NewName /usr/share/phpMyAdmin
       Alas /newname /usr/share/phpMyAdmin

3. Save and exit the file.

##### Database configuration file

If the MySQL or MariaDB database server that you want to use with phpMyAdmin
is not located on the same server
as your webserver, you must edit the database configuration file to
define the database server location.

There are two configuration options:

1. MySQL host or IP address
2. MySQL/MariaDB port

Use the following steps to define the location of your database server:

1. Open the **/etc/phpMyAdmin/config.inc.php** file in a text editor.
2. Edit the file as shown in the following example:

       $cfg['Servers'][$i]['host']          = 'localhost'; // MySQL hostname or IP address
       $cfg['Servers'][$i]['port']          = '';          // MySQL port - leave blank for default port
       $cfg['Servers'][$i]['socket']        = '';          // Path to the socket - leave blank for default socket
       $cfg['Servers'][$i]['connect_type']  = 'tcp';       // How to connect to MySQL server ('tcp' or 'socket')
       $cfg['Servers'][$i]['extension']     = 'mysqli';    // The php MySQL extension to use ('mysql' or 'mysqli')
       $cfg['Servers'][$i]['compress']      = FALSE;       // Use compressed protocol for the MySQL connection
                                                           // (requires PHP >= 4.3.0)
       $cfg['Servers'][$i]['controluser']   = '';          // MySQL control user settings
                                                           // (this user must have read-only
       $cfg['Servers'][$i]['controlpass']   = '';          // access to the "mysql/user"
                                                           // and "mysql/db" tables).

3. Save and exit the file.

To make the changes live, you must check the syntax of the web engine daemon
and then gracefully restart or reload it.

Check the syntax by using the following command:

    apachectl configtest

If the are no errors in the configuration file, you should see `Syntax OK` in
the output.

Reload the Apache webserver by using the following command:

**CentOS and RHEL 6**

    service httpd graceful

**CentOS and RHEL 7**

    systemctl status httpd

Check the status of the httpd service to ensure that it is functioning as
expected by using the following command:

**CentOS and RHEL 6**

    service httpd status

**CentOS and RHEL 7**

    systemctl status httpd

You should now be able to view phpMyAdmin through a web browser.

<img src="{% asset_path cloud-servers/install-and-configure-phpmyadmin/phpmyadmin-browser.php %}" />

#### Nginx webserver

On Nginx, the phpMyAdmin package doesn't come with a configuration file, so
you have to create a server block to point at the phpMyAdmin
configuration file.

1. Open a text editor and create the file **/etc/nginx/conf.d/phpMyAdmin.conf**.
2. Enter the following configuration settings:

    server {
    listen 80;
    server_name 95.138.162.233;
    root /var/www;
    location /phpMyAdmin {
        root /usr/share/;
        index index.php;

    # auth_basic "phpMyAdmin Login";                # uncomment if using .htaccess & .htpasswd security
    # auth_basic_user_file /etc/nginx/.pma_pass;    # uncomment if using .htaccess & .htpasswd security

        location ~\.php$ {
            try_files $uri =404;
            fastcgi_pass 127.0.0.1:9000;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include /etc/nginx/fastcgi_params;
            }

        location ~* ^/phpmyadmin/(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt))$ {
            root /usr/share/;
            }
        }

    location /phpmyadmin {
        rewrite ^/* /phpMyAdmin last;
        }
    }

3. Save and exit the file.

To make the changes live, you must check the syntax of the web engine daemon
and then gracefully restart or reload it.

Use the following command to check the syntax:

    nginx -t

If the are no errors in the configuration file, you should see `Syntax OK` in
the output.

Reload the Nginx webserver by using the following command:

**CentOS and RHEL 6**

    service nginx graceful

**CentOS and RHEL 7**

    systemctl reload nginx

Check the status of the nginx service to ensure that it is functioning as
expected by using the following command:

**CentOS and RHEL 6**

    service nginx status

**CentOS and RHEL 7**

    systemctl status nginx

You should now be able to view phpMyAdmin through a web browser.

<img src="{% asset_path cloud-servers/install-and-configure-phpmyadmin/phpmyadmin-browser.php %}" />

### Configure phpMyAdmin on Ubuntu

Use the steps in the following sections to configure phpMyAdmin on Ubuntu.

#### Apache webserver

The installation process adds the phpMyAdmin Apache configuration file to the
**/etc/apache2/conf-enabled/** directory, where it is read automatically. The
only thing you need to do is to enable the **mbstring** PHP extension, which
you can do by running the following command:

    sudo phpenmod mbstring

After installing phpMyAdmin, the package configuration screen displays.
Use the space bar to select **apache2**, press Tab to select
**<Ok>**, and then press Enter.

<img src="{% asset_path cloud-servers/install-and-configure-phpmyadmin/phpmyadmin-package-configuration-select-apache2.php %}" />

The installation process continues until another configuration screen displays
that confirms if you want to configure your database for phpMyAdmin by using
`dbconfig-common`.

Select **<Yes>**, and then press Enter.

You are prompted for your database administrator password. Input your password,
press Tab to select **<Ok>**, and then press Enter.

Next, enter a password for the phpMyAdmin application itself, press Tab to
select **<Ok>**, and then press Enter.

Confirm the password by selecting **<Ok>**, and then press Enter.

After the installation process is complete, the phpMyAdmin configuration file
is added here: **/etc/apache2/conf-enabled/phpmyadmin.conf**.

If this file doesn't exist after the installation is complete, you can copy it
from **/etc/phpmyadmin/apache.conf** to **/etc/apache2/conf-enabled**. If
that file doesn't exist, you must create a virtualhost for phpMyAdmin with the
following settings:

    server {
           listen 80;
           server_name example.com www.example.com;
           root /var/www/vhosts/example.com;
           ..

           location /phpMyAdmin {
               root /usr/share/;
               index index.php;

               # auth_basic "phpMyAdmin Login";                                # uncomment if using .htaccess & .htpasswd security
               # auth_basic_user_file /etc/phpMyAdmin/.phpmyadmin-htpasswd;    # uncomment if using .htaccess & .htpasswd security

               location ~\.php$ {
                       try_files $uri =404;
                       fastcgi_pass unix:/var/run/php-fpm.sock;
                       fastcgi_index index.php;
                       fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                       include /etc/nginx/fastcgi_params;
               }
               location ~* ^/phpmyadmin/(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt))$ {
                       root /usr/share/;
               }
        }
        location /phpmyadmin {
               rewrite ^/* /phpMyAdmin last;
        }
        ...
    }

If at any time you need to reconfigure phpMyAdmin, you can use the following
command:

    dpkg-reconfigure phpmyadmin

##### Remote database configuration

If the database server that you want to manage with phpMyAdmin is remote, you
must configure phpMyAdmin differently. The configuration files are located in
the **/etc/phpmyadmin** directory.

#### Nginx webserver


### Secure the webserver (Optional)
