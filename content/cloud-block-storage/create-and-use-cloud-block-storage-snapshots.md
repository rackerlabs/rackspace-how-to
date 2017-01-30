---
permalink: create-and-use-cloud-block-storage-snapshots/
audit_date:
title: Create and use Cloud Block Storage snapshots
type: article
created_date: '2012-10-22'
created_by: Rackspace Support
last_modified_date: '2016-06-06'
last_modified_by: Nate Archer
product: Cloud Block Storage
product_url: cloud-block-storage
---

**Previous section:** [Prepare your Cloud Block Storage volume](/how-to/prepare-your-cloud-block-storage-volume)

A snapshot is a copy made of your volume at a specific moment in time.
It contains the full directory structure of the volume. Snapshots can be
used as incremental backups of your volumes, as restore points for your
data, as long-term storage for your data, or as starting points for new
Cloud Block Storage (CBS) volumes. Snapshots are stored in Rackspace
Cloud Files.

Snapshots only take up as much storage space as the data that fills
them. So if you have a 1 TB volume, but only 500 GB of data on it, your
snapshot is only 500 GB. When you create new volumes from a snapshot,
the new volume must be of equal size or larger than the original volume
from which you made the snapshot. The new volume must be in the same
region. It can, however, be a different type.

Read [Allowing snapshots without detaching the volumes](/white-paper/allowing-snapshots-without-detaching-the-volumes) for
additional information on allowing snapshots without detaching the
volumes.

### Create a snapshot

It is a good idea to detach your volume from your server before you take
a snapshot. This is the safest method to prevent your server from
writing information while you are backing it up. That could get your
data out of sync and could create a problem. To detach your volume, see
the instructions on how to [detach and delete volumes](/how-to/detach-and-delete-cloud-block-storage-volumes).
You can always re-attach the volume by following the steps in [Allowing snapshots without detaching the volumes](/how-to/create-and-attach-a-cloud-block-storage-volume) steps
on the Create/Attach Volume page.

More advanced users may sync the file system in order ensure the
integrity of the data on your snapshots. Performing a sync will flush
file system buffers and write the data out to disk. If you are
unfamiliar with how to sync your file system, consider detaching your
volume prior to snapshotting.

There are two ways to create a snapshot - either from the Actions button
or from the Storage Snapshots screen.

#### From the **Actions** button:

1.  From the Actions button on the list of Cloud Block Storage Volumes
    -   Click the **Actions** button on the **Volume Details** screen.
        or
    -   Click the Action cog next to the volume name in the Block
        Storage Volumes screen.

2.  Click the **Create Snapshot** link.
3.  Give the snapshot a name. The default is the volume's name with the
    numbered snapshot (for instance, My-CBS-Volume-3 for the
    third snapshot).
4.  Click the **Create Snapshot** button.
5.  After you click the  **Create Snapshot** button and the "Creating
    snapshot for volume" popup no longer displays, you can safely
    reattach your volume.

    **Note**: The data in the snapshot is instant at the point in time
    starting when you click the "Create Snapshot" button. While the
    "Creating" status shows, the snapshot already exists at the point in
    time of the submitted request. During the "Creating" status, the
    snapshot is compressed, de-duped, and transferred to Cloud Files
    storage, where it is backed up in triplicate.

#### From the **Storage Snapshots** screen:

1.  From the Storage Snapshots screen, click the **Create Snapshot**
    button.
    The **Volume to Snapshot** menu displays.
2.  Click the circle next to the volume to take a snapshot.
3.  Give the snapshot a name. The default is the volume's name with the
    numbered snapshot (for instance, My-CBS-Volume-3 for the
    third snapshot).
4.  Click the **Create Snapshot** button.
5.  After you click the  **Create Snapshot** button and the "Creating
    snapshot for volume" popup no longer displays, you can safely
    reattach your volume.

    The note above after the preceding Actions button procedure also
    applies to this Storage Snapshots screen procedure.

    **Note**: If a snapshot of a volume exists, you cannot delete the
    volume until you delete the snapshot.


### Create volume from snapshot

The volume you create from a snapshot must be the same size and in the
same region as the original volume. However, you may choose a different
type.

1.  From the **Block Storage Snapshots** screen, click the Action button
    (the cog) next to the snapshot.
2.  Click the **Create Volume** link.
3.  Give your volume a name (using alphanumeric and underscore and dash
    characters, please).
4.  Select a Volume Type:
    -   **Standard** - This is a standard SATA drive for users who need
        additional storage on their Cloud Server.
    -   **High Performance** - This is an SSD drive, which offers a
        higher performance option for databases and high
        performance applications.

5.  Click the **Create Volume** button.

The larger your volume, the longer it may take to create.



### Delete snapshot

1.  From the **Block Storage Snapshots** screen, click the Action button
    (the cog) next to the snapshot.
2.  Click the **Delete Snapshot** link.


**Next steps:** [Detach and delete Cloud Block Storage volumes](/how-to/detach-and-delete-cloud-block-storage-volumes)
