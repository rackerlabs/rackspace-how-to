---
permalink: reassign-a-cloud-network-ip-address-to-a-rackconnect-v3-cloud-server/
audit_date: '2019-02-14'
title: Reassign a Cloud Network IP address to a RackConnect v3 Cloud Server
type: article
created_date: '2019-02-14'
created_by: Rackspace Community
last_modified_date: '2019-02-14'
last_modified_by: Cat Lookabaugh
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0

This article shows you how to reassign a Cloud Network Internet Protocol (IP)
address to one of your existing RackConnect v3 Cloud Servers by using the
Rackspace API tool, [Pitchfork](https://pitchfork.rax.io/). You must use your
primary username and API key to log in to Pitchfork.

**Note:** Reassigning an IP address requires network downtime of up to 30
minutes, so you should perform these steps during off hours.

Instead of Pitchfork, you can use other tools such as the OpenStack&reg;
Networking (Neutron) client or cURL to issue the appropriate API calls.

### Prerequisites

Before you begin, you should have the following items available to make the
appropriate API call to assign a specific IP address to your Cloud Server:

- The network ID of the Cloud Network

- The subnet ID of the Cloud Network

- The Universal Unique Identifiers (UUIDs) of the Cloud Servers

The following Pitchfork calls return your network IDs and subnet IDs:

- [List networks](https://pitchfork.rax.io/networks/#list_networks-networks)
- [List subnets](https://pitchfork.rax.io/networks/#list_subnets-networks)

You can collect your Cloud Server UUIDs from the **Server Details** page in the
[Cloud Control Panel](https://login.rackspace.com). In the top navigation bar,
click **Select a Product > Rackspace Cloud**. Then select **Servers > Cloud
Servers** and choose the server that you want to use.

### Detach the Cloud Network

Perform the following steps to detach the Cloud network:

- Log in to the [Cloud Control Panel](https://login.rackspace.com).

- In the top navigation bar, click **Select a Product > Rackspace Cloud**.

- Select **Servers > Cloud Servers**.

- Select **Networking > Security Groups**.

- Click the gear icon next to the network that you want to detach and select
  **Disconnect Network**.

- Wait 20 to 30 minutes for the IP address to be released back into the
  allocation pool.


### Create a new port

Perform the following steps to create a new port:

- Use the Pitchfork call, [Create port](https://pitchfork.rax.io/networks/#create_port-networks).

- Enter the appropriate values for the `network_id`, `device_id` (server UUID),
  `subnet_id`, and desired `ip_address`.

- Submit the call.


### Attach the Cloud Network

Perform the following steps to attach the Cloud Network:

- Log in to the [Cloud Control Panel](https://login.rackspace.com).

- In the top navigation bar, click **Select a Product > Rackspace Cloud**.

- Select **Servers > Cloud Servers**.

- Select **Networking > Security Groups**.

- Select **Add Network**.

- Choose the appropriate RackConnect v3 network to attach.

### Conclusion

These steps automatically populate the RackConnect v3 network interface with
the IP address that you selected when you created the port.
