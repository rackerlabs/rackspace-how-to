---
permalink: creating-an-image-backup-cloning/
audit_date: '2018-10-25'
title: Create an image backup (cloning)
type: article
created_date: '2013-02-12'
created_by: Renee Rendon
last_modified_date: '2018-10-25'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

**Note: You can create an image of a General Purpose and Standard flavor
server. For boot-from-volume flavors, the block storage volume needs to
be backed up by using snapshots or Cloud Backup.**

This article guides you through the process of creating an image backup (cloning).

While you can create a different size server from that of the saved image, you
must still use the same base Operating System version.

Use the following steps to create a snapshot image.

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Servers > Cloud Servers**.

4. Select the server that you want to clone by clicking the actions cog
to the left of the server name. From the drop-down menu, click **Create Image**.

   A pop-up window will appear that allows you to name the image.

5. After naming the image, click **Create Image**.

Server images appear in the **Images** list after they have been created.
They can be accessed by clicking on the **View Images** in the **Images** section.
