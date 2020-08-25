---
permalink: set-up-an-apache-vhost-on-fedora-31/
audit_date: '2020-08-24'
title: 'Set up an Apache vhost on Fedora 31'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date: '2020-08-24'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

You can use virtual hosts (vhosts) to serve multiple domains without additional Internet Protocol (IP) addresses. With vhosts,
the different pages display according to settings in the host file for the particular site requested. This article describes
how to create a vhost on Fedora® 31.

**Note:** In this article, you can replace the placeholder of **example.com** with the domain for which you’re setting up the vhost.

### Prerequisites

- A Linux&reg; server running distribution Fedora version 31
- Apache&erg; installed. Install it by using the following command: `sudo dnf install httpd`
- DNS pointing the site to the server’s IP
- A user with SSH administrator privileges
- Firewall configured to allow traffic on port 80

### Create an Apache vhost

Use the following steps to create an Apache vhost:

1. Create a new directory to store the website’s content. This directory is known as the *root document* folder in your
   Apache vhost configuration file.

        sudo mkdir -p /var/www/vhosts/example.com/public_html

2. Set the permissions for the new directory. Replace `vhostuser` in the **username:vhostuser** parameter with a user
   on the server who has access to the directory.

        sudo chown -R username:vhostuser /var/www/vhosts/example.com/public_html

3. Set read permissions for all users for the directory.

        sudo chmod -R 755 /var/www/vhosts/

4. Open the Apache configuration file. While you use any text editor, this guide uses `vi`.

        sudo vi /etc/httpd/conf/httpd.conf

5. At the end of the file, add the following line to instruct Apache to read all files ending in **.conf** within
   the **/etc/httpd/vhost.d** directory.

        Include vhost.d/*.conf

    **Note:** After you finish making the changes, save the file by pressing the **Esc** key to switch to command mode
    and typing `:xq` to exit and save the changes.

6. Create the directory for the vhost configuration file.

        sudo mkdir /etc/httpd/vhost.d/

7. Create a default template to enable future vhosts. The following command creates and opens the new file:

        vi /etc/httpd/vhost.d/default.template

8. Open the file, paste the following information in the file, and save the change.

        <VirtualHost *:80>
          ServerName example.com
          ServerAlias www.example.com
          DocumentRoot /var/www/vhosts/example.com/public_html
          <Directory /var/www/vhosts/example.com/public_html>
                  Options Indexes FollowSymLinks MultiViews
                  AllowOverride All
          </Directory>
        CustomLog /var/log/httpd/example.com-access.log combined
        ErrorLog /var/log/httpd/example.com-error.log
          # Possible values include: debug, info, notice, warn, error, crit,
          # alert, emerg.

          LogLevel warn
        </VirtualHost>

        #<VirtualHost _default_:443>
        #        ServerName example.com
        #        DocumentRoot /var/www/vhosts/example.com/public_html
        #        <Directory /var/www/vhosts/example.com/public_html>
        #                Options Indexes FollowSymLinks MultiViews
        #                AllowOverride All
        #        </Directory>
        #        CustomLog /var/log/httpd/example.com-ssl-access.log combined
        #        ErrorLog /var/log/httpd/example.com-ssl-error.log
            # Possible values include: debug, info, notice, warn, error, crit,
            # alert, emerg.

        #        LogLevel warn
        #        SSLEngine on
        #        SSLCertificateFile    /etc/ssl/certs/example.crt
        #        SSLCertificateKeyFile /etc/ssl/certs/example.key
        #</VirtualHost>

With the template in place, you can create new vhosts as described in the following section.

### Create additional vhosts

1. Create a vhost configuration file for the new site by using the following command. Remember to replace
   **domain.com** with your own site.

        sudo cp /etc/httpd/vhost.d/default.template /etc/httpd/vhost.d/domain.com.conf

2. Open the file you previously created, **domain.com.conf**, replace **domain.com** with your site, and save the file.

3. Restart Apache.

        sudo systemctl restart httpd

4. If you want to see a test page, you can create a file named **index.html** in your root folder and paste the following text inside.

        <!DOCTYPE html>
        <html lang="en" dir="ltr">
          <head>
            <meta charset="utf-8">
            <title>vhost test for domain.com</title>
          </head>
          <body>
            <h1>Success! domain.com vhost!</h1>
          </body>
        </html>

5. Navigate to **http://domain.com/index.html** to view the test page.
