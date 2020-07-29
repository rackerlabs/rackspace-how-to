---
permalink: apache-vhost-setup-on-fedora-31/
audit_date:
title: 'Apache vhost Setup on Fedora 31'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

A vhost stands for virtual host. Vhosts are used to serve multiple domains without the need for additional Internet Protocol (IP) addresses. With vhosts, the different pages are displayed according to what has been set in the host file for the particular site requested. With vhosts, you can add as many sites as you need to your server without needing additional IP addresses. This article provides instructions for creating vhosts on Fedora® 31 specifically.

In this article, we’ll be using the placeholder of ‘domain.com’, but you’d want to replace this with whatever domain you’re setting your vhost up for.

###Prerequisites:
• Cloud Server
• Apache installed (sudo dnf install httpd)
• DNS pointing the site to the server’s IP
• SSH Access to the server
• Firewall configured to allow traffic on port 80

1) The first step is to create a new directory. This directory will be used to store the website’s content. This is known as the Document Root in your Apache vhost configuration file. Using the -p flag in the command will automatically add the parents of your new directory. 

Create the directory with the command shown below:

sudo mkdir -p /var/www/vhosts/domain.com/public_html

2) Now you need to set the permissions for the new directory. Replace vhostuser in username:vhostuser from our example below, with the user on your server that should have access to the new directory. The command is as follows:

sudo chown -R username:vhostuser /var/www/vhosts/domain.com/public_html
Users will also need read access to the directory, so be sure to update the permissions with the command shown here:

sudo chmod -R 755 /var/www/vhosts/

3) Next we will need to open the Apache configuration file. You can open and edit it with whichever text editor you are comfortable with, for this guide we will use ‘vi’

sudo vi /etc/httpd/conf/httpd.conf
At the end of the file, add the following line and save your change:

Include vhost.d/*.conf
This line tells Apache to read all files ending in .conf within the /etc/httpd/vhost.d directory.


4) Now that we have that line added in, we need to create the directory for the vhost configuration file. Execute the following command to create this directory.

sudo mkdir /etc/httpd/vhost.d/

5) Next we will create a default template which will allow us to make additional vhosts more easily in the future. The following command creates and opens our new file:

vi /etc/httpd/vhost.d/default.template

6) Now that we’ve created the file and have it open, we need to drop the actual vhost configuration into the file. Paste the following into the file and save the change:

<VirtualHost *:80>
  ServerName domain.com
  ServerAlias www.domain.com
  DocumentRoot /var/www/vhosts/domain.com/public_html
  <Directory /var/www/vhosts/domain.com/public_html>
           Options Indexes FollowSymLinks MultiViews
           AllowOverride All
   </Directory>
CustomLog /var/log/httpd/domain.com-access.log combined
ErrorLog /var/log/httpd/domain.com-error.log
   # Possible values include: debug, info, notice, warn, error, crit,
   # alert, emerg.

   LogLevel warn
</VirtualHost>

#<VirtualHost _default_:443>
#        ServerName example.com
#        DocumentRoot /var/www/vhosts/domain.com/public_html
#        <Directory /var/www/vhosts/domain.com/public_html>
#                Options Indexes FollowSymLinks MultiViews
#                AllowOverride All
#        </Directory>
#        CustomLog /var/log/httpd/example.com-ssl-access.log combined
#        ErrorLog /var/log/httpd/example.com-ssl-error.log
     # Possible values include: debug, info, notice, warn, error, crit,
     # alert, emerg.

#        LogLevel warn
#        SSLEngine on
#        SSLCertificateFile    /etc/ssl/certs/domain.crt
#        SSLCertificateKeyFile /etc/ssl/certs/domain.key
#</VirtualHost>

7) Now that we have our template in place, we can easily create new vhosts using the following steps. First, create a vhost configuration file for our site using the following command, remember to replace domain.com with your own site:

sudo cp /etc/httpd/vhost.d/default.template /etc/httpd/vhost.d/domain.com.conf

8) Now open the new file we created called domain.com.conf and change the mentions of domain.com within the file to your site’s name. Once you’ve made those changes, save the file.

9) Now we need to restart apache. using the following command:

sudo systemctl restart httpd

In order for anything to be displayed, you’ll need to add content to the Directory Root that we created back in Step 1. If you just want to see a test page, you can place the following in an file called ‘index.html’ in your Document Root:

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
