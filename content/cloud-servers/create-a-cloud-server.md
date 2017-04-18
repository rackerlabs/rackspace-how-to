---
permalink: create-a-cloud-server/
audit_date:
title: Create a cloud server
type: article
created_date: '2012-07-17'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Use the following steps to set up a Cloud Server through the Cloud
Control Panel interface.

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com) and click **Servers > Cloud Servers** in the top navigation bar.

2.  Click **Create Server**.

3.  In the **Details** section, enter a name for your server in
    the **Server Name** field.

4.  From the Region list, select the region in which you want to create
    the server.

    For more information about regions and how to use them effectively, see [About regions](/how-to/about-regions).

5.  In the **Image** area, select which operating system you want to
    use.

    For a complete list of available images, see the [Images section](https://www.rackspace.com/cloud/servers/features#images) of the Cloud Servers product page.

6.  In the **Flavor** section, choose the appropriate configuration for
    the server.

    For more information about flavors, see the [Cloud Core Infrastructure User Guide](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/compute/cloud-servers-product-concepts/flavor-class/#cloud-servers-flavor-class).

7.  *(Optional)* Assign a public key to the server by selecting an
    existing key under **Advanced Options**.

8.  To add a new public key, click **Manage SSH Keys** and perform the following steps:

    1.   On the SSH Keys page, click **Add Public Key**
    2.   If you are adding a public key, give your new public key a name.
    3.   In the **Region** field, confirm or select the region in which your
        key will be used.
    4.   Paste your public key into the **Public Key** field.

      **Note:** If you do not have a public key yet, click [How to get a public key](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os) and follow the instructions in that article. For more information on how to generate a public and private key pairs, see [Manage SSH Keypairs for Cloud Servers with-python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).
    5.   Once you have your entered your Key Name, Region, and the Public
        Key, click **Add Public Key**.

    <img src="{% asset_path cloud-servers/create-a-cloud-server/Screen%20Shot%202015-01-14%20at%209.30.59%20AM.png %}" width="655" height="299" />

9.  Confirm that your key is listed in the SSH Key list for your new
    server.

10. As needed, create a new network and select the PublicNet and
    ServiceNet options.

11. Click **Create Server**.

Your server is built. After it is done being provisioned, your server
displays the status **Running** and is now available for remote
connection. Specific remote connection instructions for your server are
displayed in the side bar on the right of the Cloud Control Panel.

**Next section** - [Create an image from a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
