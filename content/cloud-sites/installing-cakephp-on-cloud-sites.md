---
permalink: installing-cakephp-on-cloud-sites/
audit_date:
title: Install CakePHP on Cloud Sites
type: article
created_date: '2011-03-14'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

This article will show you how to install CakePHP 1.2.x onto your site with Cloud Sites.

### Prerequisites

This article assumes you have already done the following:

-   Selected PHP as your default technology
-   Set up a MySQL database in the Classic Control Panel
-   Uploaded the CakePHP application files to your site in the content
    directory

For information on how to do this, see the following articles:

-   [How do I change my site's default
    technology?](/how-to/change-your-sites-default-technology "How do I change my site's default technology?")
-   [How do I add a MySQL database to my
    site?](/how-to/rackspace-cloud-sites-essentials-mysql-databases "How do I add a MySQL database to my site?")
-   [How do I add content to my
    website?](/how-to/getting-started-with-cloud-sites-uploading-your-content "How do I add content to my website?")

### CakePHP installation

1.  Locate the `.htaccess` file in the content directory. After
    `RewriteEngine on`, add a new line with `RewriteBase /`" to the
    `.htaccess` file and save the file back to the site. You will need
    to repeat this step for the rewrite rules in the `.htaccess` files
    in the app and app/webroot directories.
2.  Load the site in your browser. You will notice several warnings
    concerning the installation. The first warning will be the
    following:

    **Notice (1024):** Please change the value of Security.salt in
    app/config/core.php to a salt value specific to your application
    \[CORE/cake/libs/debugger.php, line 556\].

3.  Open the `app/config/core.php` file and search for `Security.salt`.
    Change its value to the characters or string you prefer, then save
    and close the file.
4.  In the app/config/directory in FTP, rename the
    `database.php.default` file to be `database.php`.
5.  Open app/config/database.php and scroll down to the bottom of the
    page to find the database connection information. Enter your
    database host name, user name, password and hostname, then save and
    close the file.
6.  Reload your site in your browser. The CakePHP installation is
    complete

If you have problems getting CakePHP to work in a subdirectory, read the
information in the following article:
<http://cookingwithcakephp.blogspot.com/2008/04/installing-cakephp-into-subdirectory.html>
