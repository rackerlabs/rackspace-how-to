---
permalink: rackconnect-v20/
audit_date:
title: RackConnect v2.0
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2016-01-20'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

**Previous section:** [Getting RackConnect support](/how-to/getting-rackconnect-support)

**Applies to:** RackConnect v2.0

To build a hybrid hosting solution that leverages the security of
dedicated servers with the flexibility and service offerings of the
Rackspace Cloud, you need to use RackConnect to allow the two types of
resources to communicate and work together. Contact your Dedicated
Account Team to get your RackConnect deployment set up. If you are
new to Rackspace, call us at 1 800 961 2888 to open a new dedicated hosting
account and learn more about the capabilities of a hybrid
implementation.

### Setting up a RackConnect configuration

1.  Contact your Dedicated Account Manager or Account Management Team
    and tell them that you want RackConnect set up in your environment.
    They will start the process by having network engineers assess your
    configuration for RackConnect compatibility and readiness.

    -   If you don't have a device that is compatible with RackConnect,
        our sales and account teams will work with you to upgrade
        your environment.

    -   If you do have a compatible device, your account team will
        assess your device for RackConnect readiness (software versions,
        an available physical interface). After the device has passed
        the qualification checks, the RackConnect implementation
        process starts.

2.  When you begin the RackConnect implementation process, you receive a
    ticket in the [MyRackspace portal](https://my.rackspace.com/) that
    outlines the steps that will get your environment ready
    for RackConnect.

    -   When you receive the ticket, you will have access to the
        RackConnect Management Interface in the MyRackspace portal. From
        the main menu in the portal, navigate to **Network &gt;
        RackConnect** to review your configuration details, track the
        status of your implementation, and start setting up your Cloud
        account and network policies.

    -   RackConnect engineers run the physical cabling to connect your
        network device to our Cloud network, and set up the
        configuration on your device to support RackConnect automation.

3.  To move the RackConnect implementation process along as
    quickly as possible, we encourage you to associate an existing Cloud
    account to your RackConnect configuration. If you do not already
    have an existing Cloud account, you can set one up by using the
    online signup process in the MyRackspace portal. See the following
    section for instructions on associating your Cloud account with
    RackConnect and completing the setup of your network policies.

4.  After we have completed the necessary steps and your RackConnect
    configuration is ready to use (typically within 5-10 business days
    of receiving the ticket in step 2), you receive an update in the
    ticket telling you that the implementation is complete.

To use RackConnect, you must complete the process detailed in the next
section for at least one Cloud account.

For videos that demonstrate the steps in this process, including an
overview of the RackConnect portal interface, creating network policies,
and adding a Cloud account to RackConnect, visit the **Community &gt;
Video Knowledge Base** section of the MyRackspace portal.

You can also find more documentation about RackConnect in the
**Community &gt; Discussions &gt;** [**RackConnect** section of the
MyRackspace portal](http://my.rackspace.com/csx/community/rackconnect).

For a collection of recommendations for using RackConnect, see
[RackConnect best practices](/how-to/rackconnect-v20-best-practices).

### Associating your Cloud account with your RackConnect configuration

1.  Ensure that your cloud account is linked to your dedicated account.
    Verify this from the
    [MyRackspace portal](https://my.rackspace.com/portal/cloudAccount/list)
    by navigating to **Products &gt; Rackspace Cloud &gt; Cloud
    Accounts**. From that screen, you can either link an existing
    account or sign up for a new account.

    [<img src="{% asset_path rackconnect/rackconnect-v20/MyRack_Link_Cloud_Account.png %}" width="650" />](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/MyRack_Link_Cloud_Account.png)

2.  After you have linked an account, you can click the plus
    sign (+) at the right of the account's row to associate the
    account with one of your RackConnect configurations. In most
    cases, you have only one RackConnect configuration.

    [<img src="{% asset_path rackconnect/rackconnect-v20/MyRack_Associate_with_RC.png %}" width="650" />](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/MyRack_Associate_with_RC.png)

3.  After establishing the association, Rackspace begins the process of
    validating the provisioning region for both Cloud Servers and Cloud
    Files, checking that it matches the region (or data center location)
    of your dedicated environment. If there are any discrepancies, a
    RackConnect engineer works with you to resolve them. You can track
    the status of these steps by selecting the newly associated Cloud
    account in the RackConnect Management Interface (**Network &gt;
    RackConnect &gt; *yourCloudAccount***) and selecting the
    **Tasks** tab.

4.  Set up your network policies to define the access that you want to
    allow between your cloud servers, your dedicated environment, and
    the Internet. You can do this by selecting the Cloud account under
    the RackConnect Management Interface and selecting the **Network
    Polices** tab (**Network &gt; RackConnect &gt; *yourCloudAccount* &gt;
    Network Policies** tab). You can also use one of the available
    network policy templates to get started.

**Important:** Do not create any servers in your Cloud account until you
receive confirmation that your Cloud account is set up in our automation
system and that your RackConnect configuration implementation is
complete (if this is a new configuration). Any cloud servers created
before these steps are complete will not be able to participate in your
RackConnect configuration unless you save an image of them and rebuild
them after the implementation process is complete. You should also
verify that you have network policies in place to allow traffic to and
from your cloud servers before creating new cloud servers.

If you have any questions, reach out to us. Our contact
information is available on the [Contact Us](/how-to/support) page.

### Next step

[Access the RackConnect Management
Interface](/how-to/access-the-rackconnect-management-interface)
