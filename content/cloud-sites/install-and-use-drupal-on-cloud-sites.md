---
permalink: install-and-use-drupal-on-cloud-sites/
audit_date:
title: Install And Use Drupal on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-30'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

**Note:**  It's possible to use an easy one-click install process with
Drupal on Cloud Sites instead of the instructions below. For more
details, please [see this blog post](http://www.rackspace.com/blog/install-drupal-and-joomla-on-rackspace-cloud-sites-with-one-click/).

### Prerequisites

-   Administrative access to the Rackspace Cloud to create domains and
    add databases
-   Latest Drupal version from <http://drupal.org/> uncompressed in a
    local repository.
-   ftp access to website, and a ftp client like ExpanDrive

### Procedure

-   Login to the [Cloud Sites Control Panel](http://manage.rackspacecloud.com/pages/Login.jsp%7C "http://manage.rackspacecloud.com/pages/Login.jsp|")
-   If you are new to Rackspace Cloud, please refer to [Adding a new website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website)
-   Navigate the **Hosting > Cloud Sites** menu to the website hyperlink
    on which Drupal is to be installed.

  **Note:** The domain must have php enabled, and database feature selected. The database feature can be added by using the CHANGE PLAN hyperlink on the domain **General Settings** tab.

-   Upload Drupal files from the local repository to the desired
    location on the website using FTP - Refer to [Upload content to a website using FTP](/how-to/getting-started-with-cloud-sites-uploading-your-content)
    -   To integrate Drupal to the root of domain (e.g.
        **http://example.com/**), place all contents of the unzipped Drupal
        directory (but excluding the directory itself) into the root
        directory of web/content.
    -   To have the Drupal installation in its own subdirectory on the
        website (e.g. **http://example.com/info/**), rename the directory
        drupal to the name of choice and place it on the web server,
        for e.g. for drupal in a subdirectory called "info", rename the
        directory called "drupal-xx" to "info" and upload it
        to /web/content/.
-   Next create a new Mysql database (e.g. `<prefix>_drupal62`) with
    user (e.g. `<prefix>_drupal62`) (Refer to [Add a MySQL database to a website or domain](/how-to/rackspace-cloud-sites-essentials-mysql-databases)).
-   Note the database information a) database name b) user name c)
    password d) hostname (not localhost) for use during the
    Drupal installation.
-   With this, Cloud Sites specific steps are complete. We can get
    started with the installation of Drupal.
-   Duplicate/copy *default.settings.php* to *settings.php* in the
    /sites/default and ensure write permissions on *settings.php*
-   Visit the index page of the website, e.g. visit:
    http://www.example.com/info
    -   If DNS is not setup for the domain, use the Testing URL, e.g.
        visit: http://www.example.com.php5-7.dfw1-1.websitetestlink.com/info.
        The installation page will show up.
-   Follow on screen prompts to continue the installation.
-   Select the language to complete the install and run the application.
-   Make any necessary changes after the install script has checked
    permissions on the /sites/default directory.
-   Enter database connection information by clicking on the Advanced
    Options link and changing the Database Host field from "localhost"
    to the appropriate database hostname. Drupal will now create the
    required tables for the site's database.
-   Provide details concerning the site and admin account. Click the
    **Save & Continue** button.
-   After the installation completes, revert permissions on the
    /sites/default directory and configuration file back to 755 for
    security purposes if needed.
-   To use "clean URLs" through mod_rewrite, modify Drupal's
    .htaccess file. After "RewriteEngine on," ensure there is a
    "RewriteBase /" on the next line. If the Drupal install is in a
    sub-directory, then include the subdirectory e.g.
    "RewriteBase /info".
-   Drupal is fully functional and the software can now be accessed
    based on where it was installed
    -   If Drupal files are placed in the root directory, e.g. visit:
        http://www.example.com
    -   If Drupal is in its own subdirectory called info, e.g. visit:
        http://www.example.com/info
    -   If DNS is not setup for the domain, visit the Testing
        URL provided in the Classic Cloud Control Panel under then
        General Settings tab, e.g.
        http://www.example.com.php5-7.dfw1-1.websitetestlink.com/info
-   Sign in as the administrator and customize site as needed.
-   For better performance and to reduce use of compute Cloud Sites
    compute cycles, turn on normal caching.

### Additional Resources

-   Add new content using the Drupal help and documentation at
    <http://drupal.org/handbooks>
-   Learn how to set up cron jobs at <http://drupal.org/node/565408>
