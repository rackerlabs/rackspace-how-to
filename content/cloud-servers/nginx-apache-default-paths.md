---
permalink: nginx-apache-default-paths/
audit_date:
title: 'Nginx & Apache default paths'
type: article
created_date: '2020-04-25'
created_by: Matthew Brown
last_modified_date: '2020-04-25'
last_modified_by: Matthew Brown
product: Cloud Servers
product_url: cloud-servers
---

This article will walk you through how to set up the default document root for apache vhosts and nginx server blocks

## The Default Document Root

By default, both Apache and Nginx have a default document root set up in their base configs. The base configs can be found in the following file paths:

#### CentOS

- Apache - `/etc/httpd/conf/httpd.conf`
- Nginx - `/etc/nginx/nginx.conf`

#### Ubuntu

- Apache - `/etc/apache2/apache2.conf`
- Nginx - `/etc/nginx/nginx.conf`


When you look in these configs, you look for the following:

#### Apache

```
# DocumentRoot: The directory out of which you will serve your
# documents. By default, all requests are taken from this directory, but
# symbolic links and aliases may be used to point to other locations.
#
DocumentRoot "/var/www/html"    <----

```

### Nginx

```
server {
    listen       80 default_server;
    listen       [::]:80 default_server;
    server_name  _;
    root         /usr/share/nginx/html;  <----

```

Whenever a virtual host or server block is created, the web server will look in these directories for the website files. If do not want them to look into this directory, you can change default file path or specify a different document root in the virtual host/server block 
