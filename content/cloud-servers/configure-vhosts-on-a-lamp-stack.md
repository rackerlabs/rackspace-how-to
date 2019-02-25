---
permalink: configure-vhosts-on-a-lamp-stack/
audit_date: '2019-02-01'
title: Configure vhosts on a LAMP stack
type: article
created_date: '2019-02-01'
created_by: Rackspace Community
last_modified_date: '2019-02-04'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

Whether you host a single site, or dozens of sites on your new Linux&reg; Apache&reg; MySQL&reg; PHP&reg; (LAMP) server, virtual hosts (vhosts) help you efficiently organize your sites.

In the following example, the LAMP server is already configured to serve content directly from the **/var/www/html** directory in the example below:

    /var/www
    ├── html
    │   └── index.html
    └── vhosts

The existing **index.html** file is the standard Apache test page. You can immediately serve content by replacing the existing file with your own site files. Alternatively, you can serve one or more sites by using vhosts. Your LAMP stack contains a template that you can modify to create new vhost configuration files for each site that you need to host.

### How to configure vhosts

**Note:** In Ubuntu&reg;, each vhost has its own separate configuration file, and is then enabled in Apache.

Use the following instructions to configure your vhosts:

**Note:** Replace _yoursitename.com_ in the instructions below with your actual site or domain name. We recommend that you use the top-level domain such as .com, .net, and so on on one server.

1. Navigate to the **sites-available** folder by using the following command:

    `$ cd /etc/apache2/sites-available`

2. Find and replace the default site name, example.com, in the **default.template** file by using the `sed` stream editor and the following commands:

    1. Test the output by using the following command:

        `$ sed -e 's/example.com/yoursitename.com/' default.template`

    2. Write the changes to a new vhost for this file by using the following command:  

        `$ sed -e 's/example.com/yoursitename.com/' default.template > yoursitename.com.conf`

    3. Verify that the file was written with the proper project name by using the following command:

        `$ cat yoursitename.com.conf`

3. Add the project to the list of available sites in the Apache configuration file by using the following command:

    `$ a2ensite yoursitename.com.conf`

4. Create the directory for your site by using the following command:

    `$ mkdir -p /var/www/vhosts/yoursitename.com`

    **Note:** The vhost that you made previously is configured to look in this directory.

5. Repeat steps 1 - 4 to add additional vhosts.


### Test your vhost configuration

This test should produce a response of `Syntax OK`. Test the configuration by using the following command:

    `$ apache2ctl configtest`

Restart Apache to finalize the configuration change by using the following command:

    `$ apache2ctl restart`

### Vhost configuration example

In this example, you create sites for three customers, one of which is a completely different mobile site.

You configure the vhosts for all three customers by using the following command sequence:

        $ cd /etc/apache2/sites-available
        $ sed -e 's/example.com/site1.com/' default.template > site1.com.conf
        $ sed -e 's/example.com/site2.com/' default.template > site2.com.conf
        $ sed -e 's/example.com/site3.com/' default.template > site3.com.conf
        $ sed -e 's/example.com/mobile.site3.com/' default.template > mobile.site3.com.conf
        $ a2ensite site1.com.confsite2.com.confsite3.com.confmobile.site3.com.conf
        $ mkdir -p /var/www/vhosts/site1.com /var/www/vhosts/site2.com /var/www/vhosts/site3.com /var/www/vhosts/mobile.site3.com
        $ apache2ctl configtest
        $ apache2ctl restart
        /var/www/
        ├── html
        │   └── index.html
        └── vhosts
            ├── mobile.site3.com
            ├── site1.com
            ├── site2.com
            ├── site3.com

Each directory below the vhosts directory is a _document root_ for the listed site. A document root is a directory that is stored on your host's servers and that is designated for holding web pages. As HTTP requests come into the server, Apache determines which domain the request is for, then routes the request to the appropriate document root, as specified in the vhosts configuration file.


