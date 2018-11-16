---
permalink: creating-a-general-purpose-cloud-server/
audit_date: '2018-10-26'
title: Create a general purpose Cloud Server
type: article
created_date: '2013-10-16'
created_by: Kyle Laffoon
last_modified_date: '2018-10-26'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to set up a general purpose Cloud Server
through the Cloud Control Panel. For more information about General Purpose
servers, see [New Features in General Purpose and Work-Optimized Cloud Servers](/how-to/new-features-in-general-purpose-and-work-optimized-cloud-servers).

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Create a server from a saved image, or create a new server.
    -   To create a server from a previously saved image,
        select **Servers > Cloud Servers > Saved Images**. Click the gear icon
        next to the image that you want to use to create the server, and
        select **Create Server with Image**. Skip to step 3.

        <img src="{% asset_path cloud-servers/creating-a-general-purpose-cloud-server/SavedImages.png %}" alt="" />

    -   To create a new server, select **Servers > Cloud Servers**, and then
        click **Create Server**.

4.  In the **Server Details** section, enter a name for your server in the
    **Server Name** field.

5.  From the **Region** menu, select the region where you want the
    server to reside.

    For example, select **Chicago (ORD)** to house the server in a data
    center in Chicago, Illinois, USA, or select **Sydney (SYD)** for a
    data center in Sydney, Australia.

6. Select the **OnMetal&trade;** tab.

7.  Under **Image**, select which **Image Type**, **Operating System**, and
    **Version** that you want to use. If you are creating the server from a saved
    image, the image is already selected.

8.  In the **Flavor** section, select the flavor class and specific
    flavor for your server.

    <img src="{% asset_path cloud-servers/creating-a-general-purpose-cloud-server/FlavorImg.png %}" alt="" />

9.  In the **Advanced Options** section, click **Select Networks** and
    choose the networks to which your server will be connected.
    Click **Select Networks**.

10.  Click **Create Server**.

11.  When your root admin password is displayed, copy the password to a
    secure location, and then click **Dismiss Password**.

12. After your server is created, its status is displayed as Active. You
    can then log in to it by using Remote Desktop Protocol (RDP) or SSH,
    depending on your server's OS.
