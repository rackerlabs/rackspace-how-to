---
permalink: rackconnect-auto-nat-feature/
audit_date:
title: RackConnect Auto NAT feature
type: article
created_date: '2013-01-16'
created_by: Juan Perez
last_modified_date: '2014-10-21'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

RackConnect Auto NAT is a feature available to RackConnect v2.0 customers who have automation features enabled.  It provides the ability to allocate a set of prerouted, dedicated, public IP addresses for use with new RackConnect
cloud servers. You can assign one of the specific public IP
addresses from the set to new RackConnect cloud servers at build time.
These IP addresses are allocated out of your dedicated IP address space,
just like normal RackConnect public IP addresses are, but with Auto NAT
IP addresses, you now have the ability to select the specific IP address that is
assigned to a cloud server at build time.

### Requirements for using the RackConnect Auto NAT feature

- RackConnect 2.0 automation features must be enabled on your
    cloud account.
- A set of dedicated, public IP addresses must be allocated for use
    with the Auto NAT feature. Your Support team can help you set this
    up.
- After your Auto NAT IP addresses have been allocated, your Support
    team will provide you with a list of Auto NAT Public IP addresses
    that have been allocated to you.
- When creating new cloud servers, you must use the Cloud Servers API
    to enter the metadata information required to assign an Auto NAT IP address
    to a cloud server at build time. For details about how to use the API to
    enter metadata information for a cloud server, see the [Cloud
    Servers API documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#set-server-metadata) .
- When creating a new cloud server that you want to configure with an
    Auto NAT Public IP address, you must enter the following metadata
    values to assign that IP address to the cloud server:
    -   **Key**: `RackConnectPublicIP`
    -   **Value**: &lt;The Auto NAT public IP address you want to use&gt;

**Note:** The Auto NAT feature is set at the RackConnect configuration
level. You can use Auto NAT IP addresses that have been allocated
to your configuration across multiple cloud accounts in your environment
as long as they are part of the same RackConnect configuration, and as
long as each cloud account has automation features enabled.

**Important:** If you try to assign an Auto NAT IP address that is already in use, the allocation process fails silently and reverts to allocating a normal (not Auto NAT) IP address to your cloud server.

### Using the Auto NAT feature
By using the Auto NAT feature, you now have the ability to effectively move a single public IP address across cloud servers as you provision and unprovision them. The Auto NAT feature assigns a designated IP address to a cloud server only during the initial build process, so the Auto NAT feature does *not* enable you to move an Auto NAT IP address between two cloud servers that are already in an active state.

The following scenario presents one possible method that you can use to move a single public IP address to a new cloud server by using the Auto NAT feature. Suppose that you have created a cloud server called MyAutoNAT-A and built it with an Auto NAT IP address of 10.A.A.A. You then decide to build a
new server called MyAutoNAT-B, but you want it to use the Auto NAT IP address that is currently assigned to MyAutoNAT-A (10.A.A.A). You could perform the following steps:

1.  Delete the MyAutoNAT-A cloud server, so that the Auto NAT IP address of 10.A.A.A is placed back into the set of available Auto NAT IP addresses.
2.  Create the MyAutoNAT-B cloud server. During the build process, enter the metadata key of `RackConnectPublicIP`, with an associated Auto NAT IP address
  value of `10.A.A.A`.

### Removing Auto NAT IP addresses

As discussed in the preceding scenario, Auto NAT IP addresses are
removed from a cloud server and placed back into the set of available
Auto NAT IP addresses only when that cloud server is deleted. It is not
possible to remove the Auto NAT IP address assigned to a cloud server
that is still active.

### Additional information

For details
about the RackConnect automation features, see the
[RackConnect v2.0 automation features FAQ](/how-to/rackconnect-v20-automation-features-faq).

If you have any questions regarding the RackConnect Auto NAT
feature, contact your Support team.
