---
permalink: create-a-cloud-server/
audit_date: '2018-10-26'
title: Create a cloud server
type: article
created_date: '2012-07-17'
created_by: Rackspace Support
last_modified_date: '2018-10-26'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Use the following steps to set up a [cloud
server](https://www.rackspace.com/cloud/servers) through the Cloud
Control Panel interface.

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Servers > Cloud Servers**.

    **Note:** On the Dashboard in the Cloud Control Panel, you can click
    **Server** in the **Quick Build** section to go directly to the **Create Server** page.

4.  Click **Create Server**.

5.  In the **Server Details** section, enter a name for your server in
    the **Server Name** field.

6.  From the Region list, select the region in which you want to create
    the server.

    For more information about regions and how to use them effectively, see [About regions](/how-to/about-regions).

7.  In the **Image** section, select the operating system that you want to
    use.

    For a complete list of available images, see the [Images section](https://www.rackspace.com/cloud/servers/features#images)
    of the Cloud Servers product page.

8.  In the **Flavor** section, choose the appropriate configuration for
    the server.

    For more information about flavors, see the [Cloud Core Infrastructure User Guide](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/compute/cloud-servers-product-concepts/flavor-class/#cloud-servers-flavor-class).

9.  *(Optional)* Assign a public key to the server by selecting an
    existing key under **Advanced Options**.

    To add a new public key, perform the following steps:

    a. Click **Add Public Key** beside the SSH Key drop-down list.
    b. Provide a Key Name for your new public key.
    c. Paste your public key into the **Public Key** field.

       **Note:** If you do not have a public key, click [How to get a public key](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os)
       and follow the instructions in that article. For more information on how
       to generate public and private key pairs, see
       [Manage SSH Keypairs for Cloud Servers with python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).

    d. After you have your entered your Key Name and the Public Key, click **Add Public Key**.

    <img src="{% asset_path cloud-servers/create-a-cloud-server/create-server-add-public-key.png %}" />

    Then, confirm that your key is listed in the SSH Key list for your new
    server.

10. As needed, create a new network and select the PublicNet and
    ServiceNet options.

11. The **Recommended Installs** section displays a number of recommended options
    for automatic installation and configuration. Select the check box next to
    one or more options that you want.

12. Click **Create Server**.

After provisioning is complete, your server displays the status **Running** and
is now available for remote connection. Specific remote connection instructions
for your server are displayed in the side bar on the right of the Cloud Control
Panel.

### Related articles

- [Create an image from a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
