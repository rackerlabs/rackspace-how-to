---
permalink: resize-standard-and-general-purpose-servers/
audit_date:
title: Resize standard and general purpose servers
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2018-08-16'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Create a Cloud Server](/how-to/create-a-cloud-server)

This article shows how to resize your server in the Cloud Control Panel. Resizing a server changes the vCPU and RAM, and 
might also change disk size. 

**Note:** Standard flavor Linux servers that use the deprecated paravirtual (PV) virtualization mode can resize down. 
However, be aware of the potential for data loss if you size down. OnMetal servers cannot be resized either up or down. 
All other flavors can only resize up. I/O flavors cannot resize through the Cloud Control Panel at this time. Contact 
Rackspace Support if you want to resize up an I/O flavor server.

Use the following steps to resize a server:

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers > Cloud Servers** to view a list of your existing servers.

3. Click the gear icon next to the server that you want to resize, then click **Resize**.

   A pop-up window that lists your server size options is displayed.

4. Select a new server size and click **Resize Server**.

   **Note:** Each server size has a different hourly cost for uptime, and the new cost goes into effect when the server 
   resize process is complete. This might mean that you pay different rates for the same server within a single billing 
   cycle.

   A notification displays that prompts you to verify the changes you made to your system resources and that there was no 
   adverse impact to your server.

5. Verify that the server was resized correctly by remotely logging in to the server and verifying your system resources and 
   file system integrity.

   **Note:** Verification is an important step because it is the last chance you have to revert to the original size and 
   cancel any changes to your server. Do not rely on the availability of your website as an indicator of whether the resize 
   was successful, because certain server processes may be suspended while the resize is waiting to be verified.

   With a Linux server, you can use Secure Shell (SSH) to connect to either the public or private IP address for the server 
   and run the following commands to verify the changes:
   
   - `nproc`: Number of processors
   - `df -h`: Hard disk usage
   - `free -m`: Available RAM memory
   
   **Note**: Servers that were booted from a Cloud Block Storage volume do not gain disk space after a resize.

   With a Windows server, you must complete additional steps in order to use the additional space after a resize. For more 
   information, see [Adding Disk Space After Resizing a Windows Server 2012 Cloud Server](/how-to/adding-disk-space-after-
   resizing-a-windows-server-2012-cloud-server).

6. After you've verified the system resources and checked your file systems, select **Confirm** to confirm the resize or 
   **Revert** to revert to the original size. After 24 hours have passed, the resize is automatically confirmed and you are 
   no longer able to revert the changes.

   Confirming the resize changes the server's status. The process is complete when the **Status** reads **Active**, the 
   **Current Action** is **None**, and the server has come back up from a reboot. Any web services that were running may 
   require you to log in and manually restart them.

### Additional resources

- [Reset your server password](/how-to/reset-your-server-password)
- [Basic Cloud Server security](/how-to/basic-cloud-server-security)
- [Reboot your server](/how-to/reboot-your-server)
- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
- [Delete your server](/how-to/deleting-your-server)
