---
permalink: detach-and-delete-cloud-block-storage-volumes/
audit_date:
title: Detach and delete Cloud Block Storage volumes
type: article
created_date: '2012-10-22'
created_by: David Hendler
last_modified_date: '2017-01-27'
last_modified_by: Laura Santamaria
product: Cloud Block Storage
product_url: cloud-block-storage
---

**Previous section:** [Create and use Cloud Block Storage snapshots](/how-to/create-and-use-cloud-block-storage-snapshots)

Detaching a Cloud Block Storage volume is useful or necessary when you want to
perform the following tasks:

-   Prevents writes to the volume when you want to take a snapshot.
-   Take the volume offline for archival purposes.
-   Move the volume to another server.
-   Resize the server to which the volume is mounted
-   Delete the volume.

In all cases, you must unmount the volume before you detach it. This article
provides instructions for unmounting, detaching, and deleting a volume.

### Unmount a volume

Before you detach a volume from a server, unmount it to prevent errors.

#### Unmount a volume from a Linux server

**Note:** You cannot unmount and detach the operating system disk. For more
information, see the "Detach an operating system disk that uses the
boot-from-volume functionality" section at the end of this article.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. In the Cloud Control Panel, confirm how the volume is presented to the cloud
    server.

3. On your server, use the `df -h` command to see how the volume is mounted.

   <img src="{% asset_path cloud-block-storage/detach-and-delete-cloud-block-storage-volumes/mount_point.png %}" width="571" height="122" />

4. Use the value under `Mounted on` in the `unmount` command.

   <img src="{% asset_path cloud-block-storage/detach-and-delete-cloud-block-storage-volumes/fstab2_0.png %}" width="883" height="328" />

5. Comment out the second line (highlighted in the screenshot) in the
    `/etc/fstab` file to prevent the volume from trying to mount on the next
    boot.

        # umount /dev/xvdb1/

#### Unmount a volume from a Windows server

**Note:** You cannot unmount and detach the operating system disk (C:). For more
information, see the "Detach an operating system disk that uses the
boot-from-volume functionality" section at the end of this article.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. In the Cloud Control Panel, confirm how the volume is presented to the cloud
    server.

3. In the Server Manager, select **File and Storage Services > Disks**.

4. In the Disks section, right-click the Cloud Block Storage volume and select
    **Take Offline**.

5. If the **Take Disk Offline** warning window appears, click **Yes**.

    <img src="{% asset_path cloud-block-storage/detach-and-delete-cloud-block-storage-volumes/win_bringoffline_0.jpeg %}" width="644" height="318" />

The Cloud Block Storage volume no longer displays as a drive under **Computer**.

### Detach a volume

1. Log in to the Cloud Control Panel.

2. In the top navigation bar, click **Storage > Block Storage Volumes**.

3. On the Block Storage Volumes page, click the gear icon next to the volume
    name and select **Detach Volume**.

4. In the pop-up dialog box, click **Detach Volume**.

**Note:** It might take several minutes for the volume to detach.

### Delete a volume

Before you can delete an attached volume, you must detach it from the server. If
a snapshot of the volume exists, you must delete the snapshot before you can
delete the volume.

1. In the top navigation bar of the Cloud Control Panel, click **Storage > Block
    Storage Volumes**.

2. On the Block Storage Volumes page, click the gear icon next to the volume
    name and select **Delete Volume**.

### Detach an operating system disk that uses the boot-from-volume functionality

A bootable Cloud Block Storage volume enables cloud servers to boot the
operating system (Windows or Linux) from a volume instead of local storage. As a
result, detaching a volume that runs the operating system works differently than
detaching a volume that is used as additional storage.

1. Ensure that the `delete-on-termination` flag is set to `False` to preserve the
volume when you delete the cloud server.

    **Note:** The Cloud Control Panel generally sets this flag to `False` by
    default. If you are unsure whether your volume is properly flagged, contact
    Support. For more detailed information, see the `delete-on-termination`
    flag in the examples in [this section of the API documentation](https://developer.rackspace.com/docs/cloud-servers/v2/api-reference/svr-basic-operations/#create-bootable-volume-and-server).

2. [Delete the server](/how-to/deleting-your-server).

After the server is deleted, the volume is in a detached state and is ready to
be attached to another cloud server as an additional volume or to be used with a
new cloud server.
