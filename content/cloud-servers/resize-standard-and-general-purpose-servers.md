---
permalink: resize-standard-and-general-purpose-servers/
audit_date:
title: Resize standard and general purpose servers
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2018-08-15'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Create a Cloud Server](/how-to/create-a-cloud-server)

This article shows how to resize your server in the Cloud Control Panel.
Resizing a server changes the RAM and disk space allocation.

**Note:** Standard servers that are running Microsoft Windows cannot be
resized down. All other standard servers can be resized either up or down.
However, be aware of the potential for data loss if you size down. General
Purpose servers can only be resized to larger servers. All other flavors,
OnMetal servers, and any server that boots from a Cloud Block Storage volume
cannot be resized.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers > Cloud Servers** to view a list
   of your existing servers.

3. Click the gear icon next to the server that you want to resize, and then
   click **Resize**.

   A pop-up window that lists your server size options is displayed.

4. Choose your new server size and click **Resize Server**.

   **Note:** Each server size has a different hourly cost for uptime, and the
   new cost goes into effect when the server resize process is complete. This
   could mean that you pay different rates for the same server within a single
   billing cycle.

   A notification displays that prompts you to verify the changes you made to
   your system resources and that there was no adverse impact to your server.

5. Verify that your server was resized correctly by remotely logging in to
   your server and verifying your system resources and file system integrity.

   **Note:** Verification is an important step because it is the last chance
   you have to revert to the original size and cancel any changes to your
   server. Do not rely on the availability of your website as an indicator of
   whether the resize was successful, because certain server processes may be
   suspended while the resize is waiting to be verified.

   For a Linux server, you can SSH to either the public or private IP address
   and run the commands `df -h` (Hard Disk usage) and `free -m` (available RAM
   memory) to verify the changes.

   For a Windows server, there are additional steps required to use the
   additional space after a resize. Please follow the instructions from this
   article: [Adding Disk Space After Resizing a Windows Server 2012 Cloud
   Server](/how-to/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server)

6. After you have verified the system resources and checked your file systems,
   select **Confirm** to confirm the resize or **Revert** to revert to the
   original size.  

   Confirming the resize changes the server's status. The process is complete
   when the **Status** reads **Active**, the **Current Action** is **None**,
   and the server has come back up from a reboot. Any web services that you
   had running may require you to log in and manually restart them.

### Additional resources

- [Reset your server password](/how-to/reset-your-server-password)
- [Basic Cloud Server security](/how-to/basic-cloud-server-security)
- [Reboot your server](/how-to/reboot-your-server)
- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
- [Delete your server](/how-to/deleting-your-server)
