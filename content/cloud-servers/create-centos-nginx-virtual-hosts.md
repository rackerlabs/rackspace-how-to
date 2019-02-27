---
permalink: create-centos-nginx-virtual-hosts/
audit_date: '2019-01-23'
title: Create CentOS NGINX virtual hosts
type: article
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: '2019-01-29'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to create NGINX&reg; virtual hosts that serve
multiple web domains.

### Create the layout for each domain

This example creates two domains, `domain1.com` and `domain2.com`.

Because the default permissions only enable you, the `demo` user, to browse
your home folder, you need to grant NGINX access to this folder as well by
running the following command:

    chmod 755 /home/demo

You can now create the basic layout for each domain. In your `home` directory,
create a `public_html` folder by running the following command:

    mkdir /home/demo/public_html

For each domain that you want to host, create a folder with a standard set of
subfolders, as shown in the following examples:

    mkdir -p /home/demo/public_html/domain1.com/{public,private,,backup}

    mkdir -p /home/demo/public_html/domain2.com/{public,private,log,backup}

These commands create the folders `public`, `private`, `log`, and `backup` for
each of your domains.log

### Add public content for the website at domain1.com

This example creates a very simple HTML file in the public folder
that enables you to quickly check that the virtual host works.

Run the following command to add content for `domain1.com`:

    nano /home/demo/public_html/domain1.com/public/index.html

Enter code that is similar to the following example into the file:

    <html>
      <head>
        <title>domain1.com</title>
      </head>

      <body>
        <h1>domain1.com</h1>
      </body>
    </html>

Repeat the process so that you have a similar HTML index file for `domain2.com`.

**Note**: Ensure that you change the content in the **index.html** file to
show `domain2.com` and not `domain1.com`.

### Virtual hosts layout

This article uses a CentOS&reg;-style layout (that uses a `conf.d` directory
to store your configuration files) when creating the virtual hosts. You
might also have this layout if you installed NGINX by using the
package manager or from source.

### Add your virtual hosts to the virtual file

Edit the virtual file to add `domain1.com` by running the following command:

    sudo nano /etc/nginx/conf.d/virtual.conf

**Note**: Ensure that you adjust the path according to your installation.

If you are installing from source, you need to enter the following path:

    sudo nano /usr/local/nginx/conf/conf.d/virtual.conf

Add the following code to the file:

    server {

                listen   80;
                server_name  www.domain1.com;
                rewrite ^/(.*) http://domain1.com/$1 permanent;

               }


    server {

                listen   80;
                server_name domain1.com;

                access_log /home/demo/public_html/domain1.com/log/access.log;
                error_log /home/demo/public_html/domain1.com/log/error.log;

                location / {

                            root   /home/demo/public_html/domain1.com/public/;
                            index  index.html;

                            }

                }

The first server module in the file is a simple rewrite rule that redirects
visitors to `domain1.com` from `www.domain1.com`.

The second server module has very basic information, including the
`server_name`, which is the domain name that you want to serve.

Then, the code defines the log locations so that you can easily find them.
Finally, it sets the server root and the index file.

### Reload NGINX

To enable your site, reload NGINX by running the following command:

    sudo /etc/init.d/nginx reload

### View your website

Navigate to your domain by pasting the following URL into your web browser's
navigation bar:

**http://www.domain1.com**

You should see a simple test web page that displays the information in the
**index.html** file.

### Check the logs

In a previous step, you added code to the **virtual.conf** file that configured the
locations of the logs. Run the following commands to check that there are now
logs in that location:

    ls /home/demo/public_html/domain1.com/log/
    ...
    access.log  error.log

### Repeat for additional domains

Repeat the same process for your next virtual host, `domain2.com`.
