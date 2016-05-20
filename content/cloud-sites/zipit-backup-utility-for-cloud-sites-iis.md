---
permalink: zipit-backup-utility-for-cloud-sites-iis/
audit_date:
title: ZipIt Backup Utility for Cloud Sites - IIS
type: article
created_date: '2013-03-14'
created_by: Matt Costello
last_modified_date: '2014-01-22'
last_modified_by: Jered Heeschen
product: Cloud Sites
product_url: cloud-sites
---

The ASPX Zipit Backup Utility is a tool that enables users to compress
and back up data on Cloud Sites, including files and MSSQL databases.
All backups are stored on your Rackspace Cloud Files account. The
backups are done on a site-by-site basis and are initiated manually.

The ASPX Zipit Backup Utility is run from your account and does not
externally store any of your personal information such as your database
credentials or Cloud Files API key.

If you are looking for the Linux/PHP version of Zipit click here: [Zipit Backup Utility for Cloud Sites - Linux](http://zipitbackup.com)

### How it works

-   Runs on a per-site basis. The ASPX Zipit Backup Utility must be
    installed for each site you want to back up.
-   The ASPX Zipit Backup Utility backs up all Cloud Sites files and
    databases to your Cloud Files account.
-   Lists all available backups. Available backups can be managed via
    the Cloud Control Panel.

### Install Zipit Backup Utility

-   Download [this file](https://raw.github.com/onesandzeros415/ASPXZipIt-Installer/master/ASPXZipIt-Installer/ASPXZipIt-Installer.aspx) and save it to your local machine as **ASPXZipIt-Installer.aspx**.
-   Upload the ASPXZipIt-Installer.aspx file to the content folder of
    the site you want to backup.
-   Open your web browser and navigate to
    http://*yourdomain.com*/ASPXZipIt-Installer.aspx** to access the
    web interface.

  **Note:** Replace the italicized text with your actual domain name.*

-   Please make sure impersonation is enabled. Please see our [Add impersonation article](/how-to/add-impersonation-to-your-aspnet-cloud-site) for more information on enabling this.
-   Choose your .NET Framework 3.5, 4.0, or 4.5
-   Enter your preferred username/password for the ASPX Zipit
    Backup Utility.
-   Enter your Cloud Files username and API Key.

  [Click here for instructions on generating Cloud Files API Key.](/how-to/view-and-reset-your-api-key)

-   Click **Install** to begin.
-   Once install is complete you may login.
-   To backup MSSQL a temp directory named **aspxzipit_sql_bak** is
    created in your content directory.  This directory must manually be
    set to 766 permissions in order to run due to Rackspace Cloud
    Sites security.

**Note:** ASPX Zipit will only run on a site that is configured as
IIS/ASPX*

Linux sites can use the original Zipit Backup Utilty [here](http://zipitbackup.com).

GitHub Access can be found:

-  [ASPX ZipIt Installer](http://onesandzeros415.github.io/ASPXZipIt-Installer/)
-  [ASP.NET 3.5](http://onesandzeros415.github.com/ASPXZipIt-NET35/)
-  [ASP.NET 4.0](http://onesandzeros415.github.com/ASPXZipIt-NET40/)
-  [ASP.NET 4.5](http://onesandzeros415.github.com/ASPXZipIt-NET45/)

**Disclaimer**

By installing ASPX Zipit Backup Utility you agree that this feature is
an Unsupported Service (as defined herein) and you also agree to the
terms of the GPL License! See: [GPL v3](http://www.gnu.org/licenses/gpl-3.0.en.html).

If you use the tool described in this article, you agree that the tool
is an "Unsupported Service". Rackspace makes no representation or
warranty whatsoever regarding any Unsupported Service, and you agree
that Rackspace will not be liable to you for any loss or damage arising
from the provision of the Unsupported Service. The Service Level
Guaranties will not apply to the Unsupported Service, or any other
aspect of your services that are adversely affected by the Unsupported
Service. You acknowledge that Unsupported Services may not interoperate
with Rackspace's other services or other third party services you use.
