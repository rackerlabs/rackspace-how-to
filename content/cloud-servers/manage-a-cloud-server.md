---
permalink: manage-a-cloud-server/
audit_date: '2018-07-02'
title: Manage a Cloud Server
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2018-07-01'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article describes the different methods for performing server management tasks in the Cloud Control Panel. You can use the Cloud Control Panel to perform administrative tasks in as few clicks as possible.

### Accessing server management tasks

You can use the gear menu or the **Actions** menu to perform management operations on your server.

#### Gear menu

When you click **Servers** > **Cloud Servers** at the top of the page, you see a list of your servers. To the left of each server name is a gear icon. Click the icon to view a menu of the operations that you can perform on your server.

#### Actions menu

If you click on a server name, the **Server Details** page appears. The **Actions** menu is in the upper-right corner of the page. This menu contains the same operations that are available in the gear menu.

### Perform server management tasks

You can use the gear icon or the **Actions** menu to perform the following server management tasks.

#### Identify your server

You can rename your server or add tags (descriptive labels) to it:

- Click **Rename** to change the server name.
- Click **Add Tag** to add new tags or remove existing tags.  For more information on tags, see [Using Tags](/how-to/using-cloud-servers-tags).

#### Image and recover your server

You can create an image of a server or rebuild a server from a previously saved image:

- Click **Create Image** to create a snapshot image of your server.
- Click **Schedule Image** to create manual or scheduled images from your running servers.
- Click **Rebuild From Image** to overwrite your current server with a previously saved
  image or a new image of your choosing.
- Click **Enter Rescue Mode** to troubleshoot and perform security checks on your server.

#### Manage your server

You can perform the following essential management tasks without logging directly into your server:

- Click **Emergency Console** to open the Linux shell window or Windows® command prompt window
  so that you can issue commands directly on your server.
- Click **Reboot** to restart the server.
- Click **Resize** to vertically scale your computing power (not available for all servers).
- Click **Change Password** to change the root password on Linux servers or the password for the administrator on Windows®.

    **Note:** This command requires an automatic reboot of your server. Remember to save your data before issuing this command.

- Click **Delete Server** to delete a server when you no longer need it. You will lose any saved data and the IP address assigned to the server.

### Using direct edit links

On the Server Details page for a particular server, items that are instantly configurable have links to the right of them.

<img src="{% asset_path cloud-servers/managing-my-server/1512NewImage-1.png %}" width="369" height="275" alt="" border="1"  />

For example, next to the **System Image** field, you can click **Rebuild** to rebuild your server from a default Rackspace image or a previously saved image. You specify the required information in the popup dialog box and then click **Rebuild Server**.

<img src="{% asset_path cloud-servers/managing-my-server/1512NewImage-2.png %}" width="465" height="268" alt="" border="1"  />

### Related Information

[Learn More About Cloud Servers](/how-to/learn-more-about-cloud-servers)
