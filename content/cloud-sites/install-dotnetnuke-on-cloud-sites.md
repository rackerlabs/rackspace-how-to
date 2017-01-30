---
permalink: install-dotnetnuke-on-cloud-sites/
audit_date:
title: Install DotNetNuke on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** When adding the website, please ensure the website is created
under yourself or the company and not a client in your control panel;
you should select *You (Account Name)* from the drop-down menu when
creating new DotNetNuke site.

This article will show you how to install DotNetNuke (DNN) Version:
05.05.01 onto your site with The Rackspace Cloud.

**Note:** This article assumes you have already selected Windows/IIS as your default
technology, you have already setup a SQL database in the control panel
and have uploaded the DotNetNuke application files to your site.

Please see the following articles on how you change your default
technology, add a MSSQL database, and connect to FTP:

-   [Change your site's default technology](/how-to/change-your-sites-default-technology)
-   [Add a MSSQL database to your site](/how-to/rackspace-cloud-sites-essentials-mssql-databases)
-   [Getting started with Cloud Sites - FTP/SSHFS/FTP clients](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients)

### Before You Begin

In your **web.config** file:

-   Add impersonation: [Add impersonation to your ASP.NET site](/how-to/add-impersonation-to-your-aspnet-cloud-site)
-   Set customErrors to "Off", which is case-sensitive

### Installing DNN 5.0

1.  Open your browser and visit your URL.
2.  The DNN installation wizard will now load. Select your installation
    method and language type and click on the **Next** button.

    **Note:** This article will cover the "Typical" install in English.
3.  DNN will now automatically check to see if permissions are
    properly set. All checks should complete successfully
    before proceeding. Should any fail, please verify your permissions.
    Click on the **Next Step** button.
4.  This page will now set up your database connection. For **Select
    Database**, choose "SQL Server 2008 Database." Enter the hostname for
    your database for the **Server** field. Enter your database name in
    the **Database** field. Make sure to uncheck the box for **Integrated
    Security**. Enter your database username and password into the
    appropriate fields.
5.  Enter an Object Qualifier, like 'dnn' for example.
6.  Click on the **Next** button and DNN will begin creating the database.
    Once you see "Installation of Database Complete," click on the
    **Next** button. Please see the note at the bottom of this article if
    you begin to receive an "undefined success" error.
7.  You will now configure the Host user for DNN. Fill out the fields
    with the appropriate information. Once finished, click on the
    **Next** button.
8.  You will now configure the Portal Administrator user and your
    site properties. Enter the appropriate properties and click on the
    **Next** button to complete the installation.

You have now completed the DNN installation. You may continue, using the
**Finished (Go to Site)** button, or go back to a previous step using
**Previous**.

**Note:** In the event that you get an "undefined success" error message as
part of the database installation procedure, you can use the following
suggestions:

-   Allow the installer to continue to scroll through the error messages
    for several minutes to ensure that all of the database tables have
    been added.
-   Use your back button to return to the beginning of the installation
    and select "Automatic" installation. Because the database tables
    already exist, the installer will skip this step and
    complete successfully.
-   If all other attempts fail to correct error, you can wipe out your
    database and start again fresh to ensure no data was added. Follow
    this link for those instructions:
    <http://xman892.blogspot.com/2006/04/how-to-drop-all-tables-from.html>

If you have any questions concerning this article, please contact
support.
