---
permalink: migrating-to-a-general-purpose-or-io-server/
audit_date: '2017-04-18'
title: Migrate to a General Purpose or I/O server
type: article
created_date: '2013-10-03'
created_by: Jered Heeschen
last_modified_date: '2017-04-18'
last_modified_by: Brian King
product: Cloud Servers
product_url: cloud-servers
---

Migrating your data to a General Purpose or I/O-optimized cloud server
([product page](http://www.rackspace.com/cloud/servers)) from a Standard cloud server can
be a straightforward process with some planning and preparation.

### Preparation

For detailed advice on preparing a server for migration, see the recommendations
in [Prepare to migrate a Linux server](/how-to/prepare-to-migrate-a-linux-server) or [Prepare to migrate a Windows server](https://support.rackspace.com/how-to/prepare-to-migrate-a-windows-server/). In
particular, you can reduce the amount of data to be migrated by deleting old installers,
rotating logs, and removing old cache and session files.

You can also find a list of items to consider before migrating in the
[Before you move to General Purpose or I/O server checklist](/how-to/before-you-move-to-general-purpose-or-io-cloud-server-checklist).

If you plan to remove files from your server to speed up your migration, we recommend that
you create a backup first to ensure that no essential data is lost.

### Image-based migration

The easiest way to migrate an existing server to a General Purpose server is to make an image of your current server and deploy a new General Purpose server from that image.

An image from a Classic or Standard server can build a General Purpose server that is one size larger. For example, a 1 GB Standard server image can build a 2 GB General Purpose server. If your Standard or Classic server is 8 GB or larger, you can’t perform an image-based migration because of the larger disk allotment on the older flavors. If you have an older Linux server, you might be able to resize it down to 4 GB or smaller and then create an image that will build a General Purpose server.

To test whether or not image of your server is too large, use the steps in
[this article](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
to try and restore the image to a new server. If the image size is too
large for a General Purpose server, you won't have the option to create a General
Purpose server.

If an image-based migration works, we recommend using that approach. 

### Manual migration

If you can't use image-based migration, use the information in this section to plan for a
manual migration.

#### Check the size of the original server

To determine the minimum disk space that you need on the new server, check how much disk space
you're currently using.

To check disk space used on Linux, run the following command:

    df -h

To check disk space used on Windows, check the properties for the **C:** drive.

If you require more than 160 GB (the maximum disk size for a General Purpose flavor), you need to use Cloud Block Storage volumes on the new server to accommodate all of your data.

#### Identify directory requirements

When you are setting up Cloud Block Storage volumes, check the sizes of
the directories on your origin server. This information can help you plan your data's
organization on the new server: what data goes on the system disk and what data
will be stored on the additional volumes.

On Linux, you can determine the disk space used by files and directories in the current
directory by running the following command:

    du -hs *

You can also specify a directory or file name, as follows:

    du -hs directoryName

On Windows, right-click the directory that you want to check and select **Properties**.

After you know which data will be copied to your system disk and which will be copied to an
attached disk, plan the size of the new server and its additional volumes (if any) accordingly.

#### Create the destination server

When you create the destination server, consider your storage requirements as well as your
memory, CPU, and network requirements.

If you have more data than will fit on the new server's system disk, decide whether you
want to use one or more data disks (I/O flavor only), or attach Cloud Block Storage volumes to the
server.

When choosing the size of your server, consider your current needs and any scaling you might
need to do in the future.

I/O-optimized servers can't be resized, so adding and removing storage
space via Cloud Block Storage are the only changes that you can make to their capabilities. 
General Purpose servers can only resize up, and their maximum size is 8 GB RAM/160 GB HDD.

For a single-server environment, you must migrate to a new server if your RAM or CPU
requirements change.

Alternatively, you might plan your environment to use horizontal scaling, where more than
one server runs your application, with a load balancer managing traffic to the different
servers. Horizontal scaling might not work with all applications, but after it is set up,
you can easily add or remove servers to account for fluctuating load requirements.

Some example environments are provided in our article on [open cloud reference architectures](/how-to/rackspace-open-cloud-reference-architecture).

**Note:** If you are currently using Performance servers, please note that the data disks are not captured
when you create an image. To back up data disks you must rely on Rackspace Cloud Backup or a similar file-based backup approach.
If you want your additional storage to be more portable or need to be able to take data
snapshots, consider [adding one or more Cloud Block Storage volumes](/how-to/create-and-attach-a-cloud-block-storage-volume)
to the new server.

#### Format and configure any Cloud Block Storage volumes or data disks

After you create your server, prepare any attached data disks or Cloud Block Storage volumes
by formatting them and configuring the system to use them.

If you've attached Cloud Block Storage volumes, see
[Prepare your Cloud Block Storage volume](/how-to/prepare-your-cloud-block-storage-volume)
for more information.

For instructions on formatting and mounting data disks on I/O-optimized
servers, see the following article that is appropriate for your server's operating system:

- [Prepare data disks on a Windows Cloud Servers](/how-to/preparing-data-disks-on-windows-cloud-servers)
- [Prepare data disks on a Linux Cloud Servers](/how-to/preparing-data-disks-on-linux-cloud-servers)

If you are setting up attached volumes in a software RAID on Linux, see the
[Linux Software-RAID HOWTO](http://www.tldp.org/HOWTO/Software-RAID-HOWTO.html) for instructions.

When your attached disks are ready, you can migrate your data.

### Other manual migration options

You have several options for a manual migration, including Rackspace Cloud Backup, Rackspace
Cloud Block Storage, or rsync on Linux, and Web Deploy or the Web Farm Framework on Windows.

#### Cloud Backup

To migrate particular directories, you can use [Cloud Backup](/how-to/cloud-backup). Create a
backup of your data from the origin server and then restore it to the destination server.

#### Cloud Block Storage

To migrate specific data, you can use [Cloud Block Storage](/how-to/cloud-block-storage-overview).
Attach the drive to your origin server and copy your data to it. Then detach the drive from
the origin server, attach it to the destination server, and copy your data from the drive.

#### rsync on Linux for directory migration

On Linux you can use rsync to copy a directory over the network directly. For example, from
the origin server you can run the following command to copy `/var/lib/mysql`:

    rsync -e 'ssh' -avl --stats --progress /var/lib/mysql username@123.45.67.89:/var/lib/mysql

For more information about rsync, see [Back up your files with rsync](/how-to/backing-up-your-files-with-rsync).

#### Full Linux migration with rsync

If you want to migrate the entirety of a Linux server to a new General Purpose server, you can
use rsync to migrate your server from the command line. See
[Migrating a Linux server from the command line](/how-to/migrating-a-linux-server-from-the-command-line-1).

#### Web Farm Framework on Windows 2008

To migrate IIS and SQL Server data on Windows 2008, you can use the Microsoft Web Farm Framework.

#### Web Deploy on Windows 2012

To migrate IIS and SQL Server data on Windows 2012, you can use the Microsoft Web Deploy
tool. See the Rackspace Community post
[Windows Server 2012 Web Farm With Web Deploy 3.0](https://community.rackspace.com/products/f/25/t/641).

#### Application-specific options

Other applications might have their own means of facilitating data migration. For example,
to migrate a database you could make the new server a slave of the original database to
automatically replicate your data to the new server.

### Post-migration tasks

After all your data is on the new server, test your application thoroughly to ensure it
works as expected in the new environment.

If you haven't done so already, implement a backup plan to prevent significant data loss in
the event of a catastrophe.
