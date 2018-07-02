---
permalink: resize-standard-and-general-purpose-servers/
audit_date:
title: Resize standard and general purpose servers
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2018-07-01'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Create a Cloud Server](/how-to/create-a-cloud-server)

This article shows how to resize your server&mdash;change the RAM and disk space allocation&mdash;in the Cloud Control Panel.

**Note:** Standard servers can be resized to both smaller and larger servers, but be mindful of the potential for data loss if you size down. General Purpose servers can only be resized to larger servers. All other flavors, OnMetal servers, and any server that boots from a Cloud Block Storage volume cannot be resized.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers > Cloud Servers** to view a list of your existing servers.

3. Click the gear icon next to the server which you want to resize, and then click **Resize**.

   A pop-up window listing your server size options is displayed.

4. Choose your new server size and then click **Resize Server**.

   **Note:** Each server size has a different hourly cost for uptime, and the new cost goes into effect when the server resize process is completed. This could mean that you pay different rates for the same server within a given billing cycle.

   A notification displays prompting you to verify the changes made to your system resources and that there was no adverse impact to your server.

5. Verify that your server was resized correctly by remotely logging in to your server and verifying your system resources and filesystem integrity.

   **Note:** Verification is an important step because it is the last chance you will have to revert to the original size and cancel any changes to your server. Do not rely on the availability of your website as an indicator of whether the resize was successful, as certain server processes may be suspended while the resize is waiting to be verified.

   For a Linux server, you can SSH to either the public or private IP address and run the commands `df -h` (Hard Disk usage) and `free -m` (available RAM memory) to verify the changes.

   For a Windows server, there are additional steps required to use the additional space after a resize.  Please follow the instructions from this article: [Adding Disk Space After Resizing a Windows Server 2012 Cloud Server](/how-to/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server)

6. Now that you've verified the system resources and checked your filesystems, you can choose to **Confirm** the resize or **Revert** to the original size.  

   Choosing to Confirm the resize will change the server status. The process will be complete when the **Status** reads **Active**, the **Current Action** is **None**, and the server has come back up from a reboot. Any web services that you had running may require you to log in and manually restart them.

### Additional resources

- [Reset your server password](/how-to/reset-your-server-password)
- [Basic Cloud Server security](/how-to/basic-cloud-server-security)
- [Reboot your server](/how-to/reboot-your-server)
- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
- [Delete your server](/how-to/deleting-your-server)
