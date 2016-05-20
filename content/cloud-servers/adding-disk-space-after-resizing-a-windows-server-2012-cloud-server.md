---
permalink: adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/
audit_date:
title: Add Disk Space After Resizing a Windows Server 2012 Cloud Server
type: article
created_date: '2013-04-10'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Zach Corleissen
product: Cloud Servers
product_url: cloud-servers
---

After successfully resizing a Windows Cloud Server, you will need to perform
some additional steps in order to utilize the new disk space that is
available for your server. In Windows Server 2012 you can merge the
newly available disk space into one drive by expanding your original
drive.

### Open Computer Management

From the Desktop of your Windows Server 2012 Cloud Server, open
the **Server Manager** and select **Tools > Computer
Management**.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/tools_computer_manager.png %}" alt="" />

### Open Disk Management

Under the **Storage** folder in the left pane, select **Disk
Management**. In the left pane of Disk Management you will see the
current formatted hard drive for your server, generally (C:), and you
should also see an amount of unallocated space in the right pane. In
this example we have a server with 40 GB of hard disk space that we have
resized to 80 GB. That expanded storage space is the unallocated 40 GB.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/disk_managment.png %}" alt="" />

### Extend the Volume

Select the **C:&#92;&#92;** drive and right-click on it.  Choose **Extend
Volume** from the drop down menu.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/extend_volume.png %}" alt="" />

### Extend Volume Wizard

This will open the Extend Volume Wizard. Click **Next** to begin the
process.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/extend_1.png %}" alt="" />

### Select the Volume you wish to Extend

To add all available space to your **C:&#92;&#92;** drive (Disk 0) you can keep
the default selections and press **Next**.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/extend_2.png %}" alt="" />

You will now see the **C:&#92;&#92;** drive expand to the maximum available space.
To finalize the modifications click **Finish**.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/extend_3.png %}" alt="" />

### Verify Disk Space

You will now see the additional disk drive volume that you created. Close Computer Management and begin using the additional space that you
have just created. You can verify that the Extend process worked
correctly by loading the **Computer Manager** from the Server
Manager and checking the disk size for the **C:&#92;&#92;** drive in **Disk
Management**.

<img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/verify.png %}" alt="" />
