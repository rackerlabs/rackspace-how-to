---
permalink: replicate-backup-for-disaster-recovery-with-cloud-databases/
title: Replicate backups for disaster recovery with Cloud Databases
type: article
created_date: '2016-04-28'
created_by: Steve Croce
last_modified_date: '2016-07-27'
last_modified_by: Kyle Laffoon
product: Cloud Databases
product_url: cloud-databases
---

**Note:** This feature is currently an [Early Access](/how-to/rackspace-product-release-phases/) feature and is therefore subject to additional [test terms](https://www.rackspace.com/information/legal/testterms).

Cloud Databases now offers the ability to replicate database backups to other regions. Replicating database backups can protect against total outages in one region or more easily facilitate migration of Cloud Databases from one region to another.

Currently, you can copy a single backup at a time from one region to another. In the future, we will add the ability to add backup replication to a backup schedule, so every backup in a schedule gets automatically copied to another region.

Each backup copy costs the same as the original backup: by size of backup in Cloud Files at [standard Cloud Files rates](https://www.rackspace.com/en-us/cloud/public-pricing#cloud-files)

### Copy a single backup to another region

Use the following steps to copy individual backups from one region to another. These steps assume that you already have database backups available in your cloud account. For instructions on how to create backups, see [Managing Backups for Cloud Databases](/how-to/managing-backups-for-cloud-databases/).

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. At the top of the panel, select **Backups > MySQL Backups**.

3. In the list of backups, click the gear icon next to the backup you want to copy and select **Copy Backup**.

     **Note:** You can copy incremental backups only if the full backup to which it is related has been copied first. You can see whether a backup is incremental by hovering the mouse pointer over the backup name and looking at the **Backup Type** line.

4. In the popup dialog box, select the region to copy the backup to, and then click **Copy Backup**.

     **Note:** This feature is avialable only in US regions (IAD, ORD, and DFW).

A message appears at the lower right stating that the copy has been created and the backup being copied is entering the **Copying** state.

When the copy is complete, the original backup returns to the ready state, and a new backup with the same name and **-copy** appended to the name is now located in the desingated region. An icon next to the new backup indicates that it is a copy.

You can now use the copied backup to create new instances or just as an additional backup.

### Limitations

This feature is provided as an [EA](/how-to/rackspace-product-release-phases/) feature and therefore carries different [test terms](https://www.rackspace.com/information/legal/testterms) and additional limitations. It is not yet recommended for production use cases.

- This feature is available only in US regions (IAD, ORD, and DFW). Copies to or from the LON, SYD, or HKG regions are not available at this time.
- Incremental backups can be copied only if the related full backup has been copied.
- You cannot delete a copied backup. Because this feature is still [EA](/how-to/rackspace-product-release-phases/) and we will be continually improving it, we want to protect against inadvertently deleting a good backup at this time.
