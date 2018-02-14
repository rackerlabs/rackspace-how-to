---
permalink: understand-ip-options/
audit_date: '2016-07-25'
title: IP options
type: article
created_date: '2016-07-25'
created_by: Kyle Laffoon
last_modified_date: '2016-07-27'
last_modified_by: Kyle Laffoon
product: Cloud Networks
product_url: cloud-networks
---

Internet Protocol (IP) assigns standardized structure to data packets that are transmitted online between computers or servers. The IP addresses used with Rackspace services depend on the following conditions:

- Data traffic (inbound vs. outbound)

- Access levels (internal vs. external)

- Intended use (Internet vs. within the same data center)

- Connected services

The following table describes the available IP address types, explains when and why each is used, and links to documents that explain how to use them.


IP address type | Description | Role | Related article
--- | --- | :---: | ---
Virtual | An address that distributes incoming connections to back-end nodes based on the configuration of the load balancer. | Use to connect to a service that is load balanced. | [Configure a load balancer](https://support.rackspace.com/how-to/configure-a-load-balancer/)
PublicNet | A public address that provides access to and from the Internet. | Use to provide access to the Internet, to Rackspace services such as Cloud Monitoring, Managed Cloud Support, RackConnect, and Cloud Backup, and to certain operating system updates. |[Attach a Cloud Network to an existing cloud server](https://support.rackspace.com/how-to/attach-a-cloud-network-to-an-existing-cloud-server/)
ServiceNet | An internal address that provides access to and from the Rackspace network known as ServiceNet. | Use to provide access to Rackspace services through an internal only, multi-tenant network connection within each Rackspace data center. | [Attach a Cloud Network to an existing cloud server](https://support.rackspace.com/how-to/attach-a-cloud-network-to-an-existing-cloud-server/)
Private network (from existing user network) | Private address that provides access to or from a network that you create. | Use to isolate network traffic on your own private network within the Rackspace Cloud. | [Attach a Cloud Network to an exisiting cloud server](https://support.rackspace.com/how-to/attach-a-cloud-network-to-an-existing-cloud-server/)
RackConnect public | A public IP address that has been provided from an IP address block assigned exclusively to your dedicated environment. | Use to assign public IP addresses to dedicated servers. | [RackConnect v3.0 retained public IP addresses](https://support.rackspace.com/how-to/rackconnect-v30-retained-public-ip-addresses/)
