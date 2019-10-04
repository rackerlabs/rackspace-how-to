---
permalink: accessing-rackconnect-cloud-servers/
audit_date: '2019-10-04'
title: Accessing RackConnect cloud servers
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2018-10-25'
last_modified_by: Stephanie Fillmon
product: RackConnect
product_url: rackconnect
---

**Previous section:** [Managing RackConnect v2.0 network policies](/how-to/managing-rackconnect-v20-network-policies)

**Applies to:** RackConnect v3.0 and RackConnect v2.0

You can use several methods to access your RackConnect cloud servers.
This article provides an overview of some of these methods.

### Direct access to RackConnect cloud servers via their public IP address

With RackConnect v2.0, if the automation feature to provision public IP
addresses is enabled on your RackConnect Cloud account, then the
RackConnect automation systems automatically assign new public IP
addresses to your newly built cloud servers.

With RackConnect v3.0,
automation features are no longer available, but you can still provision
public IP addresses to your cloud servers by using the RackConnect v3.0
API. In either case, the public IP addresses assigned to your cloud
servers are allocated out of one of your dedicated public IP address
blocks. A network address translation (NAT) entry is then configured on
your RackConnect edge network device, which is a one-to-one association
from the allocated dedicated public IP address to the cloud server's
ServiceNet IP address, in the case of RackConnect v2.0, or to its cloud
network IP address, in the case of RackConnect v3.0.

You can use these dedicated public IP addresses to use Secure Shell (SSH) or
Remote Desktop Protocol (RDP) to
directly access your cloud servers, as long as access is allowed. Access
might be allowed via network policies with RackConnect v2.0. With
RackConnect v3.0, access might be allowed via firewall access list
entries created by the Network Security Team or via the Firewall Manager
feature available within the [MyRackspace portal](https://login.rackspace.com/).

You can view the IP addresses assigned to your cloud servers by querying
the Cloud Servers API or by using one of the following methods.

RackConnect v2.0 customers can use the following instructions to look up the
cloud server's details in the MyRackspace Portal:

1. Log in to the [MyRackspace Portal](https://login.rackspace.com/).
2. In the top navigation bar, click **Select a Product > Dedicated Hosting**.
3. Click **Products > Devices**.
4. Click the name of the server for which you want to view the details.

   In the **Details** tab, the **IP Details** section lists the public IPv4 address.

RackConnect v2.0 and v3.0 customers can use the following instructions to look
up the cloud server's details in the Cloud Control Panel:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Click **Servers > Cloud Servers**.
4. Click the name of the server for which you want to view the details.

   On the **Server Details** page, the **Networks and Security Groups** section
   lists the public addresses.

**Note**: Disregard the initial public IP address assigned to your cloud
servers when they are built. With RackConnect v2.0, the automation
processes deactivate the initial public IP address.

### Alternative methods of connecting to your RackConnect cloud servers

If you have not provisioned dedicated public IP addresses to your
RackConnect cloud servers, you might be able to use one of these
alternative methods for connecting to these cloud servers:

-   You can connect to one of your dedicated servers, and then from that
    dedicated server, you can connect to one of your RackConnect cloud
    servers by using its ServiceNet IP address with RackConnect v2.0
    cloud servers, or by using its cloud network's IP address with
    RackConnect v3.0 cloud servers. With RackConnect v2.0, this method
    requires that you have an appropriate Dedicated to Cloud Servers
    network policy deployed. With RackConnect v3.0, this method requires
    that you have an appropriate access list entry that allows
    this access.

-   Both RackConnect v2.0 and v3.0 customers connect directly to the console of the cloud server
    by using the console option available within the [Cloud Control
    Panel](https://login.rackspace.com/).

-   If you are using a Cisco ASA as your RackConnect edge network
    device, it might be feasible to use a site-to-site VPN or client VPN
    solution to allow direct access to your cloud servers. With
    RackConnect v2.0, this option also requires that you have an
    appropriate Dedicated to Cloud Servers network policy deployed to
    allow your VPN network to access your cloud servers. With
    RackConnect v3.0, this option requires access list entries be
    created to allow your VPN network to access your cloud servers. If
    you are interested in setting up a VPN solution with your
    RackConnect environment, contact support.

**Important:** When connecting between cloud and dedicated
environments with RackConnect, always use the private IP addresses of
the dedicated and cloud servers to avoid bandwidth charges.
