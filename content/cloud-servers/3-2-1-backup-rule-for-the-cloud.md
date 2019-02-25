---
permalink: 3-2-1-backup-rule-for-the-cloud/
audit_date: '2019-01-22'
title: 3-2-1 backup rule for the cloud
type: article
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-02-01'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

When you perform backups, certain issues might occur. For example, you might
find that you have backed up the wrong data or device, or that the backup
failed or is corrupted. The classic _3-2-1 backup rule_ can help you improve
your backups. The rule includes the following guidelines:

- Make three backups
- Two in different formats
- One offsite

For the cloud, _offsite_ might mean keeping a tape copy in your local office,
but this article also presents other options.

### Make three backups

You should always make three copies of your backup. This guideline is based on
Jack Schofield's _three laws of computing_. The second law states that data
doesn’t really exist unless you have at least two copies of it. As a result,
best practices dictate that you need at least two backups in some form.

You can use Rackspace [Cloud
Backup](https://www.rackspace.com/en-us/cloud/backup) for one of your backups.
Cloud Backup takes a file-by-file backup on a schedule that you choose.

You might consider using a server snapshot for another backup. Server
snapshots work for some servers in the Rackspace cloud. However, you should
not consider them a backup solution. For example, if you are running a
compute instance, your server is booting from a Cloud Block Storage
volume. Server snapshots do not capture Cloud Block Storage volumes because they are performed
on the host machine. With performance instances on which server snapshots do
work, corruption might still occur if the snapshot is taken while a database
table is being written to.

### Two in different formats

We recommend that you make backups in smaller chunks that you can easily
back up with Cloud Backup and sync to another location.

For example, you might first save your database backup locally, then compress
your site files into a .zip file or .tar file and save them in a folder as
well.

Then, make a backup that you save in another location.

You can create another job that runs at a certain time and sends those files
to a third location. For example, you could have it copied to another server
every four hours.

By using these methods, you back up your site files as a whole, and also create
a copy in a compressed archived format that you save elsewhere in two different
formats.

### One offsite

The offsite copy should be a local copy in your office. It should be available
to your team if they need to access it to build a new server. For example, you
might use an internal server to pull the files down, or have a server that is
located in a separate data center from where your primary sources are located
back up the files.

### Limitations

This section discusses the limitations that are associated with these backup
methods.

#### Replication

Replication is useful in a multitiered cloud because if a server fails, a
replica server keeps your site up and running. However, if you upload a
corrupted file, the sync mechanism replicates the corrupt data. This
corruption is a problem if you need to restore a server to a previous version.

You can use replication based on a scheduled task or a cron job. However, you
might still want to be able to look at your backups within a certain number of
days to see when things went wrong.

#### Snapshots

With Cloud Block Storage snapshots, there is no way to schedule a new snapshot and then delete
the older ones. Snapshots also have the same corruption issues that server
snapshots have.

### Conclusion

Creating a total of three backups, two in different formats and one locally,
is a tried-and-true practice for keeping your data safe. Remember to test the
backups. Also keep in mind that your backup solution must adapt and change
with new environments.
