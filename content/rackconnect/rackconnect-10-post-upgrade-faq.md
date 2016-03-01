---
node_id: 2061
title: RackConnect 1.0 Post-Upgrade FAQ
type: article
created_date: '2012-08-23'
created_by: Juan Perez
last_modified_date: '2016-01-05'
last_modified_by: Rose Contreras
product: RackConnect
product_url: rackconnect
---

**IMPORTANT:** This article applies only to RackConnect customers that
were upgraded from RackConnect 1.0. If your RackConnect account was not
originally configured with RackConnect 1.0 before being upgraded, you can disregard this article.

#### What functionality do I have now that my RackConnect 1.0 configuration has been upgraded?

-   You can now access the RackConnect Management Interface in the
    [MyRackspace](https://my.rackspace.com/) portal to view and manage
    your RackConnect configurations and Network Policies. Take
    advantage of this by logging in to the MyRackspace portal, selecting
    **Network**, and then selecting **RackConnect**. You can also
    navigate directly by going to the [RackConnect Management     Interface](https://my.rackspace.com/portal/rackConnect/index).
-   Automation of your network device configuration when cloud servers
    are created in new huddles, including the addition of the VLAN and
    Gateway IP information associated with the new huddles. When you
    create a cloud server, your network device is automatically updated.
-   A RackConnect API, accessible from within each of your cloud
    servers, which provides basic details such as RackConnect automation
    status and Gateway IP.  Documentation of this API is available in
    the [RackConnect API](/how-to/the-rackconnect-v20-api) article.
-   Improved automation responsiveness to cloud server events. This
    means that changes in your cloud environment are picked up by
    RackConnect much faster, providing improved performance.
-   This upgrade enables you to use Next Generation Cloud Servers.

#### What's the difference between this upgrade and the full RackConnect 2.0 feature set?

There are 3 [Automation Features](/how-to/rackconnect-v20-automation-features-faq) that
were not included in this original 1.0 upgrade that will complete the
RackConnect 2.0 feature-set:

-   Automatic assignment and provisioning of a public IP address,
    translated through your dedicated network device, per cloud server
-   Automatic configuration of the cloud server network stack
-   Configuration and ongoing management of the cloud server software
    firewall, including ACL management of cloud-specific traffic

The reason that these features were not included in this upgrade is
because of their potential to disrupt functionality that many
RackConnect 1.0 users have taken advantage of. Due to the features that
are not currently available to customers upgraded from 1.0, you will
only be able to create the following types of Network Policies:

-   Cloud to Dedicated
-   Cloud to Internet

#### When and how can I opt-in to these features?

These Automation Features are now available to all RackConnect
customers. View the [RackConnect Automation Features
FAQ](/how-to/rackconnect-v20-automation-features-faq)
for details about getting Automation Features enabled on your cloud
accounts.

#### How do I modify a cloud server's network configuration for use with RackConnect?

For RackConnect 1.0 post-upgrade configurations with Automation Features
disabled, when you provision a new cloud server, you will need to perform the
following actions to configure the network:

**Note:** The RackConnect Gateway IP will be automatically configured
on your network device.

If you are creating a Windows cloud server, use the API (details following)
to retrieve the appropriate gateway IP address for your server. If you
are creating a Linux cloud server, use the following modified network
configuration script, which now includes functionality to contact the
API and retrieve your gateway IP address. Select the version that
matches your cloud account's service level:

-   **Managed Operations:**
    [rshybridnetworkconfig-managed-v2.sh](http://scripts.rackconnect.rackspace.com/rshybridnetworkconfig-managed-v2.sh)
-   **Managed Infrastructure:**
    [rshybridnetworkconfig-v2.sh](http://scripts.rackconnect.rackspace.com/rshybridnetworkconfig-v2.sh)

RS Hybrid Network Configuration script:

    $ bash <filename>.sh 'REGION CODE'

Region codes:

- DFW = Dallas Region
- HKG = Hong Kong Region
- IAD = Northern Virginia Region
- LON = London Region
- ORD = Chicago Region
- SYD = Sydney Region

#### What does the RackConnect API provide and how can I take advantage of it?

The RackConnect API provides a way for you to programmatically access
certain read-only information about your Cloud Server and RackConnect
configuration from within your Cloud Servers.  The API provides the
following information:

-  When you are scripting or automating any post-server build server
    configuration tasks, you can query the API to learn when RackConnect
    automation has completed configuring your server, so that any tasks
    you wish to perform don't conflict with the automation being
    performed by RackConnect.
- When you are setting up the network configuration manually on your
    cloud server (when the **Configure Network Stack** Automation Feature
    is disabled on your cloud account), the API returns the gateway
    IP address to be used as the default gateway on your cloud server,
    which you can then use to correctly configure the cloud server's     network stack.
-  When you want to determine the specific actions the automation will
    take against one of your cloud servers, you can view the status of
    each automation feature for a specific cloud server.

Full documenation about the RackConnect API is located in the
[RackConnect v2.0 API](/how-to/the-rackconnect-v20-api) article.

#### Who can I contact if I have additional questions?

Contact your Rackspace Support team with any additional questions.
