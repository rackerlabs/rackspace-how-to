---
permalink: create-an-isolated-cloud-network-and-attach-it-to-a-server/
audit_date:
title: Create an isolated Cloud Network and attach it to a server
type: article
created_date: '2012-09-17'
created_by: Susan Million
last_modified_date: '2016-01-10'
last_modified_by: Renee Rendon
product: Cloud Networks
product_url: cloud-networks
---

With Cloud Networks you can create a virtual layer 2 network that you
can attach to a new cloud server. This feature lets you keep your Cloud
Server separate from the Rackspace network, the Internet, or both.

### Cloud Network limitations

-   The Cloud Network must exist in the same region as the server.

-   You can create up to 10 isolated networks with up to 250 servers
    attached to each network.

-   A network cannot be renamed after it is created.

### Attach an isolated network to a cloud server

1.  In the [Cloud Control Panel](https://mycloud.rackspace.com).
    The Cloud Servers page is displayed by default.

2.  Click **Create Server**.

3.  Enter a name for the server and select the region.

4.  Under Advanced Options, click **Select Networks**.

5.  Click **Create Network** to create a new isolated network.

6.  In the Create Network popup menu, enter a name for the network and
    click **Create Network**.

    **Note:** You cannot rename the network after it is created.

7.  Select the network for your server and click **Select Network**.

8.  *(Optional)* Clear the check box next to a network in the Networks
    table to remove it from the server.

    **Warning:** Before you remove ServiceNet or PublicNet from your
    Cloud Server, read [Removing Networks from a Cloud
    Server](/how-to/removing-networks-from-a-cloud-server "Disabling Networks from a Cloud Server")
    for a complete description of the limitations that will be placed on
    your new server.

9.  Click **Select Networks**.

10. Click **Create Server**.

Your new cloud server is created and attached to the new isolated
network. When the server build is complete, you can scroll down to see
the Networks table. The table displays each network the server is
attached to with the corresponding IP address. Following is an example
Networks table for a server that is attached to PublicNet (Internet),
ServiceNet (the Rackspace data center network), and an isolated Cloud
Network named My Private Network:

<img src="{% asset_path cloud-networks/create-an-isolated-cloud-network-and-attach-it-to-a-server/Cloud%20Networks%20List.png %}" alt="Cloud Networks List" width="743" height="224" />

### More information about Cloud Networks

[Attach an Isolated Network to an Existing Cloud Server](/how-to/attach-a-cloud-network-to-an-existing-cloud-server)

[Removing Networks from a Cloud Server](/how-to/removing-networks-from-a-cloud-server)

[CIDR Notation](/how-to/using-cidr-notation-in-cloud-networks "CIDR Notation")

[Cloud Networks Developer Guide](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/)
