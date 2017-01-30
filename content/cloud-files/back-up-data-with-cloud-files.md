---
permalink: back-up-data-with-cloud-files/
audit_date:
title: Back up data with Cloud Files
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-04-14'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

Follow the steps in this article to set up your own data backup to your Cloud
Files service.

**Note:** If you would like for us to provide Cloud Backup as a service,
see <http://www.rackspace.com/cloud/backup> for information.

### Prepare to back up

Before you use Cloud files to back up your data, perform the following
steps to prepare your data:

1.  Create a backup plan, identifying critical resources and
    necessary frequency.

2.  Collect all the critical resources (backup data) in a secure local
    location or directory with any needed subdirectories.

3.  *(Optional)* Compress the content of the backup directory with
    security and encryption.

    This optional step saves storage and bandwidth costs and
    increases security.

### Back up your data

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2.  At the top of the window, click **Storage > Files**.

3.  On the Cloud Files page, click **Create Container**.

4.  In the popup dialog box, name the new container, select the region
    and type, and then click **Create Container**.

    For more information about selecting a region for your backup files,
    see [Multi-region support in Cloud Files](/how-to/multi-region-support-in-cloud-files).

5.  *(Optional)* If you want to create a folder to group your uploaded
    files, perform the following steps:

    1.  On the Containers page, click **Create Folder**.

    2.  In the popup dialog box, name the folder and then click **Create
        Folder**.

    3.  To add files in the folder, click the folder name to open the
        folder before completing the following step.

6.  Individually upload the backup data files that you created in step 2
    of the Prepare to back up section to the container, as follows:

    1.  On the Containers page, click **Upload Files**.

    2.  Select the files and then click **Open**.

  Your files are uploaded to the container.

### Next steps

1.  Update your backup records with the current date as the date of the
    last backup.

2.  Perform the next backup (that is, upload files to Cloud Files)
    according to the backup plan that you created.
