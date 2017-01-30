---
permalink: set-up-wordpress-multisite-with-cloud-sites/
audit_date:
title: Set up WordPress Multisite with Cloud Sites
type: article
created_date: '2014-04-29'
created_by: Thomas Hester
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

WordPress Multisite, which prior to version 3.0 of WordPress was known
as WordPress MultiUser (MU), enables you to manage multiple WordPress
sites from a single networked WordPress control panel. All of these
sites use the same database, themes, plug-ins and file structure to keep
everything localized to a single installation. You can deploy sites
quickly with the same plug-ins, themes, and template as other sites. As
a result, sites are easier to manage and you have more control over site
content.

This article explains how to set up WordPress Multisite by leveraging
Cloud Sites and Cloud Databases.

**Note:** For scalability reasons, this article assumes the use of a
Cloud Databases instance to better manage the connections. Database
instances range in price, but the recommended starting memory size is 1
GB.

### Set up a Cloud Databases instance and install WordPress

#### Set up a Cloud Databases instance

Set up a Cloud Databases instance that meets the following criteria:

-   Located in the same data center as the Cloud Sites account
-   1 GB of memory (which can later be increased if needed)

The disk space depends on the size of the database, taking into account
that it might grow over time. For more information about setting up a
Cloud Databases instance, review the following articles:

-   [Getting started with Cloud Databases](/how-to/cloud-databases)
-   [Using Cloud Databases with your Cloud Site](/how-to/using-cloud-databases-with-your-cloud-site)


#### Install WordPress

Install WordPress on a Cloud Sites website.  This site is the primary
domain you will be hosting on WordPress Multisite, and it will serve as
the Network Admin and main page. For more information about adding a
site to your Cloud Sites control panel and installing WordPress, see the
following articles:

-   [Getting started with Cloud Sites: How to add a new website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website)
-   [Installing WordPress on Cloud Sites](/how-to/installing-wordpress-on-cloud-sites)

**Note:** For this specific installation, we do not recommend the use of
the one-click installer.

### Configure WordPress

#### Adjust the WordPress address URL

In the WordPress Administration console, go to **Settings** and change
the **WordPress Address** (**URL**) value to use
**http://*yourDomain***. Remove the **www** from the URL if it's not
already set this way. For example: **http://example.com**.

#### Allow WordPress Multisite in wp-config.php

1.  In the root WordPress installation directory, locate the
    **wp-config.php** file and open it in a text editor.
2.  Locate the line /\* That's all, stop editing! Happy blogging. \*/.
3.  Above that line, add the following line:

        define( 'WP_ALLOW_MULTISITE', true );

#### Set up the Multisite network

1.  In WordPress, go to the admin area, click the **Tools** menu, and
    then click **Network Setup**.

    **Note:** If you are unable to see the Network Setup option, ensure
    that the **wp-config.php** file has been set to allow WordPress
    Multisite, as described in the previous step.

2.  Under **Addresses of Sites in your Network**, select
    the **Subdomains** value if you plan to use domain mapping for
    multiple URLs. This will make managing the urls easier.
     - Under **Addresses of Sites in your Network**, select
        the **Subdomains** value if you plan to use domain mapping for
        multiple URLs. This will make managing the urls easier.
     - Under **Network Details**, enter values for the **Network
       Title** and **Network Admin Email** address.
3.  Click **Install**.

#### Establish the network

1.  In the **pathToYourSite/web/content** folder, open
    the **wp-config.php** file.
2.  Locate the line `\* That's all, stop editing! Happy blogging. \*/`
3.  Above the line, add the following lines:

        define ('MULTISITE', true);
        define ('SUBDOMAIN_INSTALL', true);
        define ('DOMAIN_CURRENT_SITE', 'wpmumainsite.com');
        define ('PATH_CURRENT_SITE', '/');
        define ('SITE_ID_CURRENT_SITE', 1);
        define ('BLOG_ID_CURRENT_SITE', 1);

