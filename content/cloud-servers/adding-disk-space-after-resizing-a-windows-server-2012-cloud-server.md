---
permalink: adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/
audit_date: '2019-01-24'
title: Add disk space after resizing a Windows Server 2012 Cloud Server
type: article
created_date: '2013-04-10'
created_by: Rackspace Support
last_modified_date: '2019-01-23'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

After you resize a Windows&reg; Cloud Server, you need to perform
some additional steps to use the new disk space that is
available for your server. In Windows Server&reg; 2012 you can merge the
newly available disk space into one drive by expanding your original
drive.

### Extend your drive

Use the following steps to extend your drive:

1. From the desktop of your Windows Server 2012 Cloud Server, open
   the **Server Manager** and select **Tools > Computer Management**.

2. Under the **Storage** folder in the left pane, select **Disk
   Management**.

    The left pane of **Disk Management** displays the current formatted hard
    drive for your server, generally **C:&#92;**, and the right pane
    displays the amount of unallocated space.

3. Select the **C:&#92;** drive and right-click on it. Choose **Extend
   Volume** from the drop-down menu.

    The Extend Volume Wizard opens. Click **Next** to begin the Extend Volume
    process.

4. To add all available space to your **C:&#92;** drive (**Disk 0**), you
   can keep the default selections and press **Next**, as shown in the
   following image:

    <img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server/extend_2.png %}" alt="" />

    The **C:&#92;** drive expands to the maximum available space.

5. To finalize the modifications, click **Finish**.

### Verify disk space

The additional disk drive volume now displays in **Computer Management** and is
available to use.

You can verify that the Extend Volume process worked correctly by loading the
**Computer Manager** from the **Server Manager** and checking the disk size for
the **C:&#92;** drive in **Disk Management**.
