---
permalink: adding-a-managed-operations-service-level-to-your-cloud-account/
audit_date: '2018-09-10'
title: Add a managed operations service level to your cloud account
type: article
created_date: '2011-10-11'
created_by: Rackspace Support
last_modified_date: '2018-09-10'
last_modified_by: Kate Dougherty
product: Managed Operations
product_url: managed-operations
---

### What does it mean to have a Rackspace Managed Operations account?

A Rackspace Managed Operations account extends the managed support level
from our Managed Hosting offering into our Cloud offering. This offer
provides an additional level of support and management that includes
monitoring, operating system layer support, and technical guidance for
your Rackspace Cloud portfolio.

### What is included with a Rackspace Managed Operations account?

Managed Operations accounts include access to a dedicated support team
that is available 24x7x365 by phone, chat, email, and
online support ticket. The team supports your Cloud Servers from the
operating system level up through the application stack of Microsoft&reg; SQL
Server&trade;, .NET, and Internet Information Services (IIS), as well as the
Linux, Apache&reg;, MySQL&trade;, and PHP (LAMP) stack on Linux&reg;.
Rackspace regularly patches and updates your Cloud Server. We also manage your
[Cloud
Databases](http://www.rackspace.com/cloud/public/databases/) and provide
basic database administrator assistance such as user and table
management and data backups. The Managed Operations team provides monitoring
services and proactively responds to any alerts. As a Managed Operations
customer, you can configure up to eight monitors per server with any
combination of ping, port, and URL.

### What operating systems and applications for Cloud Servers does Managed Operations support?

For a list of supported operating system versions and applications for Linux,
see [Linux
Spheres of Support for Dedicated and Managed
Operations](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops).

**Note:** For information about support for Windows, see [Cloud Servers
with Managed Operations support for
Windows](/how-to/cloud-servers-with-managed-operations-support-for-windows).

### Does my server's IP address or host name change when I upgrade?

No, upgrading to a Managed Operations account doesn't change server IP
addresses or host names. It also doesn't change server IDs, your Rackspace
Cloud account number, or your username and password combination.

### What if my current Cloud Server operating system isn't supported?

If you choose to upgrade to a Managed Operations account, you must
either delete any active Cloud Servers and images that run unsupported
operating systems, or transfer those unsupported images to a separate
account. After you have taken these steps you are eligible to upgrade.

If you need a new Cloud Server or Cloud Database, you can either
create the image on the server yourself or have the Managed Operations team
create it for you. In either case, we update, patch, and run the instance for
you.

### Who is eligible to upgrade?

To upgrade to a Rackspace Managed Operations account, your account must
meet the following conditions:

-   The account is active and up to date on all billing invoices.
-   No Cloud Servers on the account run on unsupported operating systems.
-   No Cloud Server images on the account are built on unsupported
    operating systems.

A technical account manager can ensure that Managed
Operations is the best fit for your needs.

### What does a Rackspace Managed Operations account cost?

After you create a Cloud Server or Cloud Database on a Managed
Operations account, a flat monthly account fee is assessed when at
least one instance on the account is active or used during that month.
For more pricing information, see the following web pages:

-   [Managed Operations product pricing
    page](http://www.rackspace.com/cloud/managed_cloud/pricing/) (USA)
-   [Managed Operations product pricing
    page](http://www.rackspace.co.uk/cloud/servers/pricing) (UK)

You can also use the [Rackspace Cloud Price
Calculator](http://www.rackspace.com/calculator/) to estimate your costs.

**Note**: To get pricing information for Cloud Servers with Managed Operations,
ensure that you check the **Managed Operations: SysOps** box in the lower-left
corner of the screen.

### Why is there an account fee as well as a per-instance service fee?

The account fee is assessed per account and covers the administration of your
account on a monthly basis. The service fee is assessed per Cloud Server or
Database instance and covers the administration of each server instance. This
fee structure enables Rackspace to provide you with our managed service at the
lowest possible cost.

### Is the account fee assessed with only partial-month usage of a managed Cloud Server, or is it prorated?

The account fee is not prorated. However, the service fee is a
utility-based fee that is only billed for the amount of time that your
instance is active.

### Does the Rackspace support team automatically scale Cloud Servers if necessary?

Not at this time. However, if you notice issues or have questions about
capacity, your Rackspace account team will work with you and recommend
solutions.

### Does Rackspace troubleshoot program code for customers?

No, your Rackspace account team does not troubleshoot your program code.

### What backups does Rackspace perform?

New Cloud Servers on Managed Operations accounts have a basic Rackspace
Cloud Backup configuration. This configuration backs up directories that
commonly contain user data on a weekly basis. The default backup profile is
not a full system backup. Our support team can assist you with adding more
locations to the backup profile or changing the time interval between
backups.

Because Cloud Backup stores its archives in Cloud Files, standard storage and
bandwidth costs for Cloud Files apply. Deleting a Cloud Server does
not delete associated backup archives in Cloud Files. You must manually remove
these archives.

### Why do I need a separate account for my Cloud Servers and Cloud Databases that are associated with Managed Operations?

Because Rackspace offers Managed Operations at the account level, those
services are applied to every cloud product on an account. If you only want
Managed Operations to apply to certain cloud products, you need to move the
products for which you don't want Managed Operations to a separate account.

### What does the upgrade process entail?

During the upgrade process, Rackspace performs the following steps:

- Reset the root password for each server to gain access to the server.
- Create a Rackspace management account on each server.
- Install the Rackspace Cloud Backup agent.
- Install the Monitoring Agent.
- If necessary, install the vendor-provided kernel and prepare for updates.

**Note**: Because rebooting a server during the upgrade process might cause
problems, you should make an image of each server prior to an upgrade.
Rackspace does not perform this step for you. You should also ensure that all
of your services (such as MySQL) restart upon reboot before you upgrade.

 In addition, you need to open port 445 for Microsoft&reg; Windows&reg; or port
 22 for Linux&reg; in order for the automation to run successfully. Rackspace
 can only open ports manually after a server is associated with a Managed
 Operations account.

We recommend that you work with your account manager (AM) throughout the
upgrade process in order to ensure that you have the best possible
experience. The following list describes reasons why you should work with an
AM:

1. If an automated server upgrade fails, an administrator must log in and
   complete the work.
2. The automation occurs on port 22 on Linux and port 445 on Windows. If these
   ports are closed, the server automation process fails but the account still
   upgrades. If you don't want to use port 22 or 443, Rackspace can make a
   manual change that enables you to rerun the automation on a different port.
3. If you have older servers that run operating systems that Managed
   Operations doesn't support, an AM can provide you with options for moving
   to the most appropriate operating system.
4. An AM can review your architecture to ensure that it's appropriate for a
   cloud-based environment.
5. An AM can help you set expectations for your bill.

**Note**: Changing to a new service level agreement might also change your AM.
When this occurs, the process includes a hand-off from your current AM to your
new AM.

### As a Rackspace customer, can I link my Managed Hosting configuration and account to a Cloud Server that has a Managed Operations configuration and account?

Yes, the process is similar to the process that you use to link your Managed
Hosting accounts and your cloud accounts.

### How do I contact my Rackspace Managed Operations account team?

You can contact the Rackspace Managed Operations account team by chat,
phone, or by submitting a ticket online. You can find the phone number and
links to other communication methods in the [Cloud Control
Panel](http://mycloud.rackspace.com).

### What if I want to downgrade from my Rackspace Managed Operations account?

At this time, you can only upgrade to Rackspace Managed Operations.
If you want to remove the managed service, you need to create a new account
and build new Cloud Servers and Cloud Databases
