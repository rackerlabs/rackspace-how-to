---
node_id: 450
title: Apache configuration on Ubuntu
type: article
created_date: '2012-07-23'
created_by: Rackspace Support
last_modified_date: '2014-09-04'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Ubuntu uses a different Apache layout than you may have encountered if you have used Apache with non-Debian based Operating Systems.

The differences are not huge and, indeed, help in configuring and deploying websites.

### Assumptions

-  You have used `aptitude` to install Apache on your Ubuntu server.

To see what is in your Apache config file, run the following commands:

    cd /etc/apache2
    ls

You should see output similar to the following:

    $ cd /etc/apache2
    $ ls
    apache2.conf   envvars     mods-available   ports.conf       sites-enabled
    conf.d         httpd.conf  nods-enabled     sites-available

Next, we'll look at the following folders to see the configuration settings:

-  sites-available
-  sites-enabled
-  mods-available
-  mods-enabled

### Configuration settings

#### sites-available

Inside **sites-avilable** will be files containing the configurations for each site you want to serve. These are known as **vhosts** or **virtual hosts**.

If you look inside this folder, you should see that there is one (default) site available:

    ls sites-available/
    ...
    default    default-ssl

The Apache installation has a **default** and a **default-ssl** vhost available. When you navigated to the Cloud Servier IP address and got the "It works!" message, it was the **default** file that told Apache what to do and where the files were located.

We'll look at vhosts in more detail and create our own in a later article.

**Note:** A file in **sites-available** is not automatically active. It is simply available for serving if you enable it.

#### sites-enabled

The **sites-enabled** folder contains symlinks to the sites that you actually want to serve.

For example, you could have two vhosts configured and ready for use in the **sites-available** folder, but only one of them enabled. Only the vhost symlinked from the **site-enabled** folder would be served.

If you look inside this folder, you will see which site is currently enabled:

    ls -l sites-enabled
    ...
    lrwxrwxrwx 1 root root 26 Nov 28 22:38 000-default -> ../sites-available/default

This means that the **default** site has been enabled; the symlink named "000-default" links to the **default** file in the **sites-available** folder.

The other thing to note is the naming. It's possible for a domain to point to your Cloud Server IP address but have no site configuration file. In these cases, the first enabled site (alphabetically) will be displayed; i.e. **000-default**'s config will be used.

#### mods-available

The **mods-available** folder contains the modules that are available to be loaded.

Look inside the folder by running the following command:

    ls mods-available

A fair list is available from our base install but remember that they are not all enabled, merely available for use.

Just as with the vhosts files, any modules that we want to use must be enabled.

#### mods-enabled

The **mods-enabled** folder contains symlinks to the modules that we want enabled. Look inside the folder with the following command and compare it to the list of modules available:

    ls mods-enabled

This list is a lot shorter than the list of available modules, which means that not all of the available modules are enabled, and includes **php5.conf**, which is useful because we installed PHP5 in an earlier article.

### Enable sites

Being good sysadmins, we like to get hands on and create our vhosts, and now that we know how the symlinks work we could go ahead and run `ln -s` until all our sites are enabled.

However, there are some commands that make this process much easier.

They are `a2dissite`, `a2ensite`, `a2dismod` and `a2enmod`.

#### a2dissite

This command will delete the symlink to a site you have previously enabled.

For example, let's disable the default site:

    sudo a2dissite default

The symlink in **sites-enabled** has been deleted. You should see output similar to the following:

    Site default disabled.
    Run '/etc/init.d/apache2 reload' to activate new configuration!

Reload Apache with the following command to ensure that the site is fully disabled:

    sudo /etc/init.d/apache2 reload

When you now visit your Cloud Server IP address in a web browser, you will get a 404 Not Found message instead of the "It Works!" page.

**Note:** The main vhosts file in **sites-available** is still there. All the `a2dissite` command did was remove the symlink in the **sites-enabled** folder.

#### a2ensite

This command will reestablish the symlink to a site that was previously disabled.

Let's enable the default site again with the following command:

    sudo a2ensite default

You should see output similar to the following:

    Enabling site default.
    Run '/etc/init.d/apache2 reload' to activate new configuration!

Reload Apache with the following command to ensure that the site is enabled:

    sudo /etc/init.d/apache2 reload

If you visit your Cloud Server IP address site again, you will see that the default "It Works!" page is being served again.

#### a2dismod

This command will disable any modules you have previously enabled.

Let's disable the PHP5 module with the following command:

    sudo a2dismod php5

You should see output similar to the following:

    Module php5 disabled.
    Run '/etc/init.d/apache2 restart' to activate new configuration!

If you look in the **mods-enabled** folder, you will see that the symlinks **php5.conf** and **php5.load** have been deleted.

#### a2enmod

This command will enable any module that is in the **mods-available** folder.

Let's enable the PHP5 module by running the following command:

     sudo a2enmod php5

You should see output similar to the following:

     Enabling module php5.
     Run '/etc/init.d/apache2 restart' to activate new configuration!

If you check the **mods-enabled** folder, you will see that the **php5.conf** and **php5.load** symlinks.

**Note:** Be sure to reload Apache after each site or module change for your Cloud Servers IP address site to reflect any changes you have made.
