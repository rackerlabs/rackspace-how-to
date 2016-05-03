---
title: Backup replication for disaster recovery with cloud databases
type: article
created_date: '2016-04-28'
created_by: Steve Croce
last_modified_date: '2016-04-28'
last_modified_by: Steve Croce
product: Cloud Databases
product_url: cloud-databases
---

**Note:** This feature is currently an [Early Access](/how-to/rackspace-product-release-phases/) feature and is therefore subject to additional [test terms](https://www.rackspace.com/information/legal/testterms).

Cloud Databases now offers the ability to replicate database backups to other datacenters to protect against total outages in one datacenter or to more easily facilitate migration of Cloud Databases from one datacenter to another.

As of now, you can copy a single backup at a time from one datacenter to another. However, we will soon be adding the ability to add backup replication to a backup schedule, so every backup in a schedule gets automatically copied to another datacenter.

### Copy a Single Backup to Another Datacenter

Use the following steps to copy individual backups from one datacenter to another. These steps assume you already have database backups available in your cloud account. See the How-To document on [managing backups](/how-to/managing-backups-for-cloud-databases/) if you need instruction on how to create backups

1.	Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2.	At the top of the panel, select **Backups**.

3.	In the **Backups** menu, select **MySQL Backups** under **MYSQL BACKUPS**.

4.	In the list of backups, click the gear next to the backup you'd like to copy and select **Copy Backup**

	**Note:** Incremental backups can only be copied if the full backup they're related to has also been copied first. You can see if a backup is incremental by hovering over the backup name and looking at the **Type** line

5.	Select the region to copy the backup to in the dialog that appears and then click OK

6.	A message will appear at the lower right stating that the copy has been created and the backup being copied will enter the "copying" state

7.	When the copy is complete, the original backup will return to the ready state. There will be a new backup with the same name and "-copy" appended to the name in the desired region. There will also be an icon next to the new backup indicating that it is a copy.

8.	The new backup can now be used to create new instances or just as an additional backup

### Limitations

This feature is provided as an [Early Access](/how-to/rackspace-product-release-phases/) feature and therefore carries different [test terms](https://www.rackspace.com/information/legal/testterms) and additional limitations. It is not yet recommended for production use cases.

- This feature is only available in US datacenters (IAD, ORD, DFW). Copies to or from LON, SYD, or HKG are not available at this time.
- Incremental backups cannot be copied if the related full backup has not been copied
- Deletes of copied backups are currently disabled. As this feature is still [Early Access](/how-to/rackspace-product-release-phases/) and we will be continually improving it, we wanted to protect against inadvertently deleting a good backup at this time.
