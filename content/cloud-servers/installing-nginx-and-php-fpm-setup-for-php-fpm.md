---
permalink: installing-nginx-and-php-fpm-setup-for-php-fpm/
audit_date:
title: Installing NGINX and PHP-FPM  - Setup for PHP-FPM
type: article
created_date: '2012-03-13'
created_by: Kevin Carter
last_modified_date: '2016-01-19'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Installing NGINX and PHP-FPM - Setup for NGINX](/how-to/installing-nginx-and-php-fpm-setup-for-nginx)

The steps in this article guide you through adding pool information to
the PHP-FPM setup that you [previously completed](/how-to/installing-nginx-and-php-fpm-setup-for-nginx).

When you entered the command to install PHP-FPM, the system created a
default configuration for PHP-FPM. This default configuration might have
included a directory for your sockets to reside in while they are
active. If it did not, you must create this directory. In the following
example, the sockets are placed in the `/var/run/php5-fpm/` directory.
Use the following command to create the directory:

    mkdir -p /var/run/php5-fpm/

Sockets automatically spawn in this if you are using the virtualhost
setup and PHP-FPM pool template provided. No more action is required on
your part.

To complete the setup, move to the `/etc/php5/fpm/pool.d/` directory
where you will set up the different UNIX sockets on which PHP-FPM will
function.

**Note:** For your system to function properly, you must create a new
pool for every virtual host that you set up.

The pool files should follow this naming convention: `YOURDOMAIN.conf`

Following is a template for the pool files. Replace all instances of
DOMAINNAME with your domain name.

    [DOMAINNAME]

    listen = /var/run/php5-fpm/DOMAINNAME.socket
    listen.backlog = -1
    listen.owner = nginx
    listen.group = www-data
    listen.mode=0660

    ; Unix user/group of processes
    user = (THE USERNAME OF THE USER THAT OWNS THE SITE FILES)
    group = www-data

    ; Choose how the process manager will control the number of child processes.
    pm = dynamic
    pm.max_children = 75
    pm.start_servers = 10
    pm.min_spare_servers = 5
    pm.max_spare_servers = 20
    pm.max_requests = 500

    ; Pass environment variables
    env[HOSTNAME] = $HOSTNAME
    env[PATH] = /usr/local/bin:/usr/bin:/bin
    env[TMP] = /tmp
    env[TMPDIR] = /tmp
    env[TEMP] = /tmp

    ; host-specific php ini settings here
    ; php_admin_value[open_basedir] = /var/www/DOMAINNAME/htdocs:/tmp
