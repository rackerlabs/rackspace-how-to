---
permalink: apache-configuration-on-ubuntu/
audit_date: '2016-06-21'
title: Configure Apache on Ubuntu
type: article
created_date: '2012-07-23'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Ubuntu uses a different Apache layout than is used in non-Debian based operating systems. The differences are small, but helpful in configuring and deploying websites. This article explains some of the site and module configuration settings for Apache on Ubuntu, and describes how to enable and disable sites and modules as needed.

### Before you begin

Use `aptitude` to install Apache on your Ubuntu server.

The advantage of using `aptitude` is that you will get any security updates from Ubuntu (if and when distributed) and dependencies are automatically installed.

### View the configuration file

To view the contents of the Apache configuration file, run the following commands:

    $ cd /etc/apache2
    $ ls

The output should look as follows:

    apache2.conf   envvars     mods-available   ports.conf       sites-enabled
    conf.d         httpd.conf  mods-enabled     sites-available

### Configuration settings

This section explains the configuration settings in the following folders:

-  sites-available
-  sites-enabled
-  mods-available
-  mods-enabled

#### sites-available

The **sites-available** folder contains the configurations for each site that you
want to serve. These are known as **virtual hosts**, or **vhosts**.

If you look inside this folder, you should see that there is one (default) site available:

    $ ls sites-available/
    ...
    default    default-ssl

The Apache installation has a **default** and a **default-ssl** vhost available. When you
navigate to the IP address of your cloud server and get the "It works!" message, the
**default** file is telling Apache what to do and where the files were located.

**Note:** A file in the **sites-available** folder is not automatically active. It is simply available
for serving if you enable it.

#### sites-enabled

The **sites-enabled** folder contains symlinks to the sites that you are actually serving.

For example, you could have two vhosts configured and ready for use in the **sites-available**
folder, but only the vhost that has a symlink from the **site-enabled** folder is being served.

If you look inside this folder, you see which site is currently enabled:

    $ ls -l sites-enabled
    ...
    lrwxrwxrwx 1 root root 26 Nov 28 22:38 000-default -> ../sites-available/default

This result shows that the **default** site is enabled. The symlink named **000-default**
links to the **default** file in the **sites-available** folder.

**Note:** A domain can point to your cloud
server's IP address but have no site configuration file. In such a case, the first enabled
site (alphabetically) is displayed. For example, the configuration for **000-default** would be used.

#### mods-available

The **mods-available** folder contains the modules that are available to be loaded.

Look inside the folder by running the following command:

    $ ls mods-available

A list of modules is available from the base installation but they are not all enabled, just available for use. Just as with the vhosts files, any modules that you want to use must be enabled.

#### mods-enabled

The **mods-enabled** folder contains symlinks to the modules that are enabled.

Use the following command to look inside the folder:

    $ ls mods-enabled

This resulting list is much shorter than the list of available modules, and it includes enabled modules such as **php5.conf**.

### Enable sites and modules

You can use the commands in this section to enable and disable sites and modules.

#### a2dissite

The `a2dissite` command deletes the symlink to a site that you have previously enabled.

For example, to disable the **default** site, run the following command:

    $ sudo a2dissite default

The symlink to the **default** site in the **sites-enabled** folder is deleted. You should see output similar to the following output:

    Site default disabled.
    Run '/etc/init.d/apache2 reload' to activate new configuration!

Reload Apache with the following command to ensure that the site is fully disabled:

    $ sudo /etc/init.d/apache2 reload

When you now visit your cloud server's IP address in a web browser, you will get a `404 Not
Found` message instead of the "It Works!" page.

**Note:** The main vhosts file in the **sites-available** folder still exists. The `a2dissite`
command just removed the symlink to it in the **sites-enabled** folder.

#### a2ensite

The `a2ensite` command establishes a symlink to a site that is not already enabled.

Enable the default site with the following command:

    $ sudo a2ensite default

You should see output similar to the following output:

    Enabling site default.
    Run '/etc/init.d/apache2 reload' to activate new configuration!

Reload Apache with the following command to ensure that the site is enabled:

    $ sudo /etc/init.d/apache2 reload

If you visit your cloud server's IP address site in a web browser, you will see that the default
"It Works!" page is being served.

#### a2dismod

The `a2dismod` command disables any modules you have previously enabled.

For example, disable the PHP5 module with the following command:

    $ sudo a2dismod php5

You should see output similar to the following output:

    Module php5 disabled.
    Run '/etc/init.d/apache2 restart' to activate new configuration!

If you look in the **mods-enabled** folder, you will see that the **php5.conf**
and **php5.load** symlinks have been deleted.

**Note:** Be sure to reload Apache after each module change for your cloud server's IP address to reflect any changes that you have made.

#### a2enmod

The `a2enmod` command enables any module that is in the **mods-available** folder.

For example, enable the PHP5 module by running the following command:

     $ sudo a2enmod php5

You should see output similar to the following output:

     Enabling module php5.
     Run '/etc/init.d/apache2 restart' to activate new configuration!

If you check the **mods-enabled** folder, you will see the **php5.conf** and
**php5.load** symlinks.

**Note:** Be sure to reload Apache after each module change for your cloud server's
IP address to reflect any changes that you have made.
