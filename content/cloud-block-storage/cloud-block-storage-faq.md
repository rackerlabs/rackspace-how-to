---
permalink: cloud-block-storage-faq/
audit_date:
title: Cloud Block Storage FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2017-08-29'
last_modified_by: Stephanie Fillmon
product: Cloud Block Storage
product_url: cloud-block-storage
---

### Backups

#### What are the minimum and maximum limits for single Cloud Block Storage volumes?

The minimum size for a Cloud Block Storage volume is 50 GB for an SSD
volume or 75 GB for an SATA volume. The maximum volume size is 1 TB.

#### What is the maximum number of Cloud Block Storage volumes I can attach to a single server instance?

Depending on your Cloud Server's operating system, you can have up to a
maximum of 14 Cloud Block Storage volumes attached to a single server.

#### What is the default maximum capacity of Cloud Block Storage that can be consumed by a single customer account?

The limit for volumes and storage is 10 TB total stored or 50 volumes
per region (whichever is reached first).

#### What if I need more storage than the default maximum capacity?

No problem. We'll be happy to accommodate any size storage requests for
Cloud Block Storage. Simply ask for an increase to your storage quota
via a support request and include the desired storage amount (TBs or
volume count), storage type (SATA or SSD), and region (DFW, ORD, IAD,
LON, SYD, HKG). Please contact your account team for further details.

#### Does Cloud Block Storage have a Service Level Agreement (or SLA)?

