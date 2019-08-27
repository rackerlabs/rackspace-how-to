---
permalink: cloud-to-cloud-migration/
audit_date: '2019-08-19'
title: Cloud-to-cloud migration
type: article
created_date: '2019-07-12'
created_by: Alex Darke
last_modified_date: '2019-08-22'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

### Initial considerations

Consider the following items as you plan a cloud-to-cloud migration.

#### Plan ahead because DNS changes are not automatic

If your current cloud server, the origin server, is not behind a load balancer, the IP address changes. This change means you must update the Domain Name server (DNS) to point to a new IP. You should make sure to set the time-to-live (TTL) record to 5 minutes and then wait 24 hours to ensure that the change propagates out properly. After that, any DNS changes you make should take effect within 5 minutes.

#### Server purpose

Does the origin server host web applications, email, or databases? Does it do one thing or handle a variety of tasks? A good initial assessment, done in advance, can save you a last-minute panic when you flip the switch between the origin server and the new, or destination, server. Be sure to identify where you store the data, the configuration files, and other important data. The more you know about your environment heading into the migration makes for a smoother migration.

#### Test the migration

One advantage of doing a cloud migration is how quickly and easily you can spin a server up or down. We strongly encourage you to power the origin server down after the migration rather than deleting it right away. Leave it powered down for 24 hours to a week. If your website and applications are running as expected, then your migration was probably completed successfully. However, if turning off the origin server leads to problems, it means some processes still depend on the old server. You can bring the origin server back up and identify what you missed and migrate it properly.

### Perform the work

This section identifies the steps for a cloud migration.

#### Check the size of the original server

To determine the minimum disk space that you need on the destination server, check how much disk space you’re currently using.

To check disk space used on Linux&reg;, run the following command:

    df -h

If you require more than 160 GB (the maximum disk size for a General Purpose flavor), you need to use Cloud Block Storage volumes on the new server to accommodate all of your data.

#### Identify directory requirements

When you are setting up Cloud Block Storage volumes, check the sizes of the directories on your origin server. This information helps you plan the data organization on the destination server, such as what data goes on the system disk and what data you should store on the additional volumes.

On Linux, you can determine the disk space that files use and the subdirectories in the current directory by running the following command:

    du -hs *

You can also specify a directory or file name by running the following command:

    du -hs directoryName

After you know which data to copy to your system disk and which to copy to an attached disk, plan the size of the destination server and its additional volumes accordingly.

#### Create the destination server

When you create the destination server, consider your storage requirements as well as the memory, CPU, and network requirements.

If you have more data than fits on the destination server’s system disk, decide whether you want to use one or more data disks (I/O flavor only), or attach Cloud Block Storage volumes to the server.

When choosing the size of your destination server, consider your current needs and any scaling you might need to do in the future.

You can't resize I/O-optimized servers, but you can add or remove storage space by using Cloud Block Storage. General Purpose servers have a maximum size of 8 GB RAM to 160 GB HDD, and, unless they use the deprecated paravirtual (PV) virtualization mode, you can make them only larger and not smaller.

For a single-server environment, you must migrate to a new server if your RAM or CPU requirements change.

Alternatively, you might plan your environment to use horizontal scaling, where more than one server runs your application, with a load balancer to manage traffic to the different servers. Horizontal scaling might not work with all applications, but after you set it up, you can easily add or remove servers to account for fluctuating load requirements.

See the [open-cloud reference architectures article](https://support.rackspace.com/how-to/rackspace-open-cloud-reference-architecture/) for some example environments.

**Note**: If you are currently using Performance servers, the data disks are not captured when you create an image. To back up data disks, you must rely on Rackspace Cloud Backup or a similar file-based backup approach. If you want your additional storage to be more portable or you want to take data snapshots, consider adding one or more Cloud Block Storage volumes to the new server. See [Create and attach a Cloud Block Storage volume](https://support.rackspace.com/how-to/create-and-attach-a-cloud-block-storage-volume/) to learn more.

Format and configure any Cloud Block Storage volumes or data disks
After you create your server, prepare any attached data disks or Cloud Block Storage volumes by formatting them and configuring the system to use them.

If you’ve attached Cloud Block Storage volumes, see [Prepare your Cloud Block Storage volume](https://support.rackspace.com/how-to/prepare-your-cloud-block-storage-volume/) for more information.

For instructions on formatting and mounting data disks on I/O-optimized servers, see [Prepare data disks on a Linux Cloud Servers](https://support.rackspace.com/how-to/preparing-data-disks-on-linux-cloud-servers/).

If you are setting up attached volumes in a software RAID on Linux, see [the Linux Software-RAID HOWTO](http://www.tldp.org/HOWTO/Software-RAID-HOWTO.html) for instructions.

When your attached disks are ready, you can migrate your data.

### Manual migration options

You have several options for a manual migration on Linux, including Rackspace Cloud Backup, Rackspace Cloud Block Storage, or rsync.

#### Cloud Backup

To migrate particular directories, you can use Cloud Backup. Create a backup of your data on the origin server and then restore it to the destination server.

#### Cloud Block Storage

To migrate specific data, you can use Cloud Block Storage. Attach the drive to the origin server and copy your data to it. Then detach the drive from the origin server, attach it to the destination server, and copy your data from the drive.

#### Use rsync for directory migration on Linux

On Linux, you can use `rsync` to copy a directory over the network directly. For example, from the origin server you can run the following command to copy **/var/lib/mysql**:

    rsync -e 'ssh' -avl --stats --progress /var/lib/mysql username@123.45.67.89:/var/lib/mysql

For more information about `rsync`, see [Back up your files with rsync](https://support.rackspace.com/how-to/backing-up-your-files-with-rsync/).

**Important**: As long as the two cloud servers are in the same regional data center (DFW, ORD, IAD, LON, HKG, or SYD), you can make use of the `10.x` IP address assigned to the two servers to transfer any data. This means you won't be charged for the bandwidth of the data between the two servers. Any data transferred using public IPs will result in potential bandwidth costs.

#### Application-specific options

Other applications might have their own means of facilitating data migration. For example, to migrate a database, you could make the destination server a slave of the origin database to automatically replicate your data to the destination server. You can find information on how to do MySQL&reg; master-slave replication [here](https://support.rackspace.com/how-to/set-up-mysql-master-slave-replication/).

### Post-migration tasks

After all your data is on the destination server, test your application thoroughly to ensure it works as expected in the destination environment. As mentioned at the start of this article, we encourage clients to power down the origin server but not to delete it for one to seven days. This practice gives you time to determine if you have missed anything in your migration. For example, that an IP address rather than DNS was used to resolve to the origin server. If after seven days, nothing has broken and you've noticed no issues, it should be safe to delete the origin server.

If you haven’t done so already, implement a backup plan on the destination server to prevent significant data loss in case of a catastrophe.