4.  Add the following to your **.htaccess** file in
    **/PATH/TO/YOUR/SITE/web/content**, replacing other WordPress rules.
    Keep in mind that this may differ if you use sub-directories
    for the network instead of subdomains:

        RewriteEngine On
        RewriteBase /
        RewriteRule ^index\.php$ - [L]

        # add a trailing slash to /wp-admin
        RewriteRule ^wp-admin$ wp-admin/ [R=301,L]

        RewriteCond %{REQUEST_FILENAME} -f [OR]
        RewriteCond %{REQUEST_FILENAME} -d
        RewriteRule ^ - [L]
        RewriteRule ^(wp-(content|admin|includes).*) $1 [L]
        RewriteRule ^(.*\.php)$ wp/$1 [L]
        RewriteRule . index.php [L]

    **Note**: If you do not have an **.htaccess** file, you can create a file called **.htaccess** by
    using an FTP client such as Filezilla. For more information about
    **.htaccess** files, see [Rackspace Cloud Essentials 5 - Tips and Tricks for .htaccess and web.config](/how-to/rackspace-cloud-essentials-tips-and-tricks-for-htaccess-and-webconfig).

5.  Add the following block of rules to your **.htaccess** file to force the
    pages to redirect to non-www versions of the domain:

        RewriteEngine On
        RewriteBase /
        RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
        RewriteRule ^(.*)$ http://%1/$1 [R=301,L]

6.  Log out of the WordPress Administration console, and then log
    back in.

**Note:** Because of the way Cloud Sites works, each site that you need
to have managed by the main Multisite installation must be created as an
*alias*. The aliased domain, added through the [Cloud Sites Control Panel](https://manage.rackspacecloud.com/), must have the primary
Multisite domain as its target.  For more information about how to add
an alias, see [Getting Started With Cloud Sites - Creating Sub-domains and/or Domain Aliases](/how-to/getting-started-with-cloud-sites-creating-sub-domains-andor-domain-aliases).

If you want to map full domains to your multisite entries rather than
using subdomains or subfolders in the URL, continue to the next
section.

#### Install the WordPress MU Domain Mapping plug-in

After you log back in to the WordPress Administration console, install
the WordPress MU Domain Mapping plug-in, as follows:

1.  Go to **My Sites > Network Admin > Plugins**.

2.  Click the **Add New** button.

3.  Search for **WordPress MU Domain Mapping**.

4.  Click **Install Now**.

5.  Activate the plug-in by clicking **Network Activate**.

#### Configure the Domain Mapping plug-in

1.  Copy the
    **../wp-content/plugins/wordpress-mu-domain-mapping/sunrise.php** file
    to the **wp-content/** folder.

2.  In the **wp-config.php** file, insert the following line above the
    /\* That's all, stop editing! Happy blogging. \*/  line:

        define( 'SUNRISE', 'on' );

3.  In the WordPress Administration console, click **Settings &gt;
    Domain Mapping**.

4.  Set the **Server IP Address** value to the current site's IP
    address.

    **Note:** You can find the site's IP address in the Cloud Sites
    Control Panel, on the **General Settings** tab or the **DNS** tab
    (for SSL-enabled sites).

5.  Under **Domain Options**, select only the check boxes for 'Permanent
    redirect (better for your blogger's pagerank)' and 'User domain mapping
    page'. Ensure that the other check boxes are clear and then click **Save**.

### Add sites to the WordPress network

The final step in this process is to add sites to your WordPress
network. To do so, perform the following steps:

The **Edit Site** page opens. In the address bar, the URL should look
similar to
**http://wpmumainsite.com/wp-admin/network/site-info.php?id=2**.

1.  In the WordPress Administration console, click **My Sites > Network Admin > Sites**.
2.  Click **Add New**.
3.  Enter the information for the site that you want to add to
    the network.
4.  Click **Add Site**.
5.  Go back to the **Sites** list by clicking on **Sites > All Sites** in the left navigation pane.
6.  From the list, click the site you just added.
7.  Note the number that follows after **?id=**. This is the site's
    **ID** number, and you will need it in the next steps.
8.  In the navigation pane, click on **Settings > Domains**.
9.  Under **New Domain**, in the **Site ID** field enter the number that
    you obtained from the URL.
10. Clear the **Primary** check box.
11. Click **Save**.

    **Note**: It is necessary to use the domain without the **www**.
    If you are using a subdomain, use only the subdomain (for example,
    **subdomain.domain.com**).

Repeat the steps from this [section](#Add sites to the WordPress network) for
any other sites that you want to add to the WordPress Multisite network.
Remember to add your alias.

You can make adjustments, such as using www instead of non-www. This
change, however, will require a different URL rewrite in the
**.htaccess** file to force to www versions, which will then cause any
subdomains to not map correctly because using www with subdomains does
not work in Cloud Sites.
