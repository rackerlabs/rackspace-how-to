---
permalink: setting-up-virtual-host-on-centos
audit_date:
title: Setting Up Virtual Hosts on CentOS
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Virtual hosts are used to serve multiple domains off of one server/ip address. Depending which site a user would access on the server, a different page will be displayed according to what has been set in the vhost file for that particular site. You can add as many virtual hosts as you need to your server.
This article assumes that you already have the domain you wish to use for your site pointing to your server via DNS or that you are using a local hosts file on your computer to point the domain to the server for testing purposes.
Your server would need to have Apache installed in order to achieve this. If you need to install Apache, run the following command:
sudo yum install httpd
You would need to make sure the firewall on your server is configured to allow http traffic on port 80.

Step 1:
Create a new directory:

This will create the directory where the web content for your site will be stored on the server. This is known as the Document Root location in the Apache vhost configuration file. Using -p will automatically add the parents of your new directory. You can replace domain.com in this documentation with the domain/name of your site.
sudo mkdir -p /var/www/vhosts/domain.com/public_html

Step 2:
Permissions on new directory:

We will need to change the ownership and permissions set on the directory that was created in step 1. Username would need to be replaced by the user you wish to give access to the directory.
sudo chown -R username:username /var/www/vhosts/domain.com/public_html 
The following command will allow everyone to read the files within your vhosts directory:
sudo chmod -R 755 /var/www/vhosts/

Step 3:
Creating the virtual host.

We will first need to edit the httpd.conf file.
sudo vi /etc/httpd/conf/httpd.conf
At the bottom of this file insert the following line:

Include vhost.d/*.conf

This will set apache to read all files ending in .conf within the /etc/httpd/vhost.d directory which we will create shortly.
Save and exit the configuration file.
Now we need to create the directory for the vhost conf files:
sudo mkdir /etc/httpd/vhost.d/
Now we will need to create a vhost template where we can make future virtual hosts from:
touch /etc/httpd/vhost.d/default.template

vi /etc/httpd/vhost.d/default.template

Within this file you will need to insert the following:
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
 
We will now need to save and exit this file.

We can now start creating vhost files within the /etc/httpd/vhost.d directory:
sudo cp /etc/httpd/vhost.d/default.template /etc/httpd/vhost.d/domain.com.conf

You can now customise your newly created vhost conf file according to the domain name you are wanting to use.
sudo vi /etc/httpd/vhost.d/domain.com.conf
Once you have configured the file according to your needs, you can then save and exit the file.
 
Step 4:
All set! We just need to restart apache by running the following command:
sudo service httpd restart
You should see something like the following example:

Stopping httpd:                                                                                                [  OK  ]
Starting httpd: httpd: Could not reliably determine the server's fully qualified                                                                              domain name, using 0000:0000:0000:0000:0000:0000:0000:0000 for ServerName                                                                                                                    
                                                                                                               [  OK  ]
This is just a warning which can be ignored.
Your virtual host is now setup and ready to use. You will need to upload your webcontent to the DocumentRoot directory that you have created on your server and this will now be served when navigating to your domain name from your browser.viii) Add firewall policy to communicate to allow traffic between the two private subnets
ix)Once every thing, navigate to VPN --> Monitor --> IPsec Monitor .  There status should be UP
