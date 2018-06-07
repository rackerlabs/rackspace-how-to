---
permalink: create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/
audit_date: '2018-06-07'
title: Create an image of a server and restore a server from a saved image
type: article
created_date: '2012-07-15'
created_by: Rackspace Support
last_modified_date: '2018-06-07'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to create an image of a cloud server (also known as cloning a server) and restore a server from a saved image in the Cloud Control Panel. For information about using the Cloud Servers API to create an image from a server, see the [Create Image section in the Cloud Servers Developer Guide](http://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#create-image-of-specified-server).

### Prerequisites

- [Create a cloud server](/how-to/create-a-cloud-server)

#### Notes

- An image can be restored only to a server that has enough system disk capacity to accommodate the data in the image.

- Servers that boot from a Cloud Block Storage volume cannot be imaged. Use Cloud Block Storage snapshots to copy the boot volume instead. For more information, see [Create and use Cloud Block Storage snapshots](/how-to/create-and-use-cloud-block-storage-snapshots).

- Images do not include attached data disks or Cloud Block Storage volumes, only a local system disk. Data disks must be backed up using a Cloud Block Storage volume, Cloud Backup, or another backup solution. For more information about Cloud Backup, see [Getting started with Rackspace Cloud Backup](/how-to/cloud-backup).

-  Image backups are designed primarily to speed deployment of new servers and not as a robust backup solution. As such, there are a number of practical limitations in place. You can find a list of these limitations in the next article in the series [Cloud Server image limitations](/how-to/rackspace-cloud-essentials-cloud-server-image-limitations).

### Create an image backup

**Note:** The process of building a server from a previous backup image can be a time-consuming process depending on the size of the server.

Use the following steps to create an image backup:

1. Log in to the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com/).

2. In the top navigation bar, click **Servers** and **Cloud Servers**.

3. Click on the server that you want to clone.

4. After the **Server Information** page loads, click **Actions** and select **Create Image**.

    <img src="{% asset_path cloud-servers/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/Screen%20Shot%202015-01-12%20at%205.25.09%20AM.png %}" width="160" height="364" border="2" alt=""  />

5. Enter a name for the image and click **Create Image**.

After the image is saved, it appears in the **Images** section of the **Server Information** page.

### Restore a server from a saved image

Use the following steps to restore a server from a saved image:

1. In the top navigation bar of the Cloud Control Panel, click **Servers > Saved Images**.

2. Click the gear icon next to the image that you want to use to build a server.

3. Select **Create Server with Image**.

4. Enter a name for your server and select the region.

5. In the **Flavor** section, select the flavor class and configure sizing options.

6. *(Optional)* Under **Advanced Options**, perform the following actions:

     1. Select an SSH key to add to the server's root account (if available).

     2. Select a Cloud Network to attach the server to.

     3. Choose the disk configuration option to use (if available).

7. Click **Create Server**.

8. When presented with your root admin password, copy the password to a secure location and then click **Dismiss Password**.

	<img alt="" src="{% asset_path cloud-servers/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/1405-7.png %}" border="2" />

While your server goes through the build process, a **Building** notification is displayed.

After the server is created, its status is displayed as **Active**. You can then log in to it by using Remote Desktop Protocol (RDP) for Windows&reg; or SSH for Linux&reg;, depending on your server's operating system.

### Next section

[Snapshot limitations](/how-to/rackspace-cloud-essentials-cloud-server-image-limitations)