Yes. Details regarding the Cloud Block Storage SLA can be found here:
[http://www.rackspace.com/cloud/legal/sla](http://www.rackspace.com/cloud/legal/sla/).

#### Is Cloud Block Storage right for me?

Cloud Block Storage is an excellent option for you if you:

-   Want more control over your storage or application infrastructure
-   Are looking for a high performance storage option (SSD)
-   Would like to add additional storage to your servers without paying
    for additional compute resources

You might not be a good fit for the Cloud Block Storage service if you:

-   Are not comfortable with low-level system administration tasks, such
    as installing file systems, mounting and partitioning storage
    volumes, or installing your own applications on top of a raw storage
    device
-   Are looking for a fully managed storage or database solution

#### Is Cloud Block Storage a replacement for existing Rackspace storage products?

Cloud Block Storage (CBS) is not meant as a direct replacement of any
existing Rackspace products (shared or dedicated). CBS allows Rackspace
Cloud customers to add "a la carte" storage to their existing next
generation Cloud Servers and should be considered a complementary
cloud-based storage offering that rounds out our entire storage
portfolio.

#### What parts of the storage system are highly available (HA)?

Cloud Block Storage back-end storage volumes employ a RAID (Redundant
Array of Independent Disks) level 10 configuration. RAID 10 provides
high availability by combining features of RAID level 0 and RAID level 1
in which data is stripped and mirrored to provide a very high level of
reliability and performance.

#### If the system employs RAID level 10 on the back end storage nodes, can I assume my volumes are fully protected from a failure scenario?

The hardware RAID level 10 employed by Cloud Block Storage nodes
provides protection against disk failures on the storage nodes
themselves. However customers are strongly encouraged to implement a
RAID level 1 (mirror) configuration across multiple volumes to protect
against data loss in the event of a storage node failure.

#### Can I attach a single volume to multiple Cloud Servers?

Not concurrently. Cloud Block Storage is not a shared storage offering.
You may attach multiple volumes to a single Cloud Server instance, but
you may not attach multiple Cloud Servers to a single Cloud Block
Storage volume.

#### Once I have created a Cloud Block Storage volume, can it be resized (increased or decreased)?

Once you have created a volume, you can increase its size using the API
by either of two methods:

-   Cloning from a source volume to a new larger volume, or
-   Creating a new larger volume from an existing volume snapshot.

Alternatively, in order to move to a larger or smaller volume size, you
might need to create a new volume of the desired size and then copy your
data from the original volume to the new volume. Please note that you
will be required to resize your file system when moving to a smaller
volume (if supported by your operating system).

When you copy your data within the same data center via the internal
ServiceNet network, there is no charge for bandwidth.

#### When I am using a volume, how can I know how much space I have left?

You can verify a volume's capacity and available space using basic
system commands available via their Cloud Server operating system:

-   In Linux CLI: From a terminal window, run the "df -h" command and
    note the Size, Used, Avail, and Capacity of the storage volume
-   Windows Explorer: Right-click on drive icon and select "Properties,"
    and note Capacity, Free space, and Used space

#### Is there a limit to the number, frequency or size of snapshots that can be taken on a volume?

There is no limit. You may create an unlimited number of snapshots.

#### Can I utilize a software RAID to improve the I/O performance of my SATA Cloud Block Storage volumes?

Yes. However at some point the cost benefit of utilizing multiple less
expensive SATA volumes in a RAID configuration will be outweighed by the
benefit of utilizing a single higher I/O SSD volume. If you want to
increase the I/O performance of your storage volumes, we encourage you
to use higher performing SSD volumes for increased disk I/O.

#### How much does Cloud Block Storage cost?

Cloud Block Storage is charged by gigabytes of storage used per month,
not the IOPs, which can be difficult to predict. The price differs for
standard volumes, SSD volumes, and snapshots.

Prices vary by region and are detailed on the following pages:

-   [USA Pricing for Cloud Block Storage (DFW, ORD, and
    IAD regions)](http://www.rackspace.com/cloud/block-storage/pricing/)
-   [UK Pricing for Cloud Block Storage
    (LON region)](http://www.rackspace.co.uk/cloud/block-storage/pricing)
-   [Australia Pricing for Cloud Block Storage
    (SYD region)](http://www.rackspace.com.au/cloud/block-storage/pricing)
-   [Hong Kong Pricing for Cloud Block Storage
    (HKG region)](http://www.rackspace.com.hk/cloud/block-storage/pricing)

#### How is volume cloning different from volume snapshots?

A volume *clone* is a usable copy of the source volume; it can be
attached to a server and used immediately. A volume *snapshot* cannot be
directly used as a volume; you must create a volume from the snapshot
and then attach that volume to your server. Snapshots are stored
redundantly in Cloud Files. However, creating a volume from a snapshot
is a slower process than creating a volume from a clone. If your
application is time sensitive, consider using volume cloning.

For instructions on volume cloning, see [How to create a clone of a
Cloud Block Storage
volume](/how-to/create-a-clone-of-a-cloud-block-storage-volume).

#### What can I do if I need to change volume types (SATA vs. SSD)?

Although you cannot change the type of a Cloud Block Storage volume
after it has been provisioned, you can create a copy of that volume and
switch volume types by using the cloning or snapshot method outlined in
the following articles:

-   [How to create a clone of a Cloud Block Storage
    volume](/how-to/create-a-clone-of-a-cloud-block-storage-volume) .
-   [Create and use Cloud Block Storage
    snapshots](/how-to/create-and-use-cloud-block-storage-snapshots)

#### How can I make a copy of a Cloud Block Storage volume?

You can create a copy of a Cloud Block Storage volume using two methods:

-   **Cloning method** (volume-to-volume)

This is direct copy from your existing volume to a new blank volume on
another storage node. Volume data is copied directly between CBS storage
nodes over our high-speed local storage network. This method is
recommended if you want to make quick copies of your volume data and use
them immediately after creation.

-   **Snapshot method** (volume-to-snapshot-to-volume)

This method requires the intermediate step of creating a volume
snapshot. You first create snapshot from your existing volume, which
gets stored in Cloud Files. Second, you create a new volume using your
snapshot as the source. This process requires writing snapshot data in
and out of Cloud Files so it can take longer than the Cloning Method.
This method is recommended if you don't require quick access to your
copied volumes and want the added durability, and lower price, of having
your volume snapshot stored in Cloud Files.

#### Can I rename my volumes once they are created?

Yes. Using the API, you can rename an existing volume using the cinder
rename command to update the display-name of the volume.

#### My snapshot seems to be taking a long time. Is it possible to check the status of a snapshot?

Yes. Using the API, you can query the progress of a snapshot creation
using the snapshot-show command.
The percentage complete value will show up under the
os-extended-snapshot-attributes:progress property.

#### Can I use Cloud Backup to backup my Cloud Block Storage volumes?

Yes, you can. After you have attached and mounted your Cloud Block
Storage volume, you can add it to your current Cloud Backup Schedule.
Edit the Backup Schedule and browse to the drive letter of your volume
or to individual files on the drive. Save your Schedule as normal.

#### What is Rackspace Cloud Block Storage?

Rackspace Cloud Block Storage provides persistent block-level storage
volumes for use with Rackspace Cloud Servers. Volumes
can be created and deleted independently of the Cloud Servers they are
attached to. Rackspace Cloud Block Storage customers can create volumes
ranging from 50 GB for an SSD volume or 75 GB for a SATA volume up to 1
TB in size.

#### How does Cloud Block Storage differ from the local storage available through Cloud Servers?

Cloud Block Storage provides persistent data storage for Cloud Servers. Persistent storage can exist independent of your server, even after the server has been deleted. The local storage bundled with Cloud Servers is ephemeral and exists only as long as the Cloud Server exists. When the server is deleted, so is its local storage.

We recommend that you [unmount and detach Cloud Block Storage](/how-to/detach-and-delete-cloud-block-storage-volumes)
volumes before deleting the server.

#### What types of volumes are available?

Cloud Block Storage offers both a low cost per gigabyte option with standard performance for customers who only require more storage and a high performance option that provides increased storage with higher performance.

------------------------------------------------------------------------

### Security

#### What happens to my data when I delete a Cloud Block Storage volume?

For your security, the used portions of the physical disk are
overwritten with zeroes before the deleted volume's disk space is
reallocated to the shared pool of disk resources. At this point, your
data cannot be recovered and is not visible to other customers.
