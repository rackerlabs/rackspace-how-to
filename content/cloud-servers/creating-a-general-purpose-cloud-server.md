---
permalink: creating-a-general-purpose-cloud-server/
audit_date:
title: Create a General Purpose cloud server
type: article
created_date: '2013-10-16'
created_by: Kyle Laffoon
last_modified_date: '2016-01-11'
last_modified_by: Rose Coste
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to set up a General Purpose cloud server
through the Cloud Control Panel interface. For more information about
General Purpose servers, see [New Features in General Purpose and Work-Optimized Cloud Servers](/how-to/new-features-in-general-purpose-and-work-optimized-cloud-servers).

1.  Log in to the [Cloud Control Panel.](https://mycloud.rackspace.com)

2.  Create a server from a saved image, or create a new server.
    -   To create a server from a previously saved image,
        select **Servers > Saved Images**. Click the gear icon next
        to the image that you want to use to create the server, and
        select **Create Server with Image**. Skip to step 3.

        <img src="{% asset_path cloud-servers/creating-a-general-purpose-cloud-server/SavedImages.png %}" alt="" />

    -   To create a new server, select **Cloud Servers > Create
        Servers**, and then click **Create Server**.

3.  In the **Server Details** section of the Create Servers page, enter
    a name for your server in the **Server Name** field.

4.  From the **Region** menu, select the region where you want the
    server to reside.

    For example, select **Chicago (ORD)** to house the server in a data
    center in Chicago, Illinois, USA, or select **Sydney (SYD)** for a
    data center in Sydney, Australia.

5.  Under **Image** select which OS you want to use. If you are
    creating the server from a saved image, the image is already
    selected.

6.  In the **Flavor** section, select the flavor class and specific
    flavor for your server.

    <img src="{% asset_path cloud-servers/creating-a-general-purpose-cloud-server/FlavorImg.png %}" alt="" />

7.  In the **Advanced Options** section, click **Select Networks** and
    choose the networks to which your server will be connected.
    Click **Select Networks**.

8.  Click **Create Server**.

9.  When your root admin password is displayed, copy the password to a
    secure location, and then click **Dismiss Password**.

10. After your server is created, its status is displayed as Active. You
    can then log in to it by using Remote Desktop Protocol (RDP) or SSH,
    depending on your server's OS.
