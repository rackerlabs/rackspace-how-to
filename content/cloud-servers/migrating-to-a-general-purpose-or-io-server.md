---
permalink: migrating-to-a-general-purpose-or-io-server/
audit_date:
title: Migrate to a General Purpose or I/O server
type: article
created_date: '2013-10-03'
created_by: Jered Heeschen
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Migrating your data to a General Purpose or I/O-optimized cloud server
([product page](http://www.rackspace.com/cloud/servers)) from a Standard cloud server can
be a straightforward process with some planning and preparation.

### Preparation

For detailed advice on preparing a server for a smooth migration, see the recommendations
in [Prepare to migrate a Linux server](/how-to/prepare-to-migrate-a-linux-server). In
particular, you can reduce the amount of data to be migrated by deleting old installers,
rotating logs, and removing old cache and session files.

You can also find a good list of items to consider before migrating in the
[Before you move to General Purpose or I/O server checklist](/how-to/before-you-move-to-general-purpose-or-io-cloud-server-checklist).

If you plan to remove files from your server to speed up your migration, we recommend that
you create a backup first to ensure that no essential data is lost.

### Image-based migration

The easiest way to migrate an existing server to a General Purpose server is to migrate an
image of the existing server. A server image can be restored only to the system disk of a
General Purpose server. (Similarly, images can be taken only from the system disk of a
General Purpose server; images cannot be saved for any data disks attached).

Image-based migration to a General Purpose server is not possible for Standard servers with
more than 1 GB of memory because of the larger disk allotment on those servers. Some 1 GB
and smaller servers might also be ineligible for image migration; for example, if a server
was resized, that can affect an image's minimum disk size requirement.

Images are restricted to the region in which they were created. General Purpose servers can
currently be created in the IAD, ORD, DFW, SYD, and LON regions.

The simplest way to find out if you can use an image-based migration is to try it. Create
an image of your server (you can use the steps in
[this article](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
for guidance), and then try to restore the image to a new server. If the image size is too
large for a General Purpose server system disk, you won't have the option to create a General
Purpose server.

If an image-based migration works, we recommend using that approach. For a reliable migration,
we recommend stopping any running applications before you create the image that you plan
to restore to the new server.

If you're unable to use image-based migration, read the following sections to prepare for
a manual migration of your data.

### Manual migration

If you can't use image-based migration, use the information in this section to plan for a
manual migration.

### Check the size of the original server

To determine the minimum disk space you need on the new server, check how much disk space
you're currently using.

To check disk space used on Linux, run the following command:

    df -h

To check disk space used on Windows, check the properties for the **C:** drive.

If you require more space than is provided by the system disk, you will need to use data
disks or Cloud Block Storage volumes on the new server to accommodate all of your data.

### Identify directory requirements

When setting up data disks or Cloud Block Storage volumes, you should check the sizes of
the directories on your origin server. This information can help you plan your data's
organization on the new server, that is, what data will go on the system disk and what data
will be stored on the additional volumes.

On Linux, you can determine the disk space used by files and directories in the current
directory by running the following command:

    du -hs *

You can also specify a directory or file name, as follows:

    du -hs directoryName

On Windows, right-click the directory you want to check and select **Properties**.

After you know which data will be copied to your system disk and which will be copied to an
attached disk, plan the size of the new server and its additional volumes (if any) accordingly.

### Create the destination server

When you create the destination server, consider your storage requirements as well as your
memory, CPU, and network requirements.

If you have more data than will fit on the new server's system disk, you need to decide
where you want to store the additional data. The flavor of server you've selected might
include one or more data disks. You can also attach Cloud Block Storage volumes to the server.

When choosing the size of your server, consider your current needs and any scaling you might
need to do in the future.

General Purpose and I/O-optimized servers can't be resized, so adding and removing storage
space via Cloud Block Storage are the only changes that you can make to their capabilities.
For a single-server environment, you must migrate to a new server if your RAM or CPU
requirements change.

Alternatively, you might plan your environment to use horizontal scaling, where more than
one server runs your application, with a load balancer managing traffic to the different
servers. Horizontal scaling might not work with all applications, but after it is set up,
you can easily add or remove servers to account for fluctuating load requirements.

Some example environments can be found in [our article on open cloud reference architectures](/how-to/rackspace-open-cloud-reference-architecture).

**Note:** You can't take a snapshot of a General Purpose server data disk, so to back up
data disks you must rely on Rackspace Cloud Backup or a similar file-based backup approach.
If you want your additional storage to be more portable or need to be able to take data
snapshots, consider [adding one or more Cloud Block Storage volumes](/how-to/create-and-attach-a-cloud-block-storage-volume)
to the new server.

### Format and configure any data disks

After you create your server, prepare any attached data disks or Cloud Block Storage volumes
by formatting them and configuring the system to use them.

If you've attached Cloud Block Storage volumes, see the
[Prepare Your Cloud Block Storage Volume article](/how-to/prepare-your-cloud-block-storage-volume)
for more information.

For instructions on formatting and mounting data disks on General Purpose or I/O-optimized
servers, see the following article that is appropriate for your server's operating system:

- [Preparing a data disk on a Windows General Purpose Server](/how-to/preparing-data-disks-on-windows-cloud-servers)
- [Preparing a data disk on a General Purpose Server](/how-to/preparing-data-disks-on-linux-cloud-servers)

If you are setting up attached volumes in a software RAID on Linux, see the
[Linux Software RAID HOWTO](http://www.tldp.org/HOWTO/Software-RAID-HOWTO.html) for instructions.

When your attached disks ready, you can migrate your data.

### Migration options

You have several options for a manual migration, including Rackspace Cloud Backup, Rackspace
Cloud Block Storage, or rsync on Linux, and Web Deploy or the Web Farm Framework on Windows.

#### Cloud Backup

To use [Cloud Backup](/how-to/cloud-backup) to migrate particular directories, create a
backup of your data from the origin server and then restore it to the destination server.

#### Cloud Block Storage

To migrate specific data using [Cloud Block Storage](/how-to/cloud-block-storage-overview),
attach the drive to your origin server and copy your data to it. Then detach the drive from
the origin server, attach it to the destination server, and copy your data from the drive.

#### rsync on Linux for directory migration

On Linux you can use rsync to copy a directory over the network directly. For example, from
the origin server you can run the following command to copy `/var/lib/mysql`:

    rsync -e 'ssh' -avl --stats --progress /var/lib/mysql username@123.45.67.89:/var/lib/mysql

For more information about rsync, see [Backing up your files with rsync](/how-to/backing-up-your-files-with-rsync).

#### Full Linux migration with rsync

If you want to migrate the entirety of a Linux server to a new General Purpose server, you
use rsync to migrate your server from the command line. See
[Migrate a Linux server from the command line](/how-to/migrating-a-linux-server-from-the-command-line-1).

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

### Post-migration

After all your data is on the new server, test your application thoroughly to ensure it
works as expected in the new environment.

If you haven't done so already, implement a backup plan to prevent significant data loss in
the event of a catastrophe.
