---
permalink: resize-standard-and-general-purpose-servers/
audit_date:
title: Resize standard and general purpose servers
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2018-08-15'
last_modified_by: Brian King
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Create a Cloud Server](/how-to/create-a-cloud-server)

This article shows how to resize your server (change the vCPU, RAM and sometimes disk size) in the Cloud Control Panel.

**Note:** Standard flavor Linux servers using the deprecated "PV" virtualization mode can resize down, but be mindful of the potential for data loss if you size down.  OnMetal servers cannot be resized at all. All other flavors can resize up only. (note: I/O flavors cannot resize through the portal yet. Contact Rackspace Support if you would like to resize up an I/O flavor server).

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers > Cloud Servers** to view a list of your existing servers.

3. Click the gear icon next to the server which you want to resize, and then click **Resize**.

   A pop-up window listing your server size options is displayed.

4. Choose your new server size and then click **Resize Server**.

   **Note:** Each server size has a different hourly cost for uptime, and the new cost goes into effect when the server resize process is completed. This could mean that you pay different rates for the same server within a given billing cycle.

   A notification displays prompting you to verify the changes made to your system resources and that there was no adverse impact to your server.

5. Verify that your server was resized correctly by remotely logging in to your server and verifying your system resources and filesystem integrity.

   **Note:** Verification is an important step because it is the last chance you will have to revert to the original size and cancel any changes to your server. Do not rely on the availability of your website as an indicator of whether the resize was successful, as certain server processes may be suspended while the resize is waiting to be verified.

   For a Linux server, you can SSH to either the public or private IP address and run the commands `nproc` (number of processors), `df -h` (Hard Disk usage), `free -m` (available RAM memory) to verify the changes. Note that servers booted from a Cloud Block Storage volume will not gain disk space after a resize.

   For a Windows server, there are additional steps required to use the additional space after a resize.  Please follow the instructions from this article: [Adding Disk Space After Resizing a Windows Server 2012 Cloud Server](/how-to/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server)

6. Now that you've verified the system resources and checked your filesystems, you can choose to **Confirm** the resize or **Revert** to the original size.  After 24 hours, the resize is automatically confirmed and you will no longer be able to revert.

   Choosing to Confirm the resize will change the server status. The process will be complete when the **Status** reads **Active**, the **Current Action** is **None**, and the server has come back up from a reboot. Any web services that you had running may require you to log in and manually restart them.

### Additional resources

- [Reset your server password](/how-to/reset-your-server-password)
- [Basic Cloud Server security](/how-to/basic-cloud-server-security)
- [Reboot your server](/how-to/reboot-your-server)
- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
- [Delete your server](/how-to/deleting-your-server)
