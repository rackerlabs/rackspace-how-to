---
node_id: 3214
title: RackConnect v2.0 Automation Features FAQ
type: article
created_date: '2012-11-29'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

#### What are RackConnect Automation Features?

The RackConnect Automation Features are three features that
were not initially available to customers who upgraded from RackConnect
1.0, but that have always been enabled for customers who started off as
RackConnect 2.0 customers. Enabling these Automation Features will
provide the complete RackConnect 2.0 feature-set to these RackConnect
1.0 upgraded customers. The Automation Features are as follows:

-   **Provision public IP address:** Automatic assignment and
    provisioning of a public IP address, translated through your
    dedicated network device, per cloud server
-   **Configure network stack:** Automatic configuration of the cloud
    server network stack for use with RackConnect
-   **Manage software firewall:** Configuration and ongoing management
    of the cloud server software firewall, including ACL management of
    cloud-specific traffic

These Automation Features show you which actions the RackConnect
automation system will and will not take against your environment.  In
certain cases, the settings may differ between your cloud account and
your individual cloud servers.  The cloud account settings will be used
for all new cloud servers you build in the future and the pre-existing
cloud server settings will be used if you perform a rebuild or make
other changes to your cloud server.

#### What are the prerequisites for enabling the Automation Features on my cloud account associated with RackConnect?

- You must have completed the RackConnect 1.0 upgrade process to
    RackConnect 2.0, since the RackConnect Automation Features are not
    compatible with RackConnect 1.0.
- Your Rackspace Support Team will also need to verify that your
    Network Device meets the requirements for enabling the Automation
    Features, such as the RAM, version, and configuration requirements.

**Note**: Enabling the Automation Features, assuming you meet the
requirements, should not require any downtime. Your Rackspace Support
Team will inform you if a maintenance needs to take place, if they find
that your Network Device does not meet the requirements.

#### Are there any additional costs for enabling the RackConnect Automation Features?

No, as with all RackConnect versions, RackConnect is a free service
available to all Rackspace customers that meet the Network Device
requirements. Please keep in mind that you will still have any normal
charges associated with the cost of your Dedicated and Cloud
environements, but there are no costs for the RackConnect service
itself.

#### At what level are Automation Features set?

Automation Features are set at the individual cloud account level. If
you have multiple cloud accounts associated with your RackConnect
Configuration, then each cloud account will have its own Automation
Features settings. Whether a cloud server has its Automation Features
enabled or disabled is determined by the status of the Automation
Features at the cloud account level at the moment the cloud server is
created. Essentially, what happens is that when cloud servers are
created they inherit the Automation Features settings set at the cloud
account level.

#### Can I modify a single feature from within the Automation Features set?

No, it is only possible to enable or disable all (3) Automation Features
together.

#### When and how can I opt-in to the Automation Features?

These features are currently available to customers upgraded from
RackConnect 1.0 on an opt-in basis. You can request these features by
contacting your Rackspace Support team. Following is a quick overview of the
opt-in process:

1.  Contact your Rackspace Support team and tell them that you want to enable the RackConnect Automation Features.
2.  Your Rackspace Support team will verify that your RackConnect
    configuration and network devices meet the requirements for
    enabling the RackConnect Automation Features.
3.  They will also let you know of any requirements that have not been
    met and will work with you to schedule any maintenance that might
    be required.
4.  They will configure your environment and network device with the
    required settings.
5.  They will then enable the RackConnect Automation Features and let
    you know when the process is complete.

#### Why don't all RackConnect 2.0 customers have their Automation Features enabled by default?

The reason that these features were not initially available to customers
upgraded from RackConnect 1.0 is because of their potential to disrupt
functionality that many RackConnect 1.0 users have taken advantage of.

#### How will enabling and disabling the Automation Features affect new cloud server builds?

New cloud server builds will inherit the cloud account's Automation
Features settings at the instant they are created.

#### How will enabling and disabling the Automation Features affect cloud server rebuilds?

When cloud servers are rebuilt, they will use the Automation Features
settings that are set at the cloud server level.

#### Can I change the Automation Features set at the individual cloud server level?

No, it is not possible to directly change the Automation Features
settings for existing cloud servers.  If the Automation Features set at
the cloud account level differ from those set at your cloud server's
level, and you want them to match, the following "workaround" is
the only way to accomplish this:

1.  Create a backup/snapshot image of the existing cloud server to Cloud
    Files.
2.  Create a new cloud server from the backup image.

The new cloud server, upon creation, will inherit the Automation
Features settings set at the cloud account level.

#### Where can I check what the current Automation Features settings are for my cloud accounts?

