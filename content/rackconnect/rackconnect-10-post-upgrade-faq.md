---
permalink: rackconnect-10-post-upgrade-faq/
audit_date:
title: RackConnect 1.0 post-upgrade FAQ
type: article
created_date: '2012-08-23'
created_by: Juan Perez
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

**IMPORTANT:** This article applies only to RackConnect customers who
were upgraded from RackConnect v1.0 to v2.0. If your RackConnect account was not
originally configured with RackConnect v1.0, you can disregard this article.

#### Now that my RackConnect v1.0 configuration has been upgraded, what new functionality do I have?

-   You can access the RackConnect Management Interface in the
    [MyRackspace portal](https://my.rackspace.com/) to view and manage
    your RackConnect configurations and network policies. Take
    advantage of this by logging in to the MyRackspace portal, selecting
    **Network**, and then selecting **RackConnect**. You can also
    navigate directly by going to the [RackConnect Management Interface](https://my.rackspace.com/portal/rackConnect/index).

-   Your network device is automatically updated when cloud servers are created, including the addition of the VLAN and gateway IP information.

-   A RackConnect API, accessible from within each of your cloud
    servers, provides basic details such as RackConnect automation
    status and the gateway IP address. Documentation of this API is available in
    the [RackConnect v2.0 API](/how-to/the-rackconnect-v20-api) article.

-   Automation responsiveness to cloud server events has been improved. This
    means that changes in your cloud environment are picked up by
    RackConnect much faster, providing improved performance.

-   This upgrade enables you to use cloud servers.

#### What's the difference between this upgrade and the full RackConnect v2.0 feature set?

Three [automation features](/how-to/rackconnect-v20-automation-features-faq) were not included in this original v1.0 upgrade that complete the
RackConnect 2.0 feature set:

-   Automatic assignment and provisioning of a public IP address,
    translated through your dedicated network device, per cloud server
-   Automatic configuration of the cloud server network stack
-   Configuration and ongoing management of the cloud server software
    firewall, including ACL management of cloud-specific traffic

These features were not included in this upgrade because of their potential to disrupt functionality that many
RackConnect v1.0 users have implemented. Because these features are not currently available to upgrade customers, you can create only the following types of network policies:

-   Cloud to Dedicated
-   Cloud to Internet

#### When and how can I get these features?

These automation features are now available to all RackConnect
customers. View the [RackConnect v2.0 automation features
FAQ](/how-to/rackconnect-v20-automation-features-faq)
for details about getting automation features enabled on your cloud
accounts.

#### How do I modify a cloud server's network configuration for use with RackConnect?

For RackConnect v1.0 post-upgrade configurations with automation features
disabled, when you provision a new cloud server, you must perform the
following actions to configure the network:

**Note:** The RackConnect gateway IP address is automatically configured
on your network device.

If you are creating a Windows cloud server, use the API (see the next question)
to retrieve the appropriate gateway IP address for your server.

If you are creating a Linux cloud server, use the following modified network
configuration script, which now includes functionality to contact the
API and retrieve your gateway IP address. Select the version that
matches your cloud account's service level:

-   **Managed Operations:**
    [rshybridnetworkconfig-managed-v2.sh](http://scripts.rackconnect.rackspace.com/rshybridnetworkconfig-managed-v2.sh)
-   **Managed Infrastructure:**
    [rshybridnetworkconfig-v2.sh](http://scripts.rackconnect.rackspace.com/rshybridnetworkconfig-v2.sh)

Run the RS Hybrid Network Configuration script, using the appropriate region code:

    $ bash <filename>.sh 'REGION CODE'

Region codes:

- DFW = Dallas
- HKG = Hong Kong
- IAD = Northern Virginia
- LON = London
- ORD = Chicago
- SYD = Sydney

#### What does the RackConnect API provide and how can I take advantage of it?

The RackConnect API provides a way for you to programmatically access
certain read-only information about your cloud server and RackConnect
configuration from within your cloud servers.  The API provides the
following information:

-  When you are scripting or automating any post-server build
    configuration tasks, you can query the API to learn when RackConnect
    automation has finished configuring your server, so that any tasks
    you want to perform don't conflict with the automation being
    performed by RackConnect.
- When you are setting up the network configuration manually on your
    cloud server (when the **Configure Network Stack** automation feature
    is disabled on your cloud account), the API returns the gateway
    IP address to be used as the default gateway on your cloud server,
    which you can then use to correctly configure the cloud server's network stack.
-  When you want to determine the specific actions the automation will
    take against one of your cloud servers, you can view the status of
    each automation feature for a specific cloud server.

Full documenation about the RackConnect API is located in the
[RackConnect v2.0 API](/how-to/the-rackconnect-v20-api) article.

#### Who do I contact if I have additional questions?

Contact your Rackspace Support team with any additional questions.
