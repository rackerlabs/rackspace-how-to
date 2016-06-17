---
permalink: scheduled-backups-for-cloud-databases/
audit_date:
title: Scheduled backups for Cloud Databases
type: article
created_date: '2015-11-02'
created_by: Rackspace Support
last_modified_date: '2016-06-13'
last_modified_by: Kyle Laffoon
product: Cloud Databases
product_url: cloud-databases
---

Scheduled backups for Cloud Databases enable you to schedule periodic
backups of their single instances, replica sets, and high availability (HA) instance groups.
You define a day of the week when a full backup is performed on
your selected instance type, and optionally specify the hour
and minute when full and incremental backups are performed.

The schedule runs every day at the assigned time, creating daily
incremental backups, except for the specified day of the week when the
full backup task is performed. All backups are stored in Cloud Files
and are charged the standard Cloud Files storage fees.

This feature is supported for datastore versions MySQL 5.6, Percona 5.6,
and MariaDB 10 or later.

### Features

Scheduled backups provide the following features:

- Incremental backups are performed daily, except for the day of the full backup.
- Automated backups for HA instance groups use the HA instance ID as a reference, and the backup process uses the most up-to-date slave node as a source.
- You define the number of full automated backups to retain.
- You can run the backup process immediately through the client or API by setting the `run now` option.

### Pricing

Scheduled backups are priced exactly the same as On-Demand backups. They're charged based on amount of storage used at the [standard Cloud Files rates](https://www.rackspace.com/en-us/cloud/public-pricing#cloud-files). Those charges are incurred as long as the backups exist, so even if you delete the instance, you may still be charged for the backups if they are not individually deleted.

### Scheduling backups by using the Control Panel

You can enable, modify, and delete scheduled backups by using the Cloud Control Panel.

#### Create a scheduled backup

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. At the top of the panel, select **Databases > MySQL**.

3. In the list of instances, click the gear icon next to the instance for which you want to create a schedule and select **Schedule Backup**.

4. In the pop-up dialog box that appears, select the day of the week for the full backup, specify a time of day to run the daily backups, and specify how many full backups to retain. If you do not specify a time, a random time is selected.

5. Click **Create Schedule**.
   A message appears at the bottom of the panel that says `Created schedule for instanceName`.

#### View and modify a scheduled backup

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. At the top of the panel, select **Databases > MySQL**.

3. Click the name of the instance for which you want to view or modify a backup schedule.
   **Note:** On the instance details page, the schedule is displayed next to **Scheduled Backups**.

4. To edit the schedule, click the **Edit** link.

#### Delete a scheduled backup

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. At the top of the panel, select **Databases > MySQL**.

3. Click the name of the instance for which you want to delete a backup schedule.

   On the instance details page, the schedule is displayed next to **Scheduled Backups**.

4. To delete the schedule, click the **Delete** link.

### Scheduling backups by using the API

You can enable, modify, and delete scheduled backups through the API by using the API operations described in the
[Cloud Databases API Reference](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#scheduled-backups).

The following table provides a brief overview of the scheduled backup API operations.

Name | Method | URI  | Description
--- | --- | --- | ---
Create scheduled backup | `POST` | `/{version}/{accountId}/schedules` | Creates a schedule for running a backup periodically for a single instance or HA group
List scheduled backups  | `GET` | `/{version}/{accountId}/schedules` | Lists all the scheduled backups for the specified account
Show scheduled backup details | `GET`  |`/{version}/{accountId}/schedules/{scheduleId}`| Shows details of the specified scheduled backup
Update scheduled backup | `PUT`  |`/{version}/{accountId}/schedules/{scheduleId}`| Updates the specified scheduled backup
Delete scheduled backup |`DELETE`|`/{version}/{accountId}/schedules/{scheduleId}`| Deletes the specified scheduled backup                                                        

The following table lists the required and optional attributes for these operations.

Attribute name | Description | Required?
----|----|----
`action` | The scheduled action: `backup`. | Yes
`day_of_week` | The day of the week. Sunday is 0. | Yes
`hour` | The hour of the day. Midnight is 0. | Yes
`minute` | The minute of the hour. | Yes  
`instance_id` | The ID of the database instance to back up. | Yes  
`source_id` | The ID of the database instance or HA group to back up. | No  
`source_type` | The type of backup for the given `source_id` (`instance` or `ha`, defaults to `instance`). | No  
`full_backup_retention` | The number of full automated backups to keep. | No

**Note:** The `instance_id` field is deprecated. You can still use it when you are providing a single instance ID to create a schedule. HA instance schedules should provide `source_id` with the `source_type` set to `ha`.

The `day_of_week` attribute specifies the day on which a full backup
is made. After that day, the schedule automatically runs daily
incremental backups until the next full backup. If the `day_of_week`
attribute is not provided, a random day of the week is
assigned to the schedule.

The hour and minute attributes specify the time when the backup job runs.
If either of those values is not specified, a random time is assigned to the schedule.
The time zone used by the schedule backup service is UTC.

Currently only one schedule can be active per instance. If an instance already has a schedule enabled, a subsequent API call to create a schedule for that
instance causes an error with the message `yourInstanceId already has an active schedule`.

### Managing and restoring scheduled backups

You can manage and restore scheduled backups in the same manner as on-demand backups. For details, see [Managing backups for Cloud Databases](/how-to/managing-backups-for-cloud-databases).

### Backup retention policy

By default, the automated backup retention policy is set to two full backups. When the third full automated backup is performed, the oldest full automated backup and its child incremental backups are deleted. You can define your own retention policy when you create a schedule, or by updating an existing schedule, with the allowed minimum retention value set to 2. There is no maximum value for the number of full backups to keep.

If the instance associated with a backup is deleted, the backups will remain until you manually delete them. Note that backups will continue to be charged for the Cloud Files storage that they use as long as they exist.

### HA automated backups

For HA groups, the backup is performed with the current active node
as the source, and the backup is a full or incremental backup based on the
schedule settings. If a master/slave setup is converted to an HA group,
and either the master or slave nodes has scheduled backups enabled, the
resulting HA group will also have a schedule enabled with the same time
settings as the master or first slave node's schedule. The individual
schedules for the master and slave nodes are deleted.

### Limitations

- An automated backup schedule for HA instances can be created only after the HA group is completed. If an HA setup has just been created, all of the nodes must be active before you can create a backup schedule.
- Backup schedules cannot be directly assigned to instances that are part of an HA group.
- Only one backup schedule is allowed per source, either a single instance or HA group.

For more information about backups with Cloud Databases, see [Managing backups for Cloud Databases](/how-to/managing-backups-for-cloud-databases).
