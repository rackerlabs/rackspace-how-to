---
permalink: set-up-virtual-hosts-on-centos/
audit_date: '2019-02-14'
title: Set up virtual hosts on CentOS
type: article
created_date: '2019-01-18'
created_by: Rackspace Community 
last_modified_date: '2019-02-14'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

Virtual hosts (vhosts) are used to serve multiple domains by using a single server or Internet Protocol (IP) address. Different pages are displayed according to what has been set in the host file for that particular site. You can add as many virtual hosts as you need to your server. This article provides instructions for creating vhosts on CentOS&reg; specifically.

**Note:** Replace any instance of `domain.com` in this article with the domain name of your site.

### Vhost configuration prerequisites for CentOS

This article assumes that you have configured the Domain Name Services (DNS) for your domain to point to your site or that you are using a local hosts file on your computer to point the domain to the server for testing purposes.

Your server must have Apache&reg; installed in order to configure vhosts. Install Apache by running the following command:

    sudo yum install httpd

**Note:** Verify the firewall on your server is configured to allow HTTP traffic on port 80.

#### Create a vhost directory on CentOS

1. Create a new directory by using the following command:

       sudo mkdir -p /var/www/vhosts/domain.com/public_html

   This directory is used to store the web content for your site. This is known as the **Document Root** location in the Apache `vhost` configuration file. Using `-p` automatically adds the parents of your new directory.

2. Set the necessary permissions on the new directory by using the following command:

       sudo chown -R username:vhostuser /var/www/vhosts/domain.com/public_html

  **Note:** Replace `vhostuser` in `username:vhostuser` with the user that should have access to the new directory.

  Grant read access to everyone for the files within your vhosts directory by using the following:

    sudo chmod -R 755 /var/www/vhosts/

### Configure the virtual host file

1. Open the **httpd.conf** file in the `vi` text editor by using the following command:

       sudo vi /etc/httpd/conf/httpd.conf

2. Insert the following line at the end of the file:

      `Include vhost.d/*.conf`

   This action sets Apache to read all files ending in **.conf** within the **/etc/httpd/vhost.d** directory.

3. Save and exit the configuration file.

4. Create the directory for the vhost configuration files by using the following command:

       sudo mkdir /etc/httpd/vhost.d/

5. Create a vhost template from which you can make future virtual hosts by using the following command:

       touch /etc/httpd/vhost.d/default.template

6. Open the **default.template** file in `vi` by using the following command:

       vi /etc/httpd/vhost.d/default.template

7. Insert the following code within the **/etc/httpd/vhost.d/default.template** file:

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

8. Save the changes to the file and exit `vi`.

### Create the vhost file and restart the Apache service

1. Create the vhost file within the **/etc/httpd/vhost.d** directory by using the following command:

       sudo cp /etc/httpd/vhost.d/default.template /etc/httpd/vhost.d/domain.com.conf

2. Open the **domain.com.conf** file in `vi` by using the following command:

       sudo vi /etc/httpd/vhost.d/domain.com.conf

3. Save the changes to the file and exit `vi`.

4. Restart Apache by running the following command:

       sudo service httpd restart

   You receive the following message:

        Stopping httpd:                                                                                                [OK]
        Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using 0000:0000:0000:0000:0000:0000:0000:0000 for ServerName
                                                                                                                       [OK]
This is a default warning that you can ignore.

Your virtual host is now set up and ready to use. You must upload web content to the **DocumentRoot** directory that you have created on your server to have content served when you navigate to your domain name using a browser.


