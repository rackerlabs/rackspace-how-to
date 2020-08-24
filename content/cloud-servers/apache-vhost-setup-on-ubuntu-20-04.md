---
permalink: apache-vhost-setup-on-ubuntu-20-04-and-debian-10/
audit_date: '2020-08-24'
title: 'Apache vhost Setup on Ubuntu 20.04 and Debian 10'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date: '2020-08-24'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

Vhost stands for virtual host. Vhosts are used to serve multiple domains without the need for additional Internet Protocol (IP) addresses. With vhosts, the different pages are displayed according to what has been set in the host file for the particular site requested. This article provides instructions for creating vhosts on Ubuntu® 20.04 and Debian 10.

  **Note:** In this article, we’ll be using the placeholder of **example.com**, but you’d want to replace this with whatever domain you’re setting your vhost up for.

### Prerequisites

- A Linux&reg; server running distribution Ubuntu version 20.04 or Debian version 10
- Apache installed (which can be installed using command: `sudo apt install apache2`)
- DNS pointing the site to the server’s IP
- A user with SSH administrator privileges
- Firewall configured to allow traffic on port 80

1. Create a new directory that will be used to store the website’s content. This is known as the root document folder in your Apache vhost configuration file.

        sudo mkdir -p /var/www/vhosts/example.com/public_html

2. Set the permissions for the new directory. Replace vhostuser in username:vhostuser with a user on the server with access to the directory.

        sudo chown -R username:vhostuser /var/www/vhosts/example.com/public_html

3. Set also read permissions to all users for the directory.

        sudo chmod -R 755 /var/www/vhosts/

4. Create the configuration file for the vhost site.

        vi /etc/apache2/sites-available/example.com.conf

5. Paste the following text into the file you’ve created. Replace the example.com with your own site hostname.

        ServerName example.com
        ServerAlias www.example.com
        ServerAdmin admin@example.com
        DocumentRoot /var/www/vhosts/example.com/public_html

        <Directory /var/www/vhosts/example.com/public_html>
            Options -Indexes +FollowSymLinks
            AllowOverride All
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/example.com-error.log
        CustomLog ${APACHE_LOG_DIR}/example.com-access.log combined

    **Note:** Once you’re finished making the changes, save the file pressing the **Esc** key to switch to command mode and typing `:xq` to exit and save changes on the text editor.

6. Create a symbolic link from the virtual host file to the sites-enabled directory to enable the new virtual host file using the a2ensite command.

        sudo a2ensite domain.com

7. Check for issues. If you get a response which reads: **Syntax OK** we can continue.

        sudo apachectl configtest

8. Restart Apache.

        sudo systemctl restart apache2

9. If you want to see a test page, you can create file named **index.html** in your root folder.

        vi index.html

10. Paste the following text.

        <html lang="en" dir="ltr">
          <head>
            <meta charset="utf-8">
            <title>vhost test for example.com</title>
          </head>
          <body>
            <h1>Success! example.com vhost!</h1>
          </body>
        </html>

11. Save and exit the file

        :xq

12. Navigate to **http://example.com/index.html** to view the test page.
