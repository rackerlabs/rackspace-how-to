---
permalink: adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/
audit_date:
title: Add Disk Space After Resizing a Windows Server 2012 Cloud Server
type: article
created_date: '2013-04-10'
created_by: Rackspace Support
last_modified_date: '2016-06-10'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

After successfully resizing a Windows Cloud Server, you will need to perform
some additional steps in order to utilize the new disk space that is
available for your server. In Windows Server 2012 you can merge the
newly available disk space into one drive by expanding your original
drive.

### Extend your drive

1. From the desktop of your Windows Server 2012 Cloud Server, open
the **Server Manager** and select **Tools > Computer Management**.

2. Under the **Storage** folder in the left pane, select **Disk
Management**.

   The left pane of Disk Management displays the current formatted hard drive for your server, generally (C:), and the right pane displays the amount of unallocated space.

3. Select the **C:&#92;&#92;** drive and right-click on it. Choose **Extend
Volume** from the drop down menu.

   This will open the Extend Volume Wizard. Click **Next** to begin the process.

4. To add all available space to your **C:&#92;&#92;** drive (Disk 0) you can keep
the default selections and press **Next**.

   <img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/extend_2.png %}" alt="" />

   You will now see the **C:&#92;&#92;** drive expand to the maximum available space.

5. To finalize the modifications click **Finish**.

### Verify disk space

The additional disk drive volume is now displayed in Computer Management and is available to use.

You can verify that the Extend process worked correctly by loading the **Computer Manager** from the Server
Manager and checking the disk size for the **C:&#92;&#92;** drive in **Disk
Management**.
