---
permalink: using-security-groups/
audit_date: '2019-06-27'
title: Using security groups
type: article
created_date: '2019-06-26'
created_by: Brian King
last_modified_date: '2019-06-27'
last_modified_by: Stephanie Fillmon
product: Cloud Networks
product_url: cloud-networks
---

Rackspace Cloud security groups are a named collection of network access
rules that enable traffic filtering on Rackspace cloud servers. They provide
greater control, ease change management, and enable a higher degree of
flexibility in the application of firewall policies for users seeking to
secure virtual cloud server deployments.


Considerations for using security groups:

- Security groups are not available if you use RackConnect.
- Outbound security groups are available, but not in the Cloud Control Panel. You
  must use the API or neutron client.
- You can apply neutron security groups to cloud server virtual interfaces
  (ports) only after the server is up and running. You cannot apply them at
  boot time. If you need the security groups applied immediately, you can
  use a HEAT template to launch the server.
- You can apply security groups only to PublicNet and ServiceNet at this time.
- You can have a *maximum* of five security groups attached per network per
  server.


### Create a security group

Use the following steps to create a security group:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Select **Networking > Security Groups**.
4. On the **Security Groups** page, click **Create Security Group**.
5. Enter a name for the security group and an optional description, and then
   click **Create Security Group**.

After you create the security group, you have the option to add an inbound
rule, or you can add rules later. See the following section for instructions
about adding security group rules.

### Add security group rules

Use the following steps to add rules to your security group:

1. On the **Security Groups** page, click the name of the security group for
   which you want to add rules.
2. On the **Security Group Details** page in the **Rules** section, click
   **Add Rule**.
3. Select the IP version, protocol, and source IP range, and then click
   **Add Rule**.

   If you are adding to or changing rules for a security group that is attached
   to an existing server, it might take some time to apply the new rules.


### Attach a security group to a server

Use the following steps to attach a security group to a server:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Select **Servers > Cloud Servers**.
4. Click the server to which you want to attach a security group.
5. On the **Server Details** page in the **Networks and Security Groups**
   section, click the plus (**+**) sign next to the PublicNet or ServiceNet
   network.

   If you already have a security group, click the action gear and
   select **Select Security Groups**.

You can also apply security groups to cloud servers by using the API
or the neutron client.

### Additional resources

- [Security groups concepts and introduction](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/concepts/#security-groups-and-rules-concepts)
- [API guide](https://developer.rackspace.com/docs/cloud-networks/v2/api-reference/sec-group-operations/)
- [Getting started guide](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/controlling-network-access/security-groups/)
- [Neutron security group resource](https://developer.rackspace.com/docs/cloud-orchestration/v1/resources-reference/openstack/#os-neutron-securitygroup)
- [Security groups FAQ](https://support.rackspace.com/how-to/cloud-servers-faq/)
