---
permalink: preparing-data-disks-on-windows-cloud-servers/
audit_date:
title: Prepare data disks on Windows Cloud Servers
type: article
created_date: '2013-10-31'
created_by: Jered Heeschen
last_modified_date: '2015-10-01'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

The data disks attached to some Cloud Servers flavors, specifically I/O flavors, are 
unformatted when created. Before you can use them to hold data on Windows, they have to be 
prepared by formatting them and assigning each a drive letter.

1. Open the Server Management interface.

    - On Windows Server 2008, right-click the computer's icon and select **Manage**.

    - On Windows Server 2012, click the **Server Manager** button on the taskbar.

2. Navigate to the list of the system's attached storage volumes.

    - On Windows Server 2008, select **Storage** in the left panel, then select **Disk Management**.

    - On Windows Server 2012, select **File and Storage Services** in the left panel, then select **Disks**.

3. For each unassigned disk in the list, delete any existing partitions.

    - On Windows Server 2008, the disk will be displayed in the lower pane with any existing partitions. Right-click an existing partition (if any) and select **Delete** to remove it.

    - On Windows Server 2012, right-click the drive and select **Bring Online**. When the disk is online, right-click the disk and select **Reset Disk** to ensure all disk space is available for your use.

3. For each unassigned disk in the list, run the New Volume Wizard to format it as NTFS and assign it a drive letter.

    - On Windows Server 2008, right-click the disk's unallocated space in the lower pane and select **New Simple Volume**.

    - On Windows Server 2012, right-click the disk and select **New Volume**.

4. Open the Computer window to view your server's active disks and confirm the new volume or volumes are available.

When all drives are formatted and assigned a drive letter you can install any required software to the appropriate drives.
