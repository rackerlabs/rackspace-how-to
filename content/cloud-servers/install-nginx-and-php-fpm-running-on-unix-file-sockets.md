---
permalink: install-nginx-and-php-fpm-running-on-unix-file-sockets/
audit_date:
title: Install NGINX and PHP-FPM running on UNIX file sockets
type: article
created_date: '2012-03-12'
created_by: Kevin Carter
last_modified_date: '2016-06-30'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to install NGINX and PHP-FPM while running on UNIX file sockets for your Debian-based system.

- Set up the server
- Install source repositories
- Install NGINX and PHP-FPM
- Set up NGINX
- Set up PHP-FPM

**Note:** Rackspace Cloud Managed Infrastructure does not support NGINX, PHP-FPM, or any other server applications at this time.

### Set up the server

The steps in this article were performed on a Rackspace Cloud Servers instance with the following specifications:

- Debian 6 operating system
- 256 MB RAM
- 10 GB disk space

**Note:** The information in this article is specifically for Debian. You could use it in a Red Hat Enterprise Linux OS setup by making a few changes to the placement of the files that you are modifying and the repositories that you are using. And although the article uses repositories for easy installation, if you are a Gentoo or Arch Linux user, you could compile your services from source.

After you provision the server and log in to it, perform all necessary patching. To do this in Debian, enter the following commands:

    apt-get update
    apt-get dist-upgrade
    reboot

After the updates are done, you can restart the server, which ensures that the updates have been installed and initialized completely.

### Install source repositories

You can get the source from NGINX or add the NGINX repositories to your system. For more information, see [NGINX repositories](http://wiki.nginx.org/Install).

These instructions use the [Debian backports](http://backports-master.debian.org/Instructions/) as the repository for NGINX. This repo allows for an easy configuration and allows you to install a more up-to-date version of NGINX on your system while giving you a more supported application for your environment.

1. Add the Debian backports to your repositories by running the following command:

       echo 'deb http://backports.debian.org/debian-backports squeeze-backports main' >> /etc/apt/sources.list.d/backports.list

2. Add the Dotdeb repositories to your system by running the following commands:

       echo 'deb http://packages.dotdeb.org stable all' >> /etc/apt/sources.list.d/DotDeb.list
       echo 'deb-src http://packages.dotdeb.org stable all' >> /etc/apt/sources.list.d/DotDeb.list
       wget http://www.dotdeb.org/dotdeb.gpg
       cat dotdeb.gpg | sudo apt-key add -
       rm dotdeb.gpg

3. Update your sources by running the following command:   

       apt-get update

### Install NGINX and PHP-FPM

1.	To install NGINX and PHP-FPM on your Debian system, run the following command:

          apt-get -t squeeze-backports install nginx-extras; apt-get install php5 php5-fpm php5-common php5-curl php5-dev php5-gd php5-imagick php5-mcrypt php5-memcache php5-mysql php5-pspell php5-snmp php5-sqlite php5-xmlrpc php5-xsl php-pear libssh2-php php5-cli

2.	Run the following command to create a system user for NGINX with no home directory. You will use this user later in the setup.

          adduser --system --no-create-home nginx

Now you can set up NGINX and PHP-FPM to work on your system.

### Set up NGINX

NGINX enables you to change the outlook on your web application from complexity to simplicity. If you have been using Apache, NGINX might be confusing to you, but you will see some familiar directives and directives that you might recognize. For more information about NGINX, see the [NGINX wiki](http://wiki.nginx.org/Main).

#### Set up NGINX configuration files

To set up NGINX, you must change the following configuration files, which are located in the **/etc/nginx/** directory:

- **nginx.conf**
- **fastcgi params**

If you want to use NGINX in your deployment of a virtual host, you can also add the following files:

- **security**
- **mail.conf**

Before you change the configuration files, we recommend that you back up the original configuration files by using the following command:

    tar -czf ~/NGINX_Config.tar.gz nginx.conf fastcgi_params

##### nginx.conf

Following is an example of how you can change your nginx.conf file. The file contains two include parameters in the # Virtual Host Configs area, which allow you to have a separate configuration file directory and a separate virtual host file directory. Although these parameters are not necessary, they simplify the deployment of virtual hosts.

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

NGINX can accommodate a single long configuration file, similar to an Apache **httpd.conf** file. Although you can modify the file to fit the needs of your particular environment, we recommend that you use the configuration shown in the example because this configuration works for most production systems.

##### fastcgi params

Use the following parameters in your fastcgi params file:

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

##### Security

Although it is not required, adding a security file to your **/etc/nginx** directory simplifies the deployment of a virtual host with NGINX.

Use the following parameters in the security file:

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

##### mail.conf

The **mail.conf** file is a strictly optional file for those who want to use NGINX as a high-performance mail proxy server. It contains mail directives typically found in the **nginx.conf** file.

If you chose to include **mail.conf** in your NGINX configuration, place the file in the **/etc/nginx/conf.d/** directory.

Use the following parameters in your **mail.conf** file:

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

Note how each directive is commented out. If you want to change your NGINX configuration for a high-performance mail proxy server, uncomment the preceding directives by deleting every # symbol.

#### Set up virtual hosts

After you have completed your NGINX configuration, you can set up your virtual hosts. In Debian, the following subdirectories under the **/etc/nginx/** directory pertain to virtual hosts:

- **sites-available**, where you house your virtual hosts
- **sites-enabled**, where your virtual hosts live after they are active

These subdirectories function in much the same way as their Apache equivalents. The **sites-available** directory contains a virtual host configuration file. You can either copy or symlink the file from one place to the other.

1. To symlink a virtual host configuration file from one directory to another, enter the following command:

        ln -s /etc/nginx/sites-available/THE.VIRTUAL.HOST.FILENAME /etc/nginx/sites-enabled/THE.VIRTUAL.HOST.FILENAME

2. Navigate to the **/etc/nginx/sites-available/** directory, from which you will build your virtual hosts.

3. Use the following example virtual host file setup for instances that use PHP. Replace `DOMAINNAME` with the name of the domain for which you want to create a virtual host.

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

      **Note:** Review the PHP section of this virtual host template. This is the first reference to using UNIX file sockets for processing PHP.

4. To create a virtual host without PHP, remove the PHP portion of the previous configuration file:

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

Both virtual host files contain the line root `/var/www/DOMAINNAME/htdocs`. This line should point to the location where you have placed the files that you want the virtual host file to serve.

Now that you have set up NGINX and created your virtual hosts, you are ready to set up PHP-FPM.

### Set up PHP-FPM

The steps in this section explain how to add pool information to the PHP-FPM setup that you previously completed.

When you entered the command to install PHP-FPM, the system created a default configuration for PHP-FPM. This default configuration might have included a directory for your sockets to reside in while they are active. If it did not, you must create this directory.

In the following example, the sockets are placed in the **/var/run/php5-fpm/** directory.

1. Use the following command to create the directory:

        mkdir -p /var/run/php5-fpm/

    Sockets automatically spawn in this directory if you are using the virtual host setup and PHP-FPM pool template provided. No more action is required on your part.

2. To complete the setup, move to the **/etc/php5/fpm/pool.d/** directory, where you will set up the different UNIX sockets on which PHP-FPM will function.

    **Note:** For your system to function properly, you must create a new pool for every virtual host that you set up.

    The pool files should follow this naming convention: `YOURDOMAIN.conf`

3. Use the following template for the pool files. Replace all instances of `DOMAINNAME` with your domain name.

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
