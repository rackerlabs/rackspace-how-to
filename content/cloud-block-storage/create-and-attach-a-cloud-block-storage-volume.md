---
permalink: create-and-attach-a-cloud-block-storage-volume/
audit_date:
title: Create and attach a Cloud Block Storage volume
type: article
created_date: '2012-10-22'
created_by: Rackspace Support
last_modified_date: '2016-01-22'
last_modified_by: Catherine Richardson
product: Cloud Block Storage
product_url: cloud-block-storage
---

In Cloud Block Storage, you work with volumes. Volumes are the detachable
block storage devices that expand the storage capacity of your server.
You can think of them like USB memory sticks. Like a USB memory stick,
volumes may only be attached to one server at a time, and they retain
your data, even without being attached to a server.

There are two types of volumes: Standard Performance SATA drive storage
and High Performance solid state drive (or SSD) storage. Each type is
charged by the GB of storage you provision, so create volumes of the
size you need. Volumes can be anywhere from 50 GB (SSD) or 75 GB (SATA)
to 1 TB, and you can always create larger volumes later.

###  Create the volume

Make sure you are logged in to the [Cloud Control
Panel](https://mycloud.rackspace.com/).

Confirm the name and region of the server you will attach the volume to.
Volumes can be attached to only servers in the same region.

1.  Click **Storage** in the main navigation.
2.  Click **Block Storage Volumes** in the Storage sub-navigation.
3.  Click the **Create Volume** button.
4.  Give your volume a name.
5.  Select the region. Volumes can be attached only to servers in
    the same region.

6.  Select a volume type:
    -   **Standard** - This is a standard SATA drive for users who need
        additional storage on their Cloud Server.
    -   **High Performance** - This is an SSD drive, which offers a
        higher performance option for databases and high
        performance applications. **NOTE:** Performance gains from SSD
        are in some cases limited by network speed.  At this time we
        recommend that SSD-based Cloud Block Storage volumes be created
        in our IAD datacenter for best performance.

7.  Select the size of the volume, from 50 GB (SSD) or 75 GB (SATA) to
    1024 GB (1 TB).
    **Volume maximums:**
    -   1024 GB (1 TB) / volume
    -   14 volumes / server
    -   10 TB of SATA and 10 TB of SSD per region (which can be
        increased via a Support request)

8.  Click the **Create Volume** button.

The larger your volume, the longer it may take to create.

When your volume is created, a green **Available** icon displays under
Status on the Volume Details page, and the status bar turns green in the
Block Storage Volumes list.

The next step is to attach your volume, as described below.

To detach and delete the volume, see [Detach and delete Cloud Block Storage volumes](/how-to/detach-and-delete-cloud-block-storage-volumes).

###  View volume details

The **Volume Details** screen displays basic information about the volume.
Here you can see the Volume's Status, what server it may be attached to,
its size, region, and type. Additionally, if your volume is attached to
a Linux server, you can see its path.

The **Volume Details** screen displays by default once you create the
volume.

You can also see a volume's details by clicking its name in the Block
Storage Volumes list. (Click **Servers** in the main navigation, then
**Block Storage** in the sub-navigation.)

**Status:** This section displays the status of your volume. Possible
statuses are

-   Building -- Volume is still being created.
-   Available -- Volume is created, but not attached.
-   In-Use -- Volume is attached to a Server.
-   Deleting -- Volume is being deleted.

**Attached to:** This section displays the attachment status of your
volume. Possible statuses are:

-   `Unattached`: The volume is not attached to a server.
    -   `Attach Volume...`: Click this to display a list of servers you
        can attach the volume to.
-   `Name of Server`: If your volume is attached, you can click
    the server's name to see the server's details.
    -   Detach Volume... -- Volume is attached; click this link to
        detach it. Note: you should make sure the volume is unmounted
        before you detach it. See [Detach and Delete Cloud Block Storage
        Volumes](/how-to/detach-and-delete-cloud-block-storage-volumes)
        for details.
-   `path`: If your volume is attached to a Linux server, its
    path (`/dev/XXXX`) displays here.

    **Note:** The file path /dev/XXXX is what is known as a device file, or
    special file. It appears as an ordinary system file, but it serves
    as an interface for a device driver. It allows the operating system
    to read and write data with attached devices, such as
    storage volumes. Your Cloud Block Storage volumes appear as
    available devices once you have attached them to your cloud server.


-   `ID`: This is the ID of the volume.

-   `Size`: The size of the volume.

-   `Region`: Where the volume is located.

-   `Type`: The type of volume, either Standard (a SATA drive) or High
Performance (an SSD drive).

-   `Snapshots`: This section displays how many snapshots you have of the
volume. There is also a link which allows you to create a snapshot.
Snapshots are described [later in this product overview](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup).

###  Attach the volume to a server

When the volume is created, it exists by itself and cannot have any data
written to it. The volume must be attached to a server before anything
else can be done with it. The process for attaching a volume is the same
for all servers. After you attach the volume, you must partition,
format, and mount it, which we cover on the next page.

If you'd like to know more about the differences between attaching and
mounting a volume, read the article [attaching versus mounting](/how-to/cloud-block-storage-attaching-vs-mounting).

You may only attach a volume to a server in the same region.

1.  Display the **Select a Server** window by one of two methods:
    -   From the Volume Details screen, click **Attach Volume** link.
    -   From the Block Storage Volumes screen, click a volume's
        **Manage** button (the cog at the left) and select **Attach
        Volume**. The **Select a Server** menu only displays servers in
        the same region as the Cloud Block Storage Volume.

2.  Click the dot next to a server name to select it.
3.  Click the **Attach Volume** button.

It may take a few minutes to attach your volume to your server. While
the Cloud Block Storage volume is attaching, its status bar will be
yellow in the Block Storage Volumes list. When it is done attaching, its
status bar will turn green and the name of the server it is attached to
displays under the heading **Attached to**.

**Next steps:** [Prepare your Cloud Block Storage volume](/how-to/prepare-your-cloud-block-storage-volume)
