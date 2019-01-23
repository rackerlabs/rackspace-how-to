---
permalink: configuring-vhosts-on-a-lamp-stack
audit_date:
title: Configuring vhosts on a LAMP Stack
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
Whether you’re hosting a single site, or dozens of sites on your new LAMP server, I recommend setting up vhosts to help efficiently organize your sites.
Your LAMP server is already configured to serve content directly out of the /var/www/html directory.
/var/www  
├── html  
│   └── index.html  
└── vhosts
The existing index.html file is the standard apache test page. You can immediately serve content by replacing the existing file with your own site files. Alternatively, you can remove that content, and created some vhosts to serve one or more sites. This is my recommended course of action.
### Configuring vhosts

In Ubuntu, each vhost has its own separate configuration file, and is then “enabled” in Apache. Our LAMP Stack has a template that we can change to create new vhost configuration files for each site you need to host. We’ll use a program called “sed” to do a bulk find and replace operation in the template, and then copy the new version to a new file. You can follow the directions below.
Note: change “yoursitename.com” to the actual site name/domain you’ll be using. We recommend using the top level domain - i.e. .com - as many customers host .com, .net, etc on one server.
example.com is the actual default site name in the default.template file.
# move to the sites-available folder.  
$ cd /etc/apache2/sites-available

# replace every instance of "example.com"  
# with "yoursitename.com"  
# This first command just tests the output:  
$ sed -e 's/example.com/yoursitename.com/' default.template

# This command writes the changes to a new  
# vhost for this file.  If everything above looks ok, execute this command:  
$ sed -e 's/example.com/yoursitename.com/' default.template > yoursitename.com.conf

# make sure that the file was written with  
# the proper project name  
$ cat yoursitename.com.conf

# add the project to the list of available  
# sites in the apache configuration file  
$ a2ensite yoursitename.com.conf

# create the directory for the site.  
# The vhost we made previously will  
# know to look in this directory  
$ mkdir -p /var/www/vhosts/yoursitename.com

# Repeat for any additional vhosts

# test the configuration  
# we're looking for "Syntax OK" in the response.  
$ apache2ctl configtest

# This will restart apache and finalize the config.  
$ apache2ctl restart
### Example

I’m creating sites for 3 customers, one of which has a completely different mobile site. For my example, I would execute the following commands to create the vhosts:
$ cd /etc/apache2/sites-available  
$ sed -e 's/example.com/site1.com/' default.template > site1.com.conf
$ sed -e 's/example.com/site2.com/' default.template > site2.com.conf
$ sed -e 's/example.com/site3.com/' default.template > site3.com.conf
$ sed -e 's/example.com/mobile.site3.com/' default.template > mobile.site3.com.conf
$ a2ensite site1.com.confsite2.com.confsite3.com.confmobile.site3.com.conf
$ mkdir -p /var/www/vhosts/site1.com /var/www/vhosts/site2.com /var/www/vhosts/site3.com /var/www/vhosts/mobile.site3.com  
$ apache2ctl configtest  
$ apache2ctl restart
You’ll probably get a warning message similar to: “apache2: Could not reliably determine the server’s fully qualified domain name.” This can be ignored for now. Now, we have 4 sites enabled - meaning apache can serve HTTP requests to these 4 sites - and 4 vhosts to act as the document roots.
/var/www/  
├── html  
│   └── index.html  
└── vhosts  
    ├── mobile.site3.com  
    ├── site1.com  
    ├── site2.com  
    ├── site3.com
Each directory underneath the vhosts directory is a “document root” for the listed site. As HTTP requests come into the server, Apache determines which domain the request is for, then routes the request to the appropriate document root, as specified in the vhosts configuration file.
