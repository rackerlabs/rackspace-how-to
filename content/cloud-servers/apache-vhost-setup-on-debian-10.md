---
permalink: apache-vhost-setup-on-debian-10/
audit_date:
title: 'Apache vhost Setup on Debian 10'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

A vhost stands for virtual host. Vhosts are used to serve multiple domains without the need for additional Internet Protocol (IP) addresses. With vhosts, the different pages are displayed according to what has been set in the host file for the particular site requested. With vhosts, you can add as many sites as you need to your server without needing additional IP addresses. This article provides instructions for creating vhosts on Debian® 10 specifically.

In this article, we’ll be using the placeholder of ‘domain.com’, but you’d want to replace this with whatever domain you’re setting your vhost up for.

###Prerequisites:
• Cloud Server
• Apache installed (sudo apt install apache2)
• DNS pointing the site to the server’s IP
• SSH Access to the server
• Firewall configured to allow traffic on port 80

1) The first step is to create a new directory. This directory will be used to store the website’s content. This is known as the Document Root in your Apache vhost configuration file. Using the -p flag in the command will automatically add the parents of your new directory. Create the directory with the command shown below:

sudo mkdir -p /var/www/vhosts/domain.com/public_html
2) Now you need to set the permissions for the new directory. Replace vhostuser in username:vhostuser from our example below, with the user on your server that should have access to the new directory. The command is as follows:

sudo chown -R username:vhostuser /var/www/vhosts/domain.com/public_html
Users will also need read access to the directory, so be sure to update the permissions with the command shown here:

sudo chmod -R 755 /var/www/vhosts/
4) Now that we have permissions taken care of and our Document Root setup, we need to create the configuration file for our vhost site. Create the following file and open it using the command below:

vi /etc/apache2/sites-available/domain.com.conf
Paste the following into the file you’ve created, be sure to replace the domain.com examples with your own site hostname:

<VirtualHost *:80>
    ServerName domain.com
    ServerAlias www.domain.com
    ServerAdmin admin@domain.com
    DocumentRoot /var/www/vhosts/domain.com/public_html

    <Directory /var/www/vhosts/domain.com/public_html>
        Options -Indexes +FollowSymLinks
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/domain.com-error.log
    CustomLog ${APACHE_LOG_DIR}/domain.com-access.log combined
</VirtualHost>
Once you’re finished making the changes, save the file.

5) Now that our vhost configuration file is in place, we need to enable the new virtual host file. To do this, we have to create a symbolic link from the virtual host file to the sites-enabled directory which will be read by Apache during it’s startup. There are a few ways to do this, but the easiest and quickest is to use the a2ensite command as seen below:

sudo a2ensite domain.com
6) Once you’ve enabled the site, it’s always best to check for any issues. You can do this by running the following command to test your configuration:

sudo apachectl configtest
If you get a response which reads: “Syntax OK”, this indicates that our vhost is setup and ready for use. So, the final change would be to restart Apache by issuing the following command:

sudo systemctl restart apache2
Now your site should be working as intended. However, in order for anything to be displayed when navigating to the site, you’ll need to add content to the Directory Root that we created back in Step 1. If you just want to see a test page, you can place the following in an file called ‘index.html’ in your Document Root:

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
