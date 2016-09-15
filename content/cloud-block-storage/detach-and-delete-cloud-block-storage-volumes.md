---
permalink: detach-and-delete-cloud-block-storage-volumes/
audit_date:
title: Detach and delete Cloud Block Storage volumes
type: article
created_date: '2012-10-22'
created_by: David Hendler
last_modified_date: '2016-06-06'
last_modified_by: Nate Archer
product: Cloud Block Storage
product_url: cloud-block-storage
---

**Previous section:** [Create and use Cloud Block Storage snapshots](/how-to/create-and-use-cloud-block-storage-snapshots)

Detaching a Cloud Block Storage volume will prevent you from writing to
it when you want to take a snapshot. It is also useful when you want to
take a volume offline for archival purposes, or to move a volume to
another server. A Cloud Block Storage volume must be detached before
resizing the server to which it is mounted. You should also detach a
volume before you delete it. In all cases, you must unmount the volume
before you detach it through the Control Panel. The instructions are
below.

### Unmount a volume

There are a few reasons to detach a volume:

-   To prevent writes when you take a snapshot
-   To prevent issues when resizing the server to which it is attached
-   To move it to another Server
-   To delete it

Before you detach a volume from a server, you should unmount it to
prevent errors.

#### Unmount volume from a Linux server

1. Confirm in the Control Panel how the volume is presented to the cloud server.

   At your server, use the **df -h** command to see how it is mounted.

   <img src="{% asset_path cloud-block-storage/detach-and-delete-cloud-block-storage-volumes/mount_point.png %}" width="571" height="122" />

2. Use the value under **Mounted On** in the unmount command.

   <img src="{% asset_path cloud-block-storage/detach-and-delete-cloud-block-storage-volumes/fstab2_0.png %}" width="883" height="328" />

3. Comment out second line (highlighted above) in **/etc/fstab** to prevent the volume from trying to mount on the next boot.

        # umount /dev/xvdb1/

#### Unmount a volume from a Windows server

1.  In the Server Manager, select **File and Storage Services > Disks**.
2.  Under the **Disks** window, right-click the Cloud Block
    Storage volume. Select **Take Offline** from the pop-up menu. If the
    **Take Disk Offline** warning window displays, click **Yes**.

    <img src="{% asset_path cloud-block-storage/detach-and-delete-cloud-block-storage-volumes/win_bringoffline_0.jpeg %}" width="644" height="318" />

The Cloud Block Storage volume no longer displays as a drive under
**Computer**.

### Detach a volume

1. In the Rackspace Cloud Control Panel, click **Block Storage** in the Servers sub-navigation to display the **Block Storage Volumes** screen.

2. Click the Actions button (the cog) next to the volume name. Click the **Detach Volume** link.

3. Click the **Detach Volume** button.

**Note**: It may take several minutes for your Volume to detach.

### Delete a volume

1. In the Rackspace Cloud Control Panel, click **Block Storage** in the Servers sub-navigation to display the **Block Storage Volumes** screen.

2. Click the Actions button (the cog) next to the volume name. Click the **Delete Volume** link.

**Note:** If a snapshot of the volume exists, you cannot delete the
volume until you delete the snapshot.
