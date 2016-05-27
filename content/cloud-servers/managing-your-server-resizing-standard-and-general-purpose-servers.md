---
permalink: managing-your-server-resizing-standard-and-general-purpose-servers/
audit_date:
title: Manage your server - resizing standard and general purpose servers
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2016-01-04'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Create a Cloud Server](/how-to/create-a-cloud-server)

In this article, we dicuss the process for resizing your server -
changing the RAM and disk space allocation. Note that at this time,
Windows servers can be resized to a larger allocation but cannot be
resized down to a lesser allocation. Standard Cloud Servers can be
resized up or down. General Purpose Servers can only be resized up.

-   To allow you to easily scale your server by increasing the amount of
    Disk Space and RAM on your server, click the **Resize** button.

    <img src="{% asset_path cloud-servers/managing-your-server-resizing-standard-and-general-purpose-servers/8_Resizenew.png %}" alt="" />

-   Notice the pop-up window listing your server size options. Each
    server size has a different hourly cost for uptime, and the new cost
    goes into effect when the server resize process is completed. This
    could mean that you pay different rates for the same server
    within a given billing cycle. Press the **Resize Server** button
    to begin.

    <img src="{% asset_path cloud-servers/managing-your-server-resizing-standard-and-general-purpose-servers/9_ResizeProcessnew.png %}" alt="" />

-   Next, choose your new **Server Size**. Each server size has
    a different hourly cost for uptime, and the new cost goes into
    effect when the server resize process is completed. This could mean
    that you pay different rates for the same server within a given
    billing cycle. Note that Windows servers cannot be resized down, so
    smaller sizes are grayed out. Press the **Resize** button
    to begin.

-   Notice the **Status** change on the server details screen
    throughout the Resize process, going through modes such
    as *Preparing* and *Queueing for Resize*.

-   **Verify the Resize.** This is an important step because it is the
    last chance you will have to revert to the original size and cancel
    any changes to your server. You will receive a notification
    prompting you to verify the changes made to your system resources
    and to verify that there was no adverse impact to your server. The
    best way to do this is to remotely login to your server and verify
    your system resources and filesystem integrity. Do not rely on the
    availability of your website as an indicator of whether the resize
    was successful, as certain server processes may be suspended while
    the resize is waiting to be verified.

    <img src="{% asset_path cloud-servers/managing-your-server-resizing-standard-and-general-purpose-servers/14_ConfirmRollbacknew.png %}" alt="" />

-   For a Linux server, you can SSH to either the public or private IP
    address and run the commands 'df -h' (Hard Disk usage) and 'free -m'
    (available RAM memory) to verify the changes.  Below you can see
    that my server, which previously had 10 GB of HD space and 256 MB of
    RAM, now has 20 GB of HD space and 500 MB of RAM.

    **Note:** For a Windows server, there are additional steps required
    to use the additional space after a resize.  Please follow the
    instructions from this article: [Adding Disk Space After Resizing a Windows Server 2012 Cloud Server](/how-to/adding-disk-space-after-resizing-a-windows-server-2012-cloud-server)

    <img src="{% asset_path cloud-servers/managing-your-server-resizing-standard-and-general-purpose-servers/15_VerifyResizeSSH.png %}" alt="" />

-   Now that you've verified the system resources and checked your
    filesystems, you can choose to **Confirm** the resize
    or **Revert** to the original size.  Choosing to Confirm the resize
    will change the server status. The process will be complete when
    the **Status** reads **Active**, the **Current Action** is **None**,
    and the server has come back up from a reboot. Any web services
    that you had running may require you to log in and manually
    restart them.

### Next section

[Reset your server password](/how-to/reset-your-server-password)
