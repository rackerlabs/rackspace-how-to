---
node_id: 3261
title: RackConnect Auto NAT feature
type: article
created_date: '2013-01-16'
created_by: Juan Perez
last_modified_date: '2014-10-21'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

RackConnect Auto NAT is a new feature available to RackConnect 2.0 customers that have Automation Features enabled.  It provides the ability to allocate a set of pre-routed dedicated public IP addresses for use with new RackConnect
cloud servers. This allows you to assign one of the specific public IP
addresses from the set to new RackConnect cloud servers at build time.
These IP addresses are allocated out of your dedicated IP address space,
just like normal RackConnect public IP addresses are, but with Auto NAT
IP addresses, you now have the ability to select the specific IP that is
assigned to a cloud server at build time.

### Requirements for using the RackConnect Auto NAT feature

- RackConnect 2.0 Automation Features must be enabled on your
    cloud account.
- A set of dedicated public IP addresses must be allocated for use
    with the Auto NAT feature. Your Support team can help you get this
    set up.
- After your Auto NAT IP addresses have been allocated, your Support
    team will provide you with a list of Auto NAT Public IP addresses
    that have been allocated to you.
- When creating new cloud servers, you must use the [Cloud Servers
    API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/)
    to enter the Metadata information required to assign an Auto NAT IP
    to a cloud server at build time
- When creating a new cloud server you would like configured with an
    Auto NAT Public IP address, you must enter the following metadata
    values to assign that IP address to the cloud server:
    -   **Key**: RackConnectPublicIP
    -   **Value**: &lt;Enter the Auto NAT Public IP Address you would
        like to use&gt;

**IMPORTANT:** You can specify the metadata values when you use the
Cloud Servers API to create new cloud servers. View the [Cloud
Servers API documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#set-server-metadata) for details about how to use the API to
enter metadata information for a cloud server.

**NOTE:** The Auto NAT feature is set at the RackConnect Configuration
level. You can use Auto NAT IP addresses that have been allocated
to your configuration across multiple cloud accounts in your environment
as long as they are part of the same RackConnect Configuration, and as
long as each cloud account has Automation Features enabled.

**IMPORTANT:** If you attempt to assign an Auto NAT IP address that is
already in use, the allocation process will fail silently and will
revert to allocating a normal (Non-Auto NAT) IP address to your cloud
server.

### Auto NAT feature benefits

By using the Auto NAT feature, you now have the ability to
effectively move a single public IP address across cloud servers as you
provision and de-provision them.  Please keep in mind that the Auto NAT
feature only assigns a designated IP address to a cloud server during
the initial build process, so the Auto NAT feature will *not* allow
you to move an Auto NAT IP address between two cloud servers that are
already in an active state.

Following is a scenario that covers one possible method you can use to move a single public IP address to a new cloud server using the Auto NAT feature. Suppose that you have created a cloud server called MyAutoNAT-A and built it with an Auto NAT IP address of 10.A.A.A. You then decide to build a
new server called MyAutoNAT-B, but you want it to use the Auto NAT IP address that is currently assigned to MyAutoNAT-A (10.A.A.A). You could perform the following steps:

1.  Delete the MyAutoNAT-A cloud server, so that the AutoNAT IP address of
    10.A.A.A is placed back into the set of available AutoNAT IP addresses.
2.  Create the MyAutoNAT-B cloud server. During the build process, enter the metadata key of `RackConnectPublicIP`, with an associated Auto NAT IP address
  value of `10.A.A.A`.

### Removing Auto NAT IP addresses

As discussed in the preceding scenario, Auto NAT IP addresses are
removed from a cloud server and placed back into the set of available
Auto NAT IP addresses only when that cloud server is deleted. It is not
possible to remove the Auto NAT IP address assigned to a cloud server
that is still active.

### Additional information

The Auto NAT feature is available to all RackConnect 2.0 customers with
Automation Features enabled as of January 16, 2013. For details
about the RackConnect Automation Features, see the
[RackConnect Automation Features FAQ](/how-to/rackconnect-v20-automation-features-faq).

If you have any questions regarding the RackConnect Auto NAT
feature, contact your Support team.
