---
permalink: cloud-networks-faq/
audit_date:
title: Cloud Networks - FAQ
type: article
created_date: '2013-10-02'
created_by: Sameer Satyam
last_modified_date: '2016-01-20'
last_modified_by: Stephanie Fillmon
product: Cloud Networks
product_url: cloud-networks
---

### Getting Started

#### What are the different networks in the Rackspace Cloud?

The Rackspace Cloud contains the following networks:

- **PublicNet** (public)

    PublicNet connects a cloud server to the Internet. When you create cloud servers with PublicNet, your servers get an IPv4 address and an IPv6 address. Outbound public traffic is billed according to [published rates](http://www.rackspace.com/cloud/public-pricing/#bandwidth). You can create a server without a public network; however, access to operating system updates, Cloud Monitoring remote checks, and so on might not work. For more information about the limitations of not having a public network, see [Removing Networks from a Cloud Server](/how-to/removing-networks-from-a-cloud-server).

    **Note**: PublicNet is required for RackConnect and Managed Operations service level customers.
   
- **ServiceNet** (Private)
   
    ServiceNet is an internal, multi-tenant network within each Rackspace Cloud region. It provides cloud servers access to regional services, such as Cloud Files, Cloud Load Balancers, Cloud Databases, and Cloud Backup, at no cost. ServiceNet is currently IPv4 only. Historically, ServiceNet was used for server-to-server communication, but Cloud Networks is now recommended for this purpose. ServiceNet is also required for Windows cloud server activation. We recommend that cloud servers be connected to ServiceNet and that all new connections inbound to the server be denied by a software firewall such as iptables or Windows Firewall. For more information, see [Removing Networks from a Cloud Server](/how-to/removing-networks-from-a-cloud-server).

    **Note**: ServiceNet is required for RackConnect and Managed Operations service level customers.
    
- **Cloud networks** (isolated)

    Cloud networks are isolated networks that can be used for secure communication between your cloud servers. Cloud networks are completely private and single tenant, and can be either IPv4 or IPv6. Cloud networks are recommended for all communication between cloud servers. Like ServiceNet, all bandwidth on cloud networks is provided at no charge.

#### What are the different networking APIs in the Rackspace Cloud?

The Rackspace Cloud has two networking APIs - Neutron and Nova-Network.

Rackspace first introduced networking services that were based on the OpenStack Nova-Network API. This version of the service is now superseded by the current networking API, based on OpenStack Neutron, which offers a richer suite of networking services. Both APIs continue to function, but the Neutron API will be the base for all the future networking services that Rackspace offers. For more information, see [Networking: Neutron versus Nova-Network](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#networking-neutron-versus-nova-network) in the Cloud Networks Developer Guide.

#### How many cloud networks can I create?

Every Rackspace Managed Infrastructure account has a default limit of 10 cloud networks per region. To request an increase, please submit a ticket in the Cloud Control Panel with details about how you intend to use the additional networks.

#### Is there a limit on the number of servers that can be attached to a single cloud network?

Yes. A maximum of 250 servers can be attached to a single cloud network.

#### What are the other limits in the Cloud Networks service?

The following list shows all the limits defined for the service:

-   Cloud networks per region: 10
-   Subnets per network: 2 (one IPv4 and one IPv6)
-   DNS name servers per subnet: 2
-   Host routes per subnet: 3
-   Allocation pools per subnet: 5
-   Number of fixed IP addresses per port: 4
-   Ports (hosts) per network: 250
-   Security groups per port: 5
-   Security group rules per security group: 20
-   Security group rules per user: 100

#### Can I add or remove existing networks from a cloud server?

Yes. You can add or remove any network (PublicNet, ServiceNet, or cloud network) from a server that is in a Managed Infrastructure service level account. However, Managed Operations service level and RackConnect customers are required to have PublicNet and ServiceNet interfaces. This capability means that you can freely make networking changes to your existing deployments without having to rebuild Cloud Servers.

For more information, see the [Virtual Interfaces extension](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#virtual-interfaces-extension) in the Cloud Servers Developer Guide (using the nova-network API) or [Boot a new server with your cloud network](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-getting-started/managing-networks/boot-server) in the Cloud Networks Getting Started Guide (using the neutron API).

**Note**: Be aware that removing PublicNet or ServiceNet interfaces might impact certain Rackspace services and capabilities.

#### Can I transfer Cloud Networks IP addresses from one Rackspace cloud server to another?

Yes. IP addresses on Cloud Networks are usable by any other cloud server on that network.

#### Can I transfer a PublicNet or ServiceNet IP address from one Rackspace cloud server to another?

No. At this time, you cannot transfer a PublicNet or ServiceNet IP address between cloud servers.

#### What is the network throughput on Cloud Servers?

The amount of network throughput varies based on the Cloud Server flavor. For more details, see the [Cloud Servers pricing information](http://www.rackspace.com/cloud/public-pricing/#cloud-servers).

#### What is the scope of a cloud network?

Cloud networks are regional in scope and can be attached to any of your cloud servers in a given region.

---------

### Security Groups

#### What are security groups?

Security groups are named collections of network access rules that enable Rackspace Public Cloud users to specify the types of traffic that are allowed to pass through PublicNet and ServiceNet ports on a Cloud Servers instance. A security group is a container for security group rules. After you launch an instance, you can assign one or more security groups to ports on that instance. Security groups act as a stateful firewall for your Cloud Server instances.

#### Where is the documentation?

[Cloud Networks Developer Guide](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-concepts/concepts-security-groups)

[Cloud Networks API Reference](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-api-operations/sec-group-operations)

#### What are the benefits of using security groups?

Prior to the release of this feature, users had to manage traffic to and from their instances individually via iptables rules (as an example) on every instance, or perhaps use third-party tools such as CloudPassage. Managing firewall policies involves significant overhead. Security groups make it possible to use a self-service API to define a common set of rules and apply them to the servers without needing to manage iptables rules on each server. Security groups simplify security policy administration for customers across their deployments.

#### What is being launched?

We are launching security groups as limited availability in all data centers, so customers can request the security groups feature and receive provisioned endpoints in their service catalog. Security groups are supported for Managed Infrastructure (non RackConnect) customers at launch.

#### What features are supported at launch?

With the limited availability launch in early 2015, we support only inbound security groups on both PublicNet and ServiceNet interfaces. This means that customers can filter incoming traffic to their PublicNet and ServiceNet ports. We will add outbound security group support later in 2015.

#### Will security groups be supported via the neutron client?

Yes. Users can provision security groups via the neutron client.

#### Is this functionality integrated with and available from the Cloud Control Panel?

Not yet. The product will be available soon. In the interim, you can use either the neutron client or the API.

#### Are security groups supported for OnMetal users?

No. We currently support security groups only for virtual cloud servers.

#### Is a default security group applied to my instances?

No default security groups are applied. Users must create a security group themselves and apply it to ports on an instance.

#### Can I apply security groups to ports on an instance at boot time?

No. Security groups can be applied only after the instance is active.

#### What happens when a security group rule is added to the security group?

Traffic that matches the new security group rule is allowed to go through.

#### Can traffic be blocked or denied based on a security group rule?

No. Traffic that matches a rule is permitted, and any traffic that is not part of the ruleset for that security group is denied or blocked. Because of OpenStack API design requirements, you cannot specify that traffic matching a rule should be denied. The security groups API is a whitelist. Thus, traffic that doesn't match any of the rules in the whitelist is automatically blacklisted.

#### Is there any traffic that is permitted or allowed by default by security groups?

DNS responses from Rackspace Provider DNS servers (UDP source port 53) are allowed by default even if a security group does not explicitly allow them. Also the TCP flags ACK and RST are permitted by default.

#### What kinds of traffic can be matched by the security group rules?

The following types of traffic can be matched (for both IPv4 and IPv6 addresses):

- TCP traffic
- UDP traffic
- ICMP traffic
- Traffic from a Source IP address
- Traffic from a CIDR

#### Can I have a security group with no rules?

Yes. Such a security group will deny or block all traffic.

#### Are security groups applied to instances?

No. Security groups are applied to a Neutron port on a network that is attached to an instance and not to an instance itself.

#### What are the limits for security groups and rules?

- You can apply up to 5 security groups per port.
- You can have up to 20 security group rules per security group
- You can have up to 100 security group rules (aggregate) per user during the limited availability release.

#### Can I have traffic blocked or denied based on a Security Group rule?

Traffic that matches a rule is permitted. Any traffic that is not part of the ruleset for that Security Group is denied / blocked. There is no way to specify that traffic matching a rule should be denied. This is how the OpenStack Security Groups API was designed. Hence the Security Groups API is a white-list. Traffic that doesn't match any of the rules in the white-list is automatically black-listed.
