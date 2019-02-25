---
permalink: increase-size-of-cloud-boot-from-volume-server-system-disk/
audit_date: '2019-01-23'
title: Increase the size of a cloud boot-from-volume server system disk
type: article
created_date: '2019-01-29'
created_by: Rackspace Community
last_modified_date: '2019-01-29'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If you have a cloud boot-from-volume server that is reaching its capacity
limit, you can increase the size of the volume without building a new virtual
machine (VM), or adding disks that give you alternate storage points,
rather than adding to your existing limit.

This article shows you how to detach the boot volume, clone it to a larger
size, and then swap the volumes out and boot the VM.

### Shut off the VM

Before you detach the volume that contains the operating system (OS), you need
to shut off the VM.

To perform this action, use Secure Shell (SSH) and Remote Desktop (RDP) to log
in to the server, then shut it down by using its respective shutdown method.

After you shut off the server, it displays in the Rackspace [Cloud
Control Panel](https://www.login.rackspace.com) as **Shutoff**.

### Detach the volume from the VM

You cannot detach the volume from the VM by using the Cloud Control Panel.
You detach it by using an application programming interface (API) call. We
have developed the Pitchfork tool to make this process easier for you.

Use the following steps to detach the volume from the VM:

1. In your browser, go to the [Pitchfork home page](https://pitchfork.rax.io).
2. Log in to Pitchfork at the top right by using the username and API key that
   you use to log in to the Cloud Control Panel.

   **Note**: To learn how to obtain your API key, see [View and reset
   your API
   key](https://support.rackspace.com/how-to/view-and-reset-your-api-key/).

3. After you are logged in to Pitchfork, select **Cloud Servers**.
4. Scroll to the **Volumes** section. Next to **List Attached Volumes**,
   click **GET**.
5. In the **server_id** field, paste the universally unique identifier (UUID)
   of your VM and click **Send API Call**.

   The response is similar to the following example:

       *
       {
           "volumeAttachments": [
               {
                   "device": "/dev/xvda",
                   "serverId": "0123abcd-1988-4eva-bad2-dabone987",
                   "id": "e5c9b775-13fe-4a1c-8f25-a2af8a99a381",
                   "volumeId": "e5c9b775-13fe-4a1c-8f25-a2af8a99a381"
               }
           ]
       }

       *

6. Record the value that is returned in the `id` field. While this value is
   usually the same as the `volumeId`, we recommend that you verify that
   this is the case.

7. Next, use the following steps to detach the volume by using the
   Pitchfork API call **Unattach Volume From Server**:

   1. Click **DELETE**.
   2. Enter the UUID of your server and the `id` from the
      response to the previous API call.
   3. Click **Send API Call** to detach the volume.

The volume disappears from the **Volumes** list on the **Cloud Server
Details** page for your VM.

### Size up the volume by cloning a larger version

Use the following steps to size up the volume:

1. In the Cloud Control Panel, click **Select a Product > Rackspace Cloud**.

2. In the top navigation bar, select **Storage > Block Storage Volumes**.

3. Find the volume that was the system disk for your server.

   **Note**: It might have a name similar to **System disk for
   0123abcd-1988-4eva-bad2-dabone987**, or the name might be something unique.

4. Click the gear icon next to the volume, then select **Clone Volume**.

5. In the window that appears, enter the **Name**, **Region**, **Type**, and
   **Size** that you want to use for the cloned volume, then click
   **Clone Volume**.

When the volume is ready, you receive a notification, and the status bar to
the left of the volume name on the **Block Storage Volumes** page displays as
green.

#### Attach the new volume to the VM

Use the following steps to attach the new volume to the VM:

1. In Pitchfork, use the API call **Attach Volume To Server**.
2. Click **POST**.
3. Enter the UUID of the server, the UUID of the new volume, and the UUID of the `dev_assignment` that you want to specify  for `/dev/xvda`.
4. Click **Send API Call**.

In the Cloud Control Panel, you see that the volume is attached to your
server, which still displays as **Shutoff**.

### Restart the VM

In the Cloud Control Panel, run the **Reboot** command.

After the VM is in **Active** status, you are able to
log in to the VM again by using SSH and RDP or the [Emergency
Console](/how-to/start-a-console-session/).
