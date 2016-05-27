---
permalink: rackconnect-v20-automation-features-faq/
audit_date:
title: RackConnect v2.0 Automation features FAQ
type: article
created_date: '2012-11-29'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

Get quick answers to common questions about RackConnect Automation features.

#### What are RackConnect Automation features?

The RackConnect Automation features are three features that
were not initially available to customers who upgraded from RackConnect
1.0, but that have always been enabled for customers who started off as
RackConnect 2.0 customers. Enabling these features will
provide the complete RackConnect 2.0 feature-set to these RackConnect
1.0 upgraded customers. The features are as follows:

-   **Provision public IP address:** Automatic assignment and
    provisioning of a public IP address, translated through your
    dedicated network device, per cloud server
-   **Configure network stack:** Automatic configuration of the cloud
    server network stack for use with RackConnect
-   **Manage software firewall:** Configuration and ongoing management
    of the cloud server software firewall, including ACL management of
    cloud-specific traffic

These features show you which actions the RackConnect
Automation system will and will not take against your environment.  In
certain cases, the settings might differ between your cloud account and
your individual cloud servers. The cloud account settings will be used
for all new cloud servers you build in the future, and the preexisting
cloud server settings will be used if you perform a rebuild or make
other changes to your cloud server.

#### What are the prerequisites for enabling the automation features on my cloud account associated with RackConnect?

- You must have completed the RackConnect 1.0 upgrade process to
    RackConnect 2.0; the automation features are not
    compatible with RackConnect 1.0.
- Your Rackspace Support Team will also need to verify that your
    network device meets the requirements for enabling the automation
    features, such as the RAM, version, and configuration requirements.

**Note**: If you meet the requirements, enabling these features should not require any downtime. If your Rackspace Support Team finds that your network device does not meet the requirements, they will inform you if maintenance needs to occur.

#### Are there any additional costs for enabling the automation features?

No, as with all RackConnect versions, RackConnect is a free service
available to all Rackspace customers that meet the network device
requirements. You will still have any normal
charges associated with the cost of your Dedicated and Cloud
environments, but there are no costs for the RackConnect service
itself.

#### At what level are automation features set?

Automation features are set at the individual cloud account level. If
you have multiple cloud accounts associated with your RackConnect
configuration, then each cloud account will have its own automation
features settings. Whether a cloud server has its automation features
enabled or disabled is determined by the status of the automation
features at the cloud account level at the moment the cloud server is
created. Essentially, what happens is that when cloud servers are
created they inherit the automation features settings set at the cloud
account level.

#### Can I modify a single feature from within the automation features set?

No, it is only possible to enable or disable all of the features
together.

#### When and how can I opt-in to the automation features?

These features are currently available to customers upgraded from
RackConnect 1.0 on an opt-in basis. You can request these features by
contacting your Rackspace Support team. Following is a quick overview of the
opt-in process:

1.  Contact your Rackspace Support team and tell them that you want to enable the RackConnect Automation features.
2.  Your Rackspace Support team will verify that your RackConnect
    configuration and network devices meet the requirements for
    enabling the features.
3.  They will also let you know of any requirements that have not been
    met and will work with you to schedule any maintenance that might
    be required.
4.  They will configure your environment and network device with the
    required settings.
5.  They will then enable the automation features and let
    you know when the process is complete.

#### Why don't all RackConnect 2.0 customers have their automation features enabled by default?

The reason that these features were not initially available to customers
upgraded from RackConnect 1.0 is because of their potential to disrupt
functionality that many RackConnect 1.0 users have taken advantage of.

#### How will enabling and disabling the automation features affect new cloud server builds?

New cloud server builds will inherit the cloud account's automation
features settings at the instant they are created.

#### How will enabling and disabling the automation features affect cloud server rebuilds?

When cloud servers are rebuilt, they will use the automation features
settings that are set at the cloud server level.

#### Can I change the automation features set at the individual cloud server level?

No, it is not possible to directly change the automation features
settings for existing cloud servers.  If the automation features set at
the cloud account level differ from those set at your cloud server's
level, and you want them to match, the following "workaround" is
the only way to accomplish this:

1.  Create a backup/snapshot image of the existing cloud server to Cloud
    Files.
2.  Create a new cloud server from the backup image.

The new cloud server, upon creation, will inherit the automation features settings set at the cloud account level.

#### How do I verify the current automation features settings for my cloud accounts?

