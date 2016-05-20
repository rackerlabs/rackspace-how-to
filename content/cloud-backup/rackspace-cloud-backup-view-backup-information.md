---
permalink: rackspace-cloud-backup-view-backup-information/
audit_date:
title: View backup information with Cloud Backup
type: article
created_date: '2012-08-22'
created_by: David Hendler
last_modified_date: '2016-04-11'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

**Previous section:** [Create a backup](/how-to/rackspace-cloud-backup-create-a-backup).

This article describes how to confirm your backup settings, ensure that a cleanup or restore action finished successfully, manually start a job before it's scheduled, and quickly view all of your backup activity at once.

### View information for a single backup

In the [Cloud Control Panel](https://mycloud.rackspace.com), click **Backups > Backups** in the top navigation bar.

The list of all the backup processes that you currently have on your account is displayed.

<img alt="" height="170" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/1842-2039-IMG-1.png" width="476" />

The list of backups has three columns: Name, System, and Last Run. You can sort by each column by clicking its title.

If you have a long list of backups, you can search for the one that you want in the **Search** box.

To view the settings for a particular backup, click its name in the list of backups. The backup details page is displayed.

<img alt="" height="379" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/1842-2039-IMG-2.png" width="474" />

-  The Configuration Details section displays the configuration details for the backup.

-  The Activity list displays all the actions that a backup has performed (such as Backup, Cleanup, and Restore) listed historically. The most recent actions are at the top of the list.

  If the list of activities is long, you can limit the list by performing a search. Enter your search term in the **Search** box. You can search with the following terms:

    - Backup
    - Restore
    - Cleanup (Fail, Complete, Skipped)

View the details of a backup's activity by clicking **View Details** in its entry.

You can also view the server details by clicking the name of the server, or you can redisplay the backup details page by clicking the backup's name in the activity entry.

**Note:** If you do not want to wait for the next scheduled backup, you can trigger a manual backup by clicking the **Perform Backup** button in the Activity section.

### View information for all backups

You can view the backup activity for all of your systems by selecting the **Backups > Activity** from the top navigation bar of the control panel. The Activity list displays all the actions that the backups have performed (such as Backup, Cleanup, and Restore) listed historically. The most recent actions are at the  top.

<img alt="" height="323" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/1842-2039-IMG-3.png" width="666" />

If the list of activities is long, you can limit your list by performing a search. Enter your search term in the Search box. You can
search by the following terms:

- Backup
- Restore
- Cleanup
- [Backup Name]
- [System Name]
- Fail, Complete, Skipped

You can view the details of a backup's activity by clicking **View Details** in its entry.

You can also view the server details by clicking the name of the server, or you can display the details page for the backup by clicking the backup's name in the activity entry.

**Next steps:** [Cloud Backup actions](/how-to/rackspace-cloud-backup-backup-actions)
