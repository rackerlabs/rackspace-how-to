---
permalink: zipit-backup-utility-for-cloud-sites-linux/
audit_date:
title: Zipit Backup Utility for Cloud Sites - Linux
type: article
created_date: '2012-05-14'
created_by: Jereme Hancock
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

The Zipit Backup Utility is a tool that enables users to compress and
back up data on Cloud Sites, including files and mysql databases. All
backups are stored on your Rackspace Cloud Files account. The backups
are done on a site-by-site basis and are initiated manually. There is
also an option for setting up automated backups utilizing a Cloud
Site's Scheduled Task (cronjob).

The Zipit Backup Utility is run from your account and does not
externally store any of your personal information such as your database
credentials or Cloud Files API key.

For a more streamlined tool just for scheduled backups, see [this article on the Cron Backup Utility](/how-to/scheduled-backup-cloud-sites-to-cloud-files).

If you are looking for the IIS/ASP version of Zipit click here: [Zipit Backup Utility for Cloud Sites - IIS](http://www.aspxzipitbackup.com/).

### How it works

-   Runs on a per-site basis. The Zipit Backup Utility must be installed
    for each site you want to back up.
-   The Zipit Backup Utility backs up all Cloud Sites files and
    databases to your Cloud Files account.
-   Lists all available backups. Available backups can be managed via
    the Cloud Control Panel.
-   The Zipit Utility works for sites/database up to 4gb
    once compressed.

### Install Zipit Backup Utility

-   Download [this file](https://raw.github.com/jeremehancock/zipit-backup-utility-installer/master/zipit-install.php) and save it to your local machine as **zipit-install.php**.
-   Upload the **zipit-install.php** file to the content folder of the site
    you want to backup.
-   Open your web browser and navigate to
    http://*yourdomain.com*/zipit-install.php to access the
    web interface.

   **Note**: Replace the italicized text with your actual domain name.

-   Enter your preferred username/password for the Zipit Backup Utility.
-   Enter your Cloud Files username and API Key.

  [Click here for instructions on generating Cloud Files API Key.](/how-to/view-and-reset-your-api-key)

-   Click **Install** to begin.

The following animation provides an overview of the Zipit Backup Utility features:

<img src="{% asset_path cloud-sites/zipit-backup-utility-for-cloud-sites-linux/zipit_1.gif %}" alt="" />

**Note:** Zipit will only run on a site that is configured as
Linux/PHP

There is an IIS port of Zipit for sites that are configured for
IIS/ASP. Instructions for using it can be found
[here](http://aspxzipitbackup.com/).

**Disclaimer**

By installing Zipit Backup Utility you agree that this feature is
an Unsupported Service (as defined herein) and you also agree to the
terms of the GPL License. See: [GPL v3](http://www.gnu.org/licenses/gpl-3.0.en.html).

If you use the tool described in this article, you agree that the tool is an unsupported service. Rackspace
makes no representation or warranty whatsoever regarding any Unsupported
Service, and you agree that Rackspace will not be liable to you for any
loss or damage arising from the provision of the Unsupported Service.
The Service Level Guaranties will not apply to the Unsupported Service,
or any other aspect of your services that are adversely affected by the
Unsupported Service. You acknowledge that Unsupported Services may not
interoperate with Rackspace's other services or other third party
services you use.
