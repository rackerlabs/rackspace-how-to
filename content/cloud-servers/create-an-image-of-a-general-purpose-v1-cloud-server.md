---
permalink: create-an-image-of-a-general-purpose-v1-cloud-server/
audit_date:
title: Create an image of a General Purpose v1 Cloud Server
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article walks you through creating an on-demand image of a General
Purpose v1 Cloud Server. You can also schedule a daily image for your
Cloud Servers using the Cloud Control Panel. If you are interested in
creating an image of a virtual cloud server, see [Creating an image of your Performance Flavor Server with the Control Panel](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).

**Note**: This is an optional service that incurs storage and bandwidth
charges on Cloud Files, however the convenience of easily restoring a
server from a saved image is extremely valuable. We strongly recommend
scheduling the creation of server images.

### Create an Image

1.  Log into the Cloud Control Panel.

2.  Locate the server you want to create an image of.

3.  Click the **Actions** gear icon to the left of the server name and
    select **Create Image**.

    A pop-up appears so you can name the image.

4.  (Optional) Enter a new image name in the pop-up for the image. If
    you don't enter a name, the server name is used as the image name.

5.  Click **Create Image**.

When the image is created, you'll receive a notification informing you
that the image is available. When the image is ready, the server's
status changes to Running and the status bar is green. You can use now
use this image to create a new server (using this image as a template)
or to restore the server.

Alternatively you can create an on-demand image using
the **Actions** menu from the details page of a specific server:

### Locate a Saved Image

To locate a previously saved image, do the following:

1.  Open the Cloud Control Panel.

2.  Click **Create Server**. Now you'll see two tabs in the Images
    section, **Rackspace** and **Saved**.

3.  Click the **Saved** tab. All your saved images appear on this tab.