1.  Log in to your account in the
    [my.rackspace.com](https://my.rackspace.com/) portal.
2.  Select **Network &gt; RackConnect** to open the RackConnect
    Management Interface.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/New.RC_.Management.Interface.Navigation.png" class="image-full_width" width="700" height="239" />

3.  Select your RackConnect configuration from the left-hand pane, then
    select your cloud account. The cloud account's overview page will
    list your current Automation Features settings.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/New.MyRack.Automation.Features.status.png" class="image-full_width" width="700" height="487" />

#### Where can I check what the current Automation Features settings are for my cloud servers?

1.  Log in to your account in the
    [my.rackspace.com](https://my.rackspace.com/) portal.
2.  Select **Network &gt; RackConnect** to open the RackConnect
    Management Interface.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/New.RC_.Management.Interface.Navigation.png" class="image-full_width" width="700" height="239" />

3.  Select your RackConnect Configuration from the left-hand pane,
    then select your cloud account, and then select one of your
    cloud servers. The cloud server's overview page will list your
    current Automation Features settings.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/New.MyRack.CS_.Automation.Features.status.png" class="image-full_width" width="700" height="566" />

#### How will enabling the Automation Features affect my pre-existing cloud servers?

After Automation Features are enabled on your cloud account, the features
will only apply to new cloud servers created after the features were
enabled. RackConnect will not apply any of the Automation Features to
your pre-existing cloud servers, as Automation Features would be
disabled for those servers at the cloud server level. Basically, this
means that whenever there is a conflict between the features set at the
cloud account level and those set at the cloud server level, the
settings at the cloud server level will be applied. There are also some
caveats around how network policies work in environments with
pre-existing cloud servers, so please review the FAQ entries in this
article regarding how network policies work.

#### In an environment where the Automation Features settings at the cloud account level do not match those set at the cloud server level, how do network policies work?

When there is a mismatch between Automation Features settings at the
cloud account and cloud server levels, it is possible to create network
policies that are not actually valid for a given cloud server and do not
actually work as expected.

For example, suppose that you have just enabled Automation
Features at the cloud account level, but you have a pre-existing cloud
server with Automation Features disabled at the cloud server level.
Because Automation Features are enabled at the cloud account level, you
will see all five network policy options as being available, but if you
create a "Cloud Servers to Cloud Servers" network policy, it does
not actually apply to the pre-existing cloud server, because the
pre-existing cloud server has Automation Features disabled at the cloud
server level. Basically, what is happening is that the RackConnect
automation does not update the software firewall on the cloud server,
because Automation Features are disabled at the cloud server level.
Although, new cloud servers will be created with Automation Features
enabled, because the cloud account has Automation Features enabled, so all
five network policies will work normally for new cloud servers. We are
working on adding some warnings to the my.rackspace.com portal when you
attempt to create network policies that are not actually valid for
pre-existing cloud servers, as in the above scenario.

Overall, we recommend that you deploy your environment to have
Automation Features settings match at the cloud account level and cloud
server level, because having different Automation Features settings
between the cloud account and cloud server levels might lead to unexpected
results when creating network policies.

#### What network policies are available if Automation Features are *disabled* at the cloud account level?

When all Automation Features are disabled at the cloud account level,
you are only able to create the following types of network policies:

-   Cloud Servers to Dedicated
-   Cloud Servers to Internet

**Important:** Even when Automation Features are disabled at the cloud
account level, if Automation Features for pre-existing cloud servers are
enabled at the cloud server level, you will still be able to see all five
network policy options, but only the two types of network policies listed
above will be valid for all of your cloud servers. If you create
invalid network policies, they will look like they deployed correctly,
but they will not actually work as expected.  We are working on adding
some warnings to the my.rackspace.com portal when you attempt to create
network policies that are not actually valid, as in the above scenario.

#### What network policies are available if Automation Features are *enabled* at the cloud account level?

When all Automation Features are enabled at the cloud account level, you
will be able to create all of the available network policies:

-   Cloud Servers to Dedicated
-   Cloud Servers to Internet
-   Cloud Servers to Cloud Servers
-   Dedicated to Cloud Servers
-   Internet to Cloud Server

**Important:** Even when Automation Features are enabled at the cloud
account level, if Automation Features for pre-existing cloud servers are
disabled at the cloud server level, you will still see all five network
policy options as being available for those pre-existing cloud servers,
but only two types of network policies&mdash;Cloud Server to Dedicated, and
Cloud Server to Internet&mdash;will be valid for those pre-existing cloud
servers. If you create invalid network policies for these pre-existing
cloud servers, they will look like they deployed correctly, but they
will not actually work as expected. We are working on adding some
warnings to the my.rackspace.com portal when you attempt to create
network policies that are not actually valid, as in the above scenario.

#### Can I disable Automation Features on my cloud account associated with RackConnect?

Yes, we have the ability to disable your Automation Features.  While
this would greatly limit the features you would have with RackConnect,
there may be some instances where the limited automation features are
preferred.  Please submit a request to your Rackspace Support Team, if
you would like to disable the Automation Features on any of your cloud
accounts.

**Note**: If Automation Features are disabled on your cloud account, you
would need to manually configure the network stack on your new cloud
servers, as described in the [RackConnect 1.0 post-upgrade
FAQ](/how-to/rackconnect-10-post-upgrade-faq)article. You might also need to clean up any pre-existing network policies that are no longer valid in an environment where Automation Features are disabled.

#### What are periodic software firewall updates?

As part of the Automation Feature **Manage software firewall**, the
RackConnect system will periodically connect to your cloud servers to
verify that your software firewall rules are up-to-date and match your
RackConnect network policies. In the event of multiple software
firewall update failures for a cloud server, a support ticket will be
automatically generated.

For Linux cloud servers only, you can create iptables rules that are not
overwritten by these periodic software firewall updates; for details about how to accomplish this, see [Prevent
RackConnect from overwriting custom iptables rules on Linux cloud
servers](/how-to/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers).

Software firewall modifications should only be made via the network policies section of the MyRackspace portal. For more information, see [Managing RackConnect v2.0 network
policies](/how-to/managing-rackconnect-v20-network-policies).
