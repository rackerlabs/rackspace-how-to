---
permalink: use-updraftplus-to-back-up-cloud-sites-to-cloud-files/
audit_date:
title: Use UpdraftPlus to back up Cloud Sites to Cloud Files
type: article
created_date: '2013-06-14'
created_by: Kyle Laffoon
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

UpdraftPlus is a WordPress plugin that gives users the ability to
automatically back up their sites to Cloud Files. UpdraftPlus saves the
backup files as standard (non-proprietary) zip files and the database
into an ordinary SQL (text) file. This method simplifies the recovery of
files and makes the backup files available through standard tools.
Simpler recovery means less site downtime or data loss in the event of a
system issue or security incident.

### Setting up the UpdraftPlus plugin

1.  Log in to your WordPress site.
2.  In the WordPress sidebar, click **Plugins** and select **Add New**.
3.  In the search box, type "UpdraftPlus backup" and select **Install
    Now**.
4.  Click **Activate Plugin**.
5.  From the Plugin section, scroll down to **UpdraftPlus - Backup/Restore** and select **Settings**.
6.  Scroll down to Copying Your Backup To Remote Storage and from the
    drop-down menu select **Rackspace Cloud Files**.
7.  Enter your Rackspace user name, API key, and the name of the
    container in which you want to place your backups. (For information
    about finding your API key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).)
8.  Select the blue button labeled **Test Cloud Files Settings**.
9.  Confirm the following message is displayed:

        Settings test result: Success: We accessed the container, and were able to create files within it.

10. Scroll to the bottom of the page and click **Save Changes**.
11. Begin backing up your website to your Cloud Files by clicking the
    **Backup Now** button.

### Restoring files from UpdraftPlus

1.  Click the **Restore** button and then click the blue **Restore** button to
    the right of the date you want to restore.
2.  In the resulting page, check the boxes next to the items you want to
    restore and click the **Restore** button at the bottom of the page.
