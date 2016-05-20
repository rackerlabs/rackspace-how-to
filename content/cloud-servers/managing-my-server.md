---
permalink: managing-my-server/
audit_date:
title: Manage a Cloud Server
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-11'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

You can use the Cloud Control Panel to perform administrative tasks in as few clicks as 
possible. This article describes the different methods for performing server management 
tasks in the control panel.

### Identifying server types

Two types of servers can be listed on the Cloud Servers page in the control panel:

- Next Generation Cloud Servers powered by OpenStack.
- First Generation Cloud Servers, our legacy Cloud Server offering.

For a comparison of the features of First and Next Generation Cloud Servers, see 
[Next-Generation Cloud Migration Considerations and Options](/how-to/next-generation-cloud-servers-migration-considerations-and-options).

You can identify First Generation Cloud Servers in the control panel by the blue asterisk 
that follows the server name.

<img alt="First Generation Cloud Server" height="169" src="{% asset_path cloud-servers/managing-my-server/First_Generation_Server.png %}" title="" width="219" border="1" />

You can also filter your servers by type.

<img alt="" height="408" src="{% asset_path cloud-servers/managing-my-server/Server%20Type%20Filter.png %}" title="" width="177" border="1" />

### Accessing server management tasks

You can use the gear menu or the Actions menu to perform management operations on your server.

#### Gear menu

When you open the Cloud Control Panel or click **Servers** at the top of the page, you see 
a list of your servers. To the left of each server name is a gear icon. Click the icon to 
view a menu of the operations that you can perform on your server.

<img alt="Actions Cog" height="371" src="{% asset_path cloud-servers/managing-my-server/Actions%20Cog%20Expanded_0.png %}" title="" width="169" border="1" />

#### Actions menu

If you click on a server name, the Server Details page appears. The Actions menu is in the 
upper-right corner of the page. This menu contains the same operations that are available 
in the gear menu.

<img alt="Actions Menu" height="253" src="{% asset_path cloud-servers/managing-my-server/Actions%20Menu.png %}" title="" width="585" border="1" />

### Performing server management tasks

You can use the gear menu or the Actions menu to perform the following server management tasks.

#### Identify Your Server

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

- Click **Connect Via Console** to open Linux shell window or Windows command prompt window 
  so that you can issue commands directly on your server.
- Click **Reboot** to restart the server.
- Click **Resize** to vertically scale your computing power (not available for all servers).
- Click **Change Password** to change the root password on Linux servers or the Administrator 
  password on Windows.
    **Note:** This command requires an automatic reboot of your server. Remember to save your data before issuing this command.
- Click **Create Check**
- Click **Delete Server** to delete a server when you no longer need it. You will lose any 
  saved data and the IP address assigned to the server.

### Using direct edit links

On the Server Details page for a particular server, items that are instantly configurable 
have links to the right of them.

<img src="{% asset_path cloud-servers/managing-my-server/1512NewImage-1.png %}" width="369" height="275" alt="" border="1"  />

For example, next to the **System Image** field, you can click **Rebuild** to rebuild your 
server from a default Rackspace image or a previously saved image. You specify the required 
information in the popup dialog box and then click **Rebuild Server**.

<img src="{% asset_path cloud-servers/managing-my-server/1512NewImage-2.png %}" width="465" height="268" alt="" border="1"  />

### Related Information

[Learn More About Cloud Servers](/how-to/learn-more-about-cloud-servers)
