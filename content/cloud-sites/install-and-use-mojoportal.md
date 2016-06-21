---
permalink: install-and-use-mojoportal/
audit_date:
title: Install and use mojoPortal
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Prerequisites

-   Administrative access to the Rackspace Cloud to create domains and
    add databases
-   Latest mojoPortal release version uncompressed in a local repository
-   Ftp access to website, and a ftp client like ExpanDrive

### Procedure

1. Review the mojoPortal Installation reference
   <http://www.mojoportal.com/installation-quick-start.aspx>
2. Log in to the [Cloud Sites Control Panel](http://manage.rackspacecloud.com/pages/Login.jsp%7C)
   If you are new to Rackspace Cloud, please refer to [Adding a new website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website)
3. Navigate the **Hosting > Cloud Sites** menu to the website hyperlink
    on which mojoPortal is to be installed.

    **Note:** The domain must have .Net and Asp technology Feature enabled,
    and database Feature selected. The database feature can be added by
    using the CHANGE PLAN hyperlink on the domain **General Settings** tab.

4. Upload the uncompressed files from the local repository to the
   desired location on the website using FTP - Refer to [Upload content to a website using FTP](/how-to/getting-started-with-cloud-sites-uploading-your-content).

    **Note**: You must be the primary ftp user name for the account.

5. Create a new MSSQL database (Refer to [Add a MSSQL database to a website or domain](/how-to/rackspace-cloud-sites-essentials-mysql-databases)).
6. Note the database information a) database name b) user name c)
   password d) hostname (not localhost) for use during the mojoPortal
   installation.

With the previous steps complete, the Cloud Sites specific steps are complete.
Use the following steps to complete the installation of mojoPortal.

**Note**: Only applications that run under **Medium Trust** can function
on the Rackspace Cloud. This is for security reasons in a hosting
environment.

1. Copy the file **Web.mediumtrust.config** to file **Web.config** in the
    /web/content/ directory
2. Modify the **Web.config** file to add the Impersonate directive. Refer
   to [Add impersonation to your ASP.NET site](/how-to/add-impersonation-to-your-aspnet-cloud-site).
3. Copy the file **user.config.sample** to **user.config** in the
   /web/content/ directory. Modify the connection string with MSSQL
   database information noted during the preparation phase.
   Example following.

        <add key="MSSQLConnectionString" value="server=mssql0804.wc1\inst2;UID=3xxxx_mojo;PWD=XXXX;database=3xxxx_mojo" />

4. Verify that logging is turned on if needed. Refer to [Enable logging for a website](/how-to/enabling-raw-logging-for-a-cloud-sites-website)
5. Confirm that mojoPortal is fully functional and can be accessed with the
   domain URL. e.g. visit: http://asp.example.com
    -   If DNS is not setup for the domain, visit the Testing
        URL provided in the Classic Cloud Control Panel under the
        **General Settings** tab,
        e.g. http://asp.example.com.asp1-7.dfw1-1.websitetestlink.com
