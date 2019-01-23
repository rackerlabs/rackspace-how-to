---
permalink: adding-disk-space-after-resizing-a-windows-2003-cloud-server/
audit_date:
title: Add Disk Space After Resizing a Windows 2003 Cloud Server
type: article
created_date: '2012-03-01'
created_by: Rackspace Support
last_modified_date: '2016-05-19'
last_modified_by: Stephanie Fillmon
---

**Note**:  Rackspace no longer offers Cloud Servers with Windows 2003, but these instructions are here for legacy support purposes.

### Format the disk and add an additional drive

1. Using Remote Desktop, log in to your Windows 2003 Cloud Server as Administrator, or with an account that is part of the administrator group.

2. From the Desktop of your Windows Server 2003 Cloud Server, open the **Start Menu** and select **Administrative Tools > Computer Management**.

3. Under the **Storage** folder in the left pane, select **Disk Management**.

   The left pane of Disk Management displays the current formatted hard drive for your server, and the right pane shows the amount of unallocated space.

4. Right-click on the Unallocated space and choose **New Partition** from the menu.

   <img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-2003-cloud-server/Win2003NewPartition.png %}" alt="" />

5. The **New Partition Wizard** pop-up dialog box displays. Click **Next** to begin the wizard.

6. On the Select Partition Type page, select **Primary partition** and click **Next**.

7. On the Specify Partition Size page, choose the amount of available disk space you want to assign to the new partition from the drop down menu in the **Partition size in MB** field, and click **Next**.

   **Note:** The default setting assigns all available disk space to the new partition. By using the drop-down menu in the **Partition size in MB** field, you can choose any portion of your available disk space for the new partition between the minimum and maximum disk space displayed.

8. On the Assign Drive Letter or Path page, choose the drive letter for your new volume and click **Next**.

9. On the Format Partition page, format the partition as an NTFS partition.

   You can also assign a name to the partition in the **Volume label** field. Keep the other settings as default and click **Next**.

   <img src="{% asset_path cloud-servers/adding-disk-space-after-resizing-a-windows-2003-cloud-server/Win2003FormatPartition.png %}" alt="" />

10. The summary screen displays, showing the settings you selected for the partition. Click **Back** to make any changes to the partition settings or click **Finish** to finalize and exit the wizard.

The new partition now appears in the list of volumes in **Disk Management**. You can now close **Computer Management** and begin using the new volume.
