---
permalink: adding-a-managed-operations-service-level-to-your-cloud-account/
audit_date:
title: Adding a managed operations service level to your cloud account
type: article
created_date: '2011-10-11'
created_by: Rackspace Support
last_modified_date: '2016-06-22'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

### What does it mean to have a Rackspace Managed Operations account?

A Rackspace Managed Operations account extends the managed support level
from our Managed Hosting offering into our Cloud offering. This offer
provides an additional level of support and management that includes
monitoring, OS and application infrastructure layer support, and
technical guidance on your Rackspace Cloud portfolio.

### What is included with a Rackspace Managed Operations account?

Managed Operations accounts include access to a dedicated support team
available 24 hours a day and 7 days a week via phone, chat, email and
online support ticket. The team will support your cloud servers from the
operating system level up through the application stack of Microsoft SQL
Server, .NET and IIS, and the LAMP stack on Linux. Your cloud server
will be regularly patched and updated. Additionally, Rackspace will
manage your [Cloud Databases](http://www.rackspace.com/cloud/public/databases/), providing basic DBA assistance such as user and table management and data backup. Monitoring services are included, with the Managed Operations team
proactively responding to any alerts. As a Managed Operations customer
you can configure up to eight monitors per server with any combination
of ping, port, or URL.

### What operating systems and applications are supported for Cloud Servers with Managed Operations?

You can view the list of supported operating system versions and
applications for Linux in the following article: [Cloud Servers with
Managed Operations support for
Linux.](/how-to/cloud-servers-with-managed-operations-support-for-linux)

**Note:** Information on Windows support can be found in [Cloud Servers
with Managed Operations support for
Windows](/how-to/cloud-servers-with-managed-operations-support-for-windows).

### Will my server's IP address or hostname change when I upgrade?

No. Upgrading to a Managed Operations account does not change server IP
address or hostname.  Further, there are no changes to the server
instance IDs, nor is there a change to your Rackspace Cloud account
number and username/password combination.  All of these remain the same
with the upgrade process.

### What if my current Cloud Server operating system is not on the list?

At this time, the only operating systems we support for a Rackspace
Managed Operations account are listed in the [articles referenced
above](/how-to/cloud-servers-with-managed-operations-support-for-linux).
If you choose to upgrade to a Managed Operations account, you must
either delete any active Cloud Servers and images with unsupported
operating systems or transfer those unsupported images to a separate
account. Once the servers and images have been transferred you will be
eligible to upgrade.

When needing a new Cloud Server or Cloud Database, you may choose to
create the image on the server yourself, or one of the Managed
Operations team members can create it for you. Either way, we will keep
it updated, patched, and running for you.

### Who is eligible to upgrade?

To upgrade to a Rackspace Managed Operations account, your account must
meet the following conditions:

-   The account must be in active status and up to date on all
    billing invoices.
-   No Cloud Servers on the account run on unsupported
    operating systems.
-   No Cloud Server images on the account are built on unsupported
    operating systems.

Cloud Sites customers can upgrade their **servers only** to Managed
Operations.

A technical account manager can assist you to ensure that Managed
Operations is the best fit for your needs.

### What does a Rackspace Managed Operations account cost?

Upon the creation of a Cloud Server or a Cloud Database within a Managed
Operations account, a flat monthly account fee will be assessed when at
least one instance on the account is active or used during that month.
For more pricing information, please see:

-   [Managed Operations product pricing
    page](http://www.rackspace.com/cloud/managed_cloud/pricing/) (USA)
-   [Managed Operations product pricing
    page](http://www.rackspace.co.uk/cloud/servers/pricing) (UK)

To get an overall picture of your costs you can also use our price
calculator:

-   [Rackspace Cloud Price
    Calculator](http://www.rackspace.com/calculator/)

To get pricing information for Cloud Servers with Managed Operations,
make sure to check the box in the lower-right corner of the screen:

### Why is there an account fee as well as a per-instance service fee?

Both the account fee (assessed per account) and the per-instance service
fee (assessed per Cloud Server or Database instance) allow Rackspace to
provide you with our managed service at the lowest possible cost.  The
account fee covers the administration of your account on a monthly
basis.  The service fee covers the administration of each server
instance.

### Will the account fee be assessed with only partial-month usage of a managed Cloud Server, or will it be prorated?

The account fee will not be prorated. The service fee, however, is a
utility fee and you will only be charged for the amount of time your
instance is active.

### Will the Rackspace support team automatically scale Cloud Servers if necessary?

Not at this time. However, if you notice issues or have questions about
capacity, your Rackspace account team will work with you and recommend
solutions.

### Will Rackspace troubleshoot programming code for customers?

No. Your Rackspace account team will not troubleshoot your program code.

### What backups are performed?

New Cloud Servers with the Managed Operations include a basic Rackspace
Cloud Backup configuration that backs up directories that commonly
contain user data weekly. The default backup profile is not a full
system backup. Our support team can assist you with adding more
locations to the backup profile or changing the time interval between
backups.

Cloud Backup stores its archives in Cloud Files, so standard storage and
bandwidth costs for Cloud Files do apply. Deleting a cloud server will
not delete associated backup archives in Cloud Files - they must be
manually removed.

### Why do I need a separate account for my Cloud Servers and Databases with Managed Operations?

Since the managed operations is offered at the account level, every
cloud product in the account receives the managed operations. Therefore,
if you want Cloud Servers or Cloud Databases that do not have managed
operations and some that do, you will need to have a separate account
for the Cloud products without a Managed Operations.

### What does the upgrade process entail?

During the upgrade process, Rackspace will:

-   Reset the root password for each server to gain access to
    the server.
-   Make an image of each server.
-   Create a Rackspace management account on each server.
-   Open TCP port 445 on Windows to allow Rackspace management
    server access.
-   Install the Rackspace Cloud Backup agent.
-   Install the vendor-provided kernel and prepare for updates
    (if needed).

### As a Rackspace customer, can I link my Managed Hosting configuration and account to a Cloud Server with Managed Operations configuration and account?

Yes, the same way you are currently able to link your Managed Hosting
accounts and your cloud accounts.

### How do I contact my Rackspace Managed Operations account team?

You can contact the Rackspace Managed Operations account team via chat,
phone or by submitting a ticket online. The phone number and links to
all of these options are accessible in the Cloud Control Panel.

### What if I want to downgrade from my Rackspace Managed Operations account?

We only allow upgrades to a Rackspace Managed Operations account at this
time.  If you wish to remove the managed service, a new account will
need to be created and new Cloud Servers and Cloud Databases built.
