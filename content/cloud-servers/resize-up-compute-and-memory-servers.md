---
permalink: resize-up-compute-and-memory-servers/
audit_date: '2019-02-06'
title: Resize up compute and memory servers
type: article
created_date: '2018-08-30'
created_by: Rackspace Support
last_modified_date: '2019-02-06'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Resize standard and general purpose servers](/how-to/resize-standard-and-general-purpose-servers/)

This article shows you how to use the Cloud Control Panel to resize up a
compute or memory server. Resizing a server changes the RAM and disk space
allocation.

**Note:** You can only resize up compute and memory servers. You can't resize them down.

### Cloud Control Panel

Use the following steps to resize up your servers by using the Cloud
Control Panel:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Servers > Cloud Servers** to view a list of your existing servers.

4. Click the gear icon next to the server that you want to resize, and then
   click **Resize**.

   A pop-up window that lists your server size options displays.

5. Select a new server size, and then click **Resize Server**.

   **Note:** Each server size has a different hourly cost for uptime, and the
   new cost goes into effect when the server resize process completes. This
   could mean that you pay different rates for the same server within a single
   billing cycle.

   A notification displays prompting you to verify the changes that you made to
   your system resources and that there was no adverse impact to your server.

6. Verify that your server was resized correctly by remotely logging in to
   your server and verifying your system resources and file system integrity.

   **Note:** Verification is an important step because it is the last chance
   you have to revert to the original size and cancel any changes to your
   server.

   For a Linux&reg; server, you can Secure Shell (SSH) to either the public or
   private Internet Protocol (IP) address and run the commands `df -h` (hard
   disk usage) and `free -m` (available RAM) to verify the changes.

   For a Windows&reg; server, additional steps are required to use additional
   space after resizing up. For more information, see [Adding Disk Space After
   Resizing a Windows Server 2012 Cloud
   Server](/how-to/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server).

7. After you have verified the system resources and checked your file systems,
   select **Confirm** to confirm the resize or **Revert** to revert to the
   original size.

   Confirming the resize changes the server status. The process is complete
   when the **Status** reads as **Active**, the **Current Action** is
   **None**, and the server has come back up from a reboot. Any web services
   that you had running might require you to log in and manually restart them.

   **Note**: Resizes are automatically confirmed after 24 hours. Therefore,
   you cannot revert a server after you have manually confirmed the resize or
   until 24 hours have passed.

### Pitchfork

You can also use Pitchfork, an interactive web API application that enables you
to interact quickly with Rackspace Cloud products to resize up your server.
Use the following steps to resize up your server by using Pitchfork:

1. Navigate to [Pitchfork](https://pitchfork.rax.io/) and log in by using
   your cloud account username and API key.

2. Click the **Cloud Servers** icon to access the Cloud Servers page.

3. In the **Region** drop-down menu, select the region for the cloud server
   that you want to resize.

4. Scroll down to **List Flavors** and click **Details**. Enter
   **limit=100** for the **Filter** parameter, and then click **Send API Call**.

   <img src="{% asset_path cloud-servers/resize-up-compute-and-memory-servers/pitchfork-list-flavors.png %}" />

5. Find the server that you want to resize and take note of the server
   **UUID** and **flavor_id**. You need these values for the **Resize Server** API call.

6. Scroll down to **Resize Server** and click **Details.** Enter
   the **server_id (UUID)** and **flavor_id** that you gathered in the previous
   step, and then click **Send API Call**.

   <img src="{% asset_path cloud-servers/resize-up-compute-and-memory-servers/pitchfork-resize-server.png %}" />

The server status in the Cloud Control Panel should change to **Resizing**.
After the operation is complete, you must verify the server resize by
navigating to the **Server Details** page for the server that you resized.

<img src="{% asset_path cloud-servers/resize-up-compute-and-memory-servers/pitchfork-verify-resize.png %}" />


### Additional resources

For more information, see the following resources:

- [Cloud Servers API reference: Resize specified server](https://developer.rackspace.com/docs/cloud-servers/v2/api-reference/svr-basic-operations/#resize-specified-server)
- [Pitchfork - the Rackspace Cloud API web application](/how-to/pitchfork-the-rackspace-cloud-api-web-application)
- [Reset a server password](/how-to/reset-a-server-password)
- [Basic Cloud Server security](/how-to/basic-cloud-server-security)
- [Reboot a server](/how-to/reboot-a-server)
- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
- [Delete a server](/how-to/delete-a-server)
