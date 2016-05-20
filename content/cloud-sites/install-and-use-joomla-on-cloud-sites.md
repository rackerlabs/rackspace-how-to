---
permalink: install-and-use-joomla-on-cloud-sites/
audit_date:
title: Install and use Joomla on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-30'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Prerequisites

-   Administrative access to the Rackspace Cloud to create domains and
    add databases
-   Joomla software from <http://www.joomla.org/download.html>
    uncompressed in a local repository
-   Ftp access to website, and a ftp client like ExpanDrive in order to
    use the ftp method of uploading files (optional)

### Procedure

-   Login to the [Cloud Sites Control Panel](http://manage.rackspacecloud.com/)
-   If you are new to Rackspace Cloud, please refer to [Adding a new website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website).
-   Navigate the **Hosting > Cloud Sites** menu to the website hyperlink
    on which Joomla needs to be installed

  **Note:** The domain must have php enabled, and database feature selected.
The database feature can be added by using the CHANGE PLAN hyperlink on
the domain **General Settings** tab.

-   Upload the Joomla files to the desired location on the website using
    FTP - Refer to [Upload content to a website using FTP](/how-to/getting-started-with-cloud-sites-uploading-your-content)
    -   To integrate Joomla to the root of domain (e.g.
        **http://example.com/**), place all contents of the unzipped Joomla
        directory (but excluding the directory itself) into the root
        directory of /web/content/.
    -   To have the Joomla installation in its own subdirectory on the
        website (e.g. **http://example.com/Joomla/**), rename the directory
        to the name of choice and place it on the web server, for e.g.
        to use a subdirectory called "Joomla", rename the directory
        called "Joomlaxxx" to "Joomla" and upload it to /web/content/.
-   Next create a new Mysql database (e.g. joomla15) with user (e.g.
    joomla15) (Refer to [Add a MySQL database to a website or domain](/how-to/rackspace-cloud-sites-essentials-mysql-databases)).
-   Note the database information a) database name b) user name c)
    password d) hostname (not localhost) for use during the
    Joomla installation.
-   With this, Cloud Sites specific steps are complete. Follow on screen
    prompts to continue the installation.
-   Run the Joomla installation script by accessing Joomla for the first
    time in your favorite web browser. (see below)
    -   If Joomla files are placed in the root directory, e.g. visit:
        http://www.example.com
    -   If Joomla is in its own sub-directory called "Joomla", e.g.
        visit: http://www.example.com/Joomla
    -   If DNS is not setup for the domain, use the Testing URL provided
        in the Cloud Sites Control Panel under the General
        Settings tab, e.g.
        visit: http://www.example.com.php5-7.dfw1-1.websitetestlink.com/Joomla.
-   Select a language and follow the on-screen prompts
-   Proceed to next step and note warning that the configuration.php
    file is not writable. (This will happen if a secondary ftp user
    uploads the files.)
-   Proceed to the next step and accept license.
-   Select "mysql" as the database type. Fill in the required
    information for database which was noted down when it was
    setup earlier.
-   Skip the FTP Configuration for now. Default is not to use the
    FTP layer. Accept it and move to next step.
-   In the Main configuration, customize the site name, specify an
    administrative password and Install sample data if needed.
-   Follow instructions to create a **configuration.php** if prompted.
-   As prompted, after installation, be sure to log in via FTP and
    delete the "installation" directory as prompted on screen by the
    Joomla Install process.
-   Note the administrative user name.
-   Access the newly installed Joomla software in your favorite web
    browser as follows:
    -   If Joomla files are placed in the root directory, e.g. visit:
        http://www.example.com
    -   If Joomla is in its own sub-directory called "Joomla", e.g.
        visit: http://www.example.com/Joomla
    -   If DNS is not setup for the domain, use the Testing URL provided
        in the Classic Cloud Control Panel under the General
        Settings tab, e.g.
        visit: http://www.example.com.php5-7.dfw1-1.websitetestlink.com/Joomla
-   Sign in as "admin" and customize site as needed

#### Additional Resources

-   >A video tutorial is available at
    <http://www.rackspace.com/cloud/cloud_hosting_demos/>
-   Add new articles using the Joomla documentation at
    <http://docs.joomla.org/>
