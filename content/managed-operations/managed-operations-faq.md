---
permalink: managed-operations-faq/
audit_date:
title: Managed Operations FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2018-03-02'
last_modified_by: Renee Rendon
product: Managed Operations
product_url: managed-operations
---

### Security

#### Are cloud servers PCI-DSS compliant?

The Rackspace Cloud environment has not been formally assessed for for
compliance with the Payment Card Industry (PCI) Data Security Standard
(DSS). For information about PCI-DSS, see [Cloud Security
Solutions](https://support.rackspace.com/how-to/are-cloud-servers-pci-dss-compliant/). For
information about PCI-DSS when using Rackspace Dedicated Hosting
services, see [PCI-Compliant Hosting for E-commerce
Websites](https://www.rackspace.com/ecommerce-hosting/pci/).

------------------------------------------------------------------------

### NoSQL databases

#### Are NoSQL databases secure, reliable, and scalable?

NoSQL databases offer greater scalability and higher performance than
relational databases. In addition, the data model that NoSQL databases use
addresses several issues that the relational model is not designed to address.
For example, NoSQL databases are able to store semi-unstructured and
unstructured data.

However, in order to support reliability and security, developers must
implement their own code, which makes NoSQL systems more complex. This
complexity limits the number of applications that can rely on NoSQL databases
for secure and reliable transactions.

#### Can NoSQL databases be used for all types of applications?

NoSQL databases are well-suited for applications in social media, analytics,
and big data. However, relational databases are still preferable for
applications that require ACID (Atomicity, Consistency, Isolation, Durability)
transactions, such as banking applications.

#### What data security, backup, and recovery work is required with NoSQL databases, including database tuning and monitoring?

Because NoSQL databases are decentralized, most have their own automatic
backup and recovery processes. By fine-tuning certain database elements such
as index use, query structure, data models, system configuration (such as
hardware and operating system settings), and application design, you can
significantly impact the overall performance of your application.

#### How do I create databases and objects and read and write data without SQL?

NoSQL databases are designed to enable the insertion of data without a
predefined schema. Every NoSQL platform has a unique method of creating
databases and objects. While few NoSQL platforms use query languages to build
databases and read and write data, some enable users to perform these
actions by using Java or Python scripting.

------------------------------------------------------------------------

### Rackspace Managed Database Services

#### What is included with Managed Database Services?

Managed Database Services offers varying levels of support. The level of
support that is included depends on your service level agreement (SLA).

Under both of the available SLAs, DBAdministrator and DBArchitect, the Managed
Databases team maintains the availability and security of your database in
accordance with your SLA. We also regularly back up your database, perform
required patches at regular intervals, and proactively monitor and respond to
alerts.

For information on what is included with each Managed Database Services
SLA, visit the [DBA Services](https://www.rackspace.com/dba-services) product
page, scroll down to the product category that you want to use (**Relational
SQL** or **NoSQL**), and click the **Troubleshooting** tab.

#### Does Rackspace tune my database?

The level of support that is included in Managed Database Services depends on
your SLA. The DBArchitect SLA for Managed Database Services includes
performance tuning and diagnostics. If you're unsure whether your SLA includes
database tuning, contact the Managed Operations team for assistance.

#### What is the cost for Managed Database Services?

For full pricing information for Managed Database Services, visit
the [DBA Services](https://www.rackspace.com/dba-services) product
page, scroll down to the product category you want to use (**Relational SQL**
or **NoSQL**), and click the **Pricing** tab.

**Note**: This pricing is for new databases only.

#### How do I contact the Managed Operations team?

You can contact the Managed Operations team by logging in to the [Cloud
Control Panel](https://mycloud.rackspace.com/) and submitting a ticket or chat
request, or by calling 1 800 961 4454.

### General

#### Do you have Servers with a Managed Operations Service Level in the UK?

Yes. For information, go to
[https://www.rackspace.co.uk/cloud/managed](https://www.rackspace.co.uk/cloud/managed/).

#### How do I contact the Managed Operations Team?

You can contact the Managed Operations team via direct chat, a phone
call to 1-800-961-4454, or by submitting a ticket online. There are
links to all of these options on the Control Panel.

#### As a Rackspace customer, can I link my Managed Hosting configuration and account to a Cloud Server with Managed Operations Service Level configuration and account?

Yes, the same way you are currently able to link your Managed Hosting
accounts and your cloud accounts.

#### Is there a cost associated with data migration services?

The Managed Operations team can help you determine if a migration is
needed. If it is, the Managed Operations team works with the Rackspace
Professional Services team on the migration, or they can recommend a
Rackspace Partner. Any work performed by the Rackspace Professional
Services Team or a partner incurs additional charges.

For more information, see [Rackspace Professional
Services](https://www.rackspace.com/en-us/professional-services/).

#### Can I move my servers from my current account to a Managed Operations Service Level account?

If you want Managed Operations Service Level support for a server that
is in your current Managed Infrastructure account, you must migrate that
server to a new server within a Managed Operations account. This
migration is necessary in order for the appropriate OS images, patching
and updates, and system administration access provisions to be deployed
on the server. All of these features are necessary for the Managed
Operations team to provide you with the highest quality support for your
server. The Managed Operations support team will help you determine the
most efficient and effective way to migrate your Managed Infrastructure
server to a Managed Operations Service Level account.

#### Do I need a separate account for Cloud Servers with a Managed Operations?

Because the Managed Operations is offered at the account level, every
cloud product in the account receives the Managed Operations. Therefore,
if you want to have some cloud servers that do not have a Managed
Operations and some that do, you will need to have a separate account
for the Cloud Servers without Managed Operations. Servers on the other
account will be at the Managed Infrastructure Service Level.

#### What is Rackspace Cloud Backup?

Rackspace Cloud Backup is a file-level storage option for Cloud Servers.
It allows you to configure backups through the Control Panel and choose
to back up a particular folder or file with the frequency that works
best for you.

For additional information, see the following How-To articles:

-   Cloud Server images - Create and restore images via our [Cloud
    Control
    Panel](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
    or
    [API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#create-image-of-specified-server).
-   Rackspace Cloud Backup - Create and schedule [file-based backups](/how-to/rackspace-cloud-backup-create-a-backup).
-   [Holland Backup Manager](http://hollandbackup.org/) - An open-source
    backup framework originally developed at Rackspace and written
    in Python.

For a comparison of Cloud Server images and Rackspace Cloud Backup, see
[Rackspace Cloud Backup vs. Cloud Server Image
Backups](/how-to/rackspace-cloud-backup-vs-cloud-server-image-backups).

#### Is my Rackspace Cloud Server with a Managed Operations Service Level account automatically backed up?

No, your server is not backed up until you configure and schedule
backups. You have the following options for backing up your server:

For a comparison of Cloud Server images and Rackspace Cloud Backup, see
[Rackspace Cloud Backup vs. Cloud Server Image
Backups](/how-to/rackspace-cloud-backup-vs-cloud-server-image-backups).

#### Will Rackspace troubleshoot programming or code for customers?

No. The Managed Infrastructure and Managed Operations Service Level
teams will not troubleshoot your code or programs.

#### Will the Rackspace support team automatically scale Cloud Servers if necessary?

Not at this time. However, if you notice issues or have questions about
capacity, the Managed Operations team will work with you and recommend
solutions.

#### What does a server with Managed Operations Service Level support cost?

Please see our [Cloud Servers Pricing
Page](https://www.rackspace.com/cloud/servers/pricing/) for full pricing
details.

#### What is included in a Managed Operations Service Level account?

Cloud Servers with a Managed Operations Service Level include access to
a dedicated, 24x7x365 support team via phone, chat, and online support
ticket. The team will support your servers from the OS up through the
application stack of Microsoft SQL Server, .Net/IIS, and the LAMP stack
on Linux. Your Cloud Server will be regularly patched and updated.
Monitoring services are included, with the Managed Operations team
proactively responding to any alerts. We will monitor up to two
user-defined ports as well as user-defined URL content.

We will provide free licensing for the Rackspace Cloud Backup file-based
backup option ( [standard Cloud Files storage fees
apply](https://www.rackspace.com/cloud/cloud_hosting_products/files/pricing/)).

#### What is Cloud Servers with a Managed Operations Service Level?

Cloud Servers with a Managed Operations Service Level extends the
enhanced managed support level from our Managed Hosting offering into
our Cloud offering. The Managed Operations Service Level provides an
additional level of support that includes monitoring, OS and application
infrastructure layer support, and technical guidance for your Cloud
Servers.

-   [Rackspace Cloud Backup
    FAQ](/how-to/cloud-backup-faq)
-   [Rackspace Cloud Backup: Getting Started
    Guide](/how-to/cloud-backup)
-   [Rackspace Cloud Backup (File-Level) vs. Cloud Server
    Images](/how-to/rackspace-cloud-backup-vs-cloud-server-image-backups)
    -   Cloud Server images - Create and restore images via our [Cloud
        Control
        Panel](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
        or
        [API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#create-image-of-specified-server).
    -   Rackspace Cloud Backup - Create and schedule [file-based
        backups](/how-to/rackspace-cloud-backup-create-a-backup).
    -   [Holland Backup Manager](http://hollandbackup.org/) - An
        open-source backup framework originally developed at Rackspace
        and written in Python.