1. Log in to your account in the [MyRackspace portal](https://my.rackspace.com/).
2. At the top of the page, select **Network &gt; RackConnect** to open the RackConnect Management Interface.
3. In the left pane, select your RackConnect configuration, and then select your cloud account. The cloud account's overview page lists your current automation features settings.

    <img src="{% asset_path rackconnect/rackconnect-v20-automation-features-faq/New.MyRack.Automation.Features.status.png %}" class="image-full_width" width="700" height="487" />

#### How do I verify the current automation features settings for my cloud servers?

1. Log in to your account in the [MyRackspace portal](https://my.rackspace.com/).
2. At the top of the page, select **Network &gt; RackConnect** to open the RackConnect Management Interface.
3. In the left pane, select your RackConnect configuration, select your cloud account, and then select one of your cloud servers. The cloud server's overview page lists your current automation features settings.

    <img src="{% asset_path rackconnect/rackconnect-v20-automation-features-faq/New.MyRack.CS_.Automation.Features.status.png %}" class="image-full_width" width="700" height="566" />

#### How does enabling the automation features affect my pre-existing cloud servers?

After automation features are enabled on your cloud account, the features
apply only to new cloud servers created after the features were
enabled. RackConnect does not apply any of the automation features to
your preexisting cloud servers, as automation features would be
disabled for those servers at the cloud server level. Basically, this
means that whenever there is a conflict between the features set at the
cloud account level and those set at the cloud server level, the
settings at the cloud server level are applied. There are also some
caveats around how network policies work in environments with
preexisting cloud servers, so please review the FAQ entries in this
article regarding how network policies work.

#### In an environment where the automation features settings at the cloud account level do not match those set at the cloud server level, how do network policies work?

When there is a mismatch between automation features settings at the
cloud account and cloud server levels, it is possible to create network
policies that are not valid for a given cloud server and do not work as expected.

For example, suppose that you have just enabled automation
features at the cloud account level, but you have a preexisting cloud
server with automation features disabled at the cloud server level.
Because automation features are enabled at the cloud account level, you
will see all five network policy options as being available, but if you
create a "Cloud Servers to Cloud Servers" network policy, it does
not actually apply to the preexisting cloud server, because the
preexisting cloud server has automation features disabled at the cloud
server level. Basically, what is happening is that the RackConnect
automation does not update the software firewall on the cloud server,
because automation features are disabled at the cloud server level.
Although new cloud servers will be created with automation features
enabled, because the cloud account has automation features enabled, so all
five network policies will work normally for new cloud servers. We are
working on adding some warnings to the MyRackspace portal when you
attempt to create network policies that are not actually valid for
preexisting cloud servers, as in the above scenario.

Overall, we recommend that you deploy your environment to have
automation features settings match at the cloud account level and cloud
server level, because having different automation features settings
between the cloud account and cloud server levels might lead to unexpected
results when creating network policies.

#### What network policies are available if automation features are *disabled* at the cloud account level?

When all automation features are disabled at the cloud account level,
you are can create only the following types of network policies:

-   Cloud Servers to Dedicated
-   Cloud Servers to Internet

**Important:** Even when automation features are disabled at the cloud
account level, if automation features for preexisting cloud servers are
enabled at the cloud server level, you will still be able to see all five
network policy options, but only the two types of network policies listed
above will be valid for all of your cloud servers. If you create
invalid network policies, they will look like they deployed correctly,
but they will not actually work as expected.  We are working on adding
some warnings to the MyRackspace portal when you attempt to create
network policies that are not actually valid, as in the preceding scenario.

#### What network policies are available if automation features are *enabled* at the cloud account level?

When all automation features are enabled at the cloud account level, you
can create all of the available network policies:

-   Cloud Servers to Dedicated
-   Cloud Servers to Internet
-   Cloud Servers to Cloud Servers
-   Dedicated to Cloud Servers
-   Internet to Cloud Server

**Important:** Even when automation features are enabled at the cloud
account level, if automation features for preexisting cloud servers are
disabled at the cloud server level, you will still see all five network
policy options as being available for those preexisting cloud servers,
but only two types of network policies&mdash;Cloud Server to Dedicated and
Cloud Server to Internet&mdash;are valid for those preexisting cloud
servers. If you create invalid network policies for these preexisting
cloud servers, they will look like they deployed correctly, but they
will not actually work as expected. We are working on adding some
warnings to the MyRackspace portal when you attempt to create
network policies that are not actually valid, as in the preceding scenario.

#### Can I disable automation features on my cloud account associated with RackConnect?

Yes, we have the ability to disable your automation features. Although
this would greatly limit the features you would have with RackConnect,
there may be some instances where the limited automation features are
preferred. If you want to disable the automation features on any of your cloud
accounts, submit a request to your Rackspace Support Team.

**Note**: If automation features are disabled on your cloud account, you
would need to manually configure the network stack on your new cloud
servers, as described in the [RackConnect 1.0 post-upgrade FAQ](/how-to/rackconnect-10-post-upgrade-faq) article. You might also need to clean up any preexisting network policies that are no longer valid in an environment where automation features are disabled.

#### What are periodic software firewall updates?

As part of the automation feature **Manage software firewall**, the
RackConnect system periodically connects to your cloud servers to
verify that your software firewall rules are up-to-date and match your
RackConnect network policies. In the event of multiple software
firewall update failures for a cloud server, a support ticket is
automatically generated.

For Linux cloud servers only, you can create iptables rules that are not overwritten by these periodic software firewall updates; for details about how to accomplish this, see [Prevent RackConnect from overwriting custom iptables rules on Linux cloud servers](/how-to/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers).

Software firewall modifications should only be made via the network policies section of the MyRackspace portal. For more information, see [Managing RackConnect v2.0 network policies](/how-to/managing-rackconnect-v20-network-policies).
