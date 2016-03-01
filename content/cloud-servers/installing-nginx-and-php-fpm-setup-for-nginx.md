---
node_id: 1319
title: Installing NGINX and PHP-FPM - Setup for NGINX
type: article
created_date: '2012-03-13'
created_by: Kevin Carter
last_modified_date: '2015-12-23'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Installing NGINX and PHP-FPM](/how-to/installing-nginx-and-php-fpm)

After NGINX installed, you can set up NGINX and PHP-FPM to work on your
system.

NGINX enables you to change the outlook on your web application from
complexity to simplicity. If you have been using Apache, NGINX might be
confusing to you. However, you will see some familiar directives and
directives that you might recognize. For more information on NGINX, see
the [NGINX Wiki](http://wiki.nginx.org/Main).

### Set up NGINX configuration files

To set up NGINX, you must change the following configuration files,
which are contained in the directory **/etc/nginx/**.

-   **nginx.conf**
-   f**astcgi params**

You can also add the following files if you want to use NGINX in your
deployment of a virtual host.

-   **security**
-   **mail.conf**

Before you change the configuration files, we recommended that you back
up the original configuration files by using the following command:

    tar -czf ~/NGINX_Config.tar.gz nginx.conf fastcgi_params

### nginx.conf

Below is an example of how you can change your **nginx.conf** file. The
file contains two include parameters in the **\# Virtual Host
Configs** area, which allow you to have a separate configuration file
directory and a separate virtual host file directory. Although these
parameters are not necessary, they simplify the deployment of virtual
hosts.

```
user nginx www-data;
worker_processes 4;
pid /var/run/nginx.pid;

events {
    worker_connections 768;
    # multi_accept on;
}

http {
# Basic Settings
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    # server_tokens off;

    # server_names_hash_bucket_size 64;
    # server_name_in_redirect off;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

# Logging Settings
log_format gzip '$remote_addr - $remote_user [$time_local]  '
                '"$request" $status $bytes_sent '
                '"$http_referer" "$http_user_agent" "$gzip_ratio"';

    access_log /var/log/nginx/access.log gzip buffer=32k;
    error_log /var/log/nginx/error.log notice;

# Gzip Settings
    gzip on;
    gzip_disable "msie6";

    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

# Virtual Host Configs
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;

}
```

NGINX can accommodate a single long configuration file, similar to an
Apache **httpd.conf** file. Although you can modify the file to fit the
needs of your particular environment, we recommend that you use the
configuration shown in the example because this configuration will work
for most production systems.

### fastcgi params

Use the following parameters in your **fastcgi params** file:

```
fastcgi_param   QUERY_STRING        $query_string;
fastcgi_param   REQUEST_METHOD      $request_method;
fastcgi_param   CONTENT_TYPE        $content_type;
fastcgi_param   CONTENT_LENGTH      $content_length;

fastcgi_param   SCRIPT_NAME     $fastcgi_script_name;
fastcgi_param   REQUEST_URI     $request_uri;
fastcgi_param   DOCUMENT_URI        $document_uri;
fastcgi_param   DOCUMENT_ROOT       $document_root;
fastcgi_param   SERVER_PROTOCOL     $server_protocol;
fastcgi_param   SCRIPT_FILENAME     $document_root$fastcgi_script_name;
fastcgi_param   PATH_INFO       $fastcgi_script_name;

fastcgi_param   GATEWAY_INTERFACE   CGI/1.1;
fastcgi_param   SERVER_SOFTWARE     nginx/$nginx_version;

fastcgi_param   REMOTE_ADDR     $remote_addr;
fastcgi_param   REMOTE_PORT     $remote_port;
fastcgi_param   SERVER_ADDR     $server_addr;
fastcgi_param   SERVER_PORT     $server_port;
fastcgi_param   SERVER_NAME     $server_name;

# PHP only, required if PHP was built with --enable-force-cgi-redirect
fastcgi_param   REDIRECT_STATUS     200;
```

### Security

Although it is not required, adding a security file to
your **/etc/nginx** directory will simplify the deployment of a virtual
host with NGINX.

Use the following parameters in your security file:

```
## Only requests to our Host are allowed
#      if ($host !~ ^($server_name)$ ) {
#         return 444;
#      }

## Only allow these request methods ##
## Do not accept DELETE, SEARCH and other methods ##
     if ($request_method !~ ^(GET|HEAD|POST)$ ) {
         return 444;
     }

## Deny certain Referrers ###
     if ( $http_referer ~* (babes|forsale|girl|jewelry|love|nudit|organic|poker|porn|sex|teen) )
     {
         return 404;
         return 403;
     }
```

### mail.conf

The mail.conf file is a strictly optional file for those who want to use
NGINX as a high-performance mail proxy server. It contains mail
directives typically found in the **nginx.conf** file.

If you chose to include **mail.conf** in your NGINX configuration, place
the file in the **/etc/nginx/conf.d/** directory.

Use the following parameters in your **mail.conf** file:

```
#mail {
#       # See sample authentication script at:
#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#       # auth_http localhost/auth.php;
#       # pop3_capabilities "TOP" "USER";
#       # imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#       server {
#               listen     localhost:110;
#               protocol   pop3;
#               proxy      on;
#       }
#
#       server {
#               listen     localhost:143;
#               protocol   imap;
#               proxy      on;
#       }
#}
```

Note how each directive is commented out. If you want to change your
NGINX configuration for a high-performance mail proxy server, uncomment
the preceding directives above by deleting every \#.

### Set up virtual hosts

After you have completed your NGINX configuration, you can set up your
virtual hosts. In Debian, the following subdirectories under the
**/etc/nginx/ **directory pertain to virtual hosts:

-   **sites-available**, where you house your virtual hosts
-   **sites-enabled**, where your virtual hosts live after they are
    active

These subdirectories function in much the same way as their Apache
equivalents. The sites-available directory contains a virtual host
config file. You can either copy or symlink the file from one place to
the other.

To symlink a virtual host config file from one directory to another,
enter the following command:

```
ln -s /etc/nginx/sites-available/THE.VIRTUAL.HOST.FILENAME /etc/nginx/sites-enabled/THE.VIRTUAL.HOST.FILENAME
```

After you have symlinked your virtual host config file, navigate to the
**/etc/nginx/sites-available/** directory. You will build your virtual
hosts from this directory.

Following is an example of a virtual host file set up for instances
using PHP. Replace DOMAINNAME with the name of the domain for which you
want to create a virtual host.

```
server {
    server_name  www.DOMAINNAME;
    rewrite ^(.*) http://DOMAINNAME$1 permanent;
}

server {
        listen 80;
        server_name DOMAINNAME;
                root   /var/www/DOMAINNAME/htdocs;
                index index.php;
        include /etc/nginx/security;

# Logging --
access_log  /var/log/nginx/DOMAINNAME.access.log;
error_log  /var/log/nginx/DOMAINNAME.error.log notice;

        # serve static files directly
        location ~* ^.+.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt)$ {
            access_log        off;
            expires           max;
        }

        location ~ \.php$ {
        try_files $uri =404;
                fastcgi_pass unix:/var/run/php5-fpm/DOMAINNAME.socket;
                fastcgi_index index.php;
                include /etc/nginx/fastcgi_params;
        }
}
```

**Note**: Please review the PHP section of this virtual host template.
This is the first reference to using UNIX file sockets for processing
PHP.

If you want to create a virtual host without PHP, remove the PHP portion
of the previous configuration file:

```
server {
    server_name  www.DOMAINNAME;
    rewrite ^(.*) http://DOMAINNAME$1 permanent;
}

server {
        listen 80;
        server_name DOMAINNAME;
                root   /var/www/DOMAINNAME/htdocs;
                index index.php;
        include /etc/nginx/security;

# Logging --
access_log  /var/log/nginx/DOMAINNAME.access.log;
error_log  /var/log/nginx/DOMAINNAME.error.log notice;

        # serve static files directly
        location ~* ^.+.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt)$ {
            access_log        off;
            expires           max;
        }
}
```

Both virtual host files you will see that there is a line for **root
/var/www/DOMAINNAME/htdocs**. This line should point to the location
where you have placed the files that you want the virtual host file to
serve.

Now that you have configured NGINX and created your virtual hosts, you
are now ready to configure PHP-FPM.

### Next section

[Installing NGINX and PHP-FPM - Setup for PHP-FPM](/how-to/installing-nginx-and-php-fpm-setup-for-php-fpm)
