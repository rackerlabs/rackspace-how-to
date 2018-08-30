---
permalink: resize-up-compute-and-memory-servers/
audit_date: '2018-08-30'
title: Resize up compute and memory servers
type: article
created_date: '2018-08-30'
created_by: Rackspace Support
last_modified_date: '2018-08-30'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Resize standard and general purpose servers](/how-to/resize-standard-and-general-purpose-servers/)

This article shows you how to resize up a computer or memory server by using
the Cloud Control Panel. Resizing a server changes the RAM and disk space
allocation.

**Note:** Compute and memory servers can only be resized up. They can’t be
resized down.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers > Cloud Servers** to view a list
   of your existing servers.

3. Click the gear icon next to the server that you want to resize, and then
   click **Resize**.

   A pop-up window that lists your server size options is displayed.

4. Select a new server size and then click **Resize Server**.

   **Note:** Each server size has a different hourly cost for uptime, and the
   new cost goes into effect when the server resize process is completed. This
   could mean that you pay different rates for the same server within a single
   billing cycle.

   A notification displays prompting you to verify the changes you made to
   your system resources and that there was no adverse impact to your server.

5. Verify that your server was resized correctly by remotely logging in to
   your server and verifying your system resources and filesystem integrity.

   **Note:** Verification is an important step because it is the last chance
   you will have to revert to the original size and cancel any changes to your
   server.

   For a Linux server, you can Secure Shell (SSH) to either the public or
   private IP address and run the commands `df -h` (Hard Disk usage) and
   `free -m` (available RAM memory) to verify the changes.

   For a Windows server, additional steps are required to use additional space
   after resizing up. For more information, see [Adding Disk Space After
   Resizing a Windows Server 2012 Cloud
   Server](/how-to/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server).

6. After you have verified the system resources and checked your file systems,
   select **Confirm** to confirm the resize or **Revert** to revert to the
   original size.

   Confirming the resize changes the server status. The process is complete
   when the **Status** reads as **Active**, the **Current Action** is
   **None**, and the server has come back up from a reboot. Any web services
   that you had running may require you to log in and manually restart them.

   **Note**: Resizes are automatically confirmed after 24 hours. Therefore,
   you cannot revert a server after you have manually confirmed the resize or
   after 24 hours have passed.

### Additional resources

For more information, see the following resources:

- [Cloud Servers API reference: Resize specified server](https://developer.rackspace.com/docs/cloud-servers/v2/api-reference/svr-basic-operations/#resize-specified-server)
- [How to Resize Compute and Memory Flavor Servers: Pitchfork method](https://community.rackspace.com/general/f/general-discussion-forum/8567/how-to-resize-compute-and-memory-flavor-servers) (scroll to "Pitchfork method" section)
- [Reset your server password](/how-to/reset-your-server-password)
- [Basic Cloud Server security](/how-to/basic-cloud-server-security)
- [Reboot your server](/how-to/reboot-your-server)
- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
- [Delete your server](/how-to/deleting-your-server)
