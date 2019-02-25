---
permalink: build-your-application-on-the-rackspace-cloud/
audit_date: '2019-01-22'
title: Build your application on the Rackspace cloud
type: article
created_date: '2019-02-05'
created_by: Rackspace Community
last_modified_date: '2019-02-05'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shares a few resources that help you get started with building
your application on the Rackspace cloud.

### Cloud Control Panel

The [Cloud Control Panel](https://login.rackspace.com) is the portal that you
use to manage your cloud infrastructure.

You can also use the Cloud Control Panel to perform the following tasks:

- Assign user permissions by using [Role Based Access Control
  (RBAC)](/how-to/getting-started-with-role-based-access-control-rbac/).

- Manage your [contact information](/how-to/change-to-new-primary-contact/).

- Manage [billing information and view
  invoices](/how-to/billing-services-overview/).

### Access your cloud servers

You can connect to your Rackspace cloud server by using Secure Shell (SSH),
Remote Desktop (RDP), or Console. For detailed instructions, see [Connect to a
cloud server](/how-to/connect-to-a-cloud-server/).

### Get a head start with Cloud Orchestration

If you are building an application from scratch, you might want to try [Cloud
Orchestration](https://www.rackspace.com/en-us/cloud/orchestration). The
stacks that Cloud Orchestration offer can help you get your application up and
running much faster than building it from scratch. Orchestration stacks range
from single-server setups (such as a Linux&reg; Apache&reg; MySQL&reg;
PHP&reg; (LAMP) stack) to complex, multiserver configurations (such as a
multiserver WordPress&reg; stack).

### Get migration assistance

If your application is already live at another provider, we can potentially
offer some limited help with migrating from that hosting provider to
Rackspace. We also work with some professional services partners who can
provide additional help. Contact your Launch Manager or Account Team
for more information.

### Modularize your application

We strongly recommend that you create a modular application. Modular design is
one of the [_Five Pillars of
Cloudiness_](https://blog.rackspace.com/explore-the-five-pillars-of-cloudiness). Modularizing your application can eliminate a single point of
failure, and allows for significantly faster scaling if necessary. The
following tips help you create a modular application:

- Decouple your database from your web and app servers. You can do this by
  using a cloud database, or by using a separate cloud server to run your
  database.
- Build at least two web or app servers for redundancy and uptime.
- Place a cloud load balancer in front of your web or app servers for
  horizontal scalability.
- Use a messaging queue for asynchronous processes.

### Send email from your application

If you want your application to send emails (such as for password resets,
weekly digests, or welcoming new users), then you need to configure your
application to do this. Use the following tips for best results:

- To avoid blacklists, relay your mail through Mailgun&reg; rather than
  sending it directly from your cloud servers.
- Use [Rackspace Cloud Office](https://www.rackspace.com/en-us/email-hosting)
  for employee mailboxes and collaboration. Internet Message Access Protocol
  (IMAP), Microsoft&reg; Exchange&reg;, G Suite&trade;, and Office 365&reg;
  are available.

### Security

Security is a partnership. To be effective, ensure that you take the time
to secure your application at every level.

#### Account level

Take the following security measure at the account level:

- Set up [RBAC](/how-to/getting-started-with-role-based-access-control-rbac/)
  for your team. Use strong passwords and security questions and answers for
  each team member.

#### Infrastructure level

Take the following security measures at the infrastructure level:

- Keep software and security patches up to date.
- Configure [two-factor
  authentication](/how-to/myrackspace-multi-factor-authentication/).

#### Server level

Take the following security measures at the server level:

- Practice basic server security.
- Lock down your firewalls manually or by using a service such as Dome9 or
  CloudPassage&reg;.

#### Application level

Take the following security measures at the application level:

- Secure user authentication manually or by using a tool like Stormpath&reg;.
- Secure application communication by using Secure Sockets Layer (SSL).
- Use strong passwords and rotate them often.
- Keep up to date with security patches.
- Filter out malicious traffic to your sites by using tools like
  Cloudflare&reg; and Incapsula&reg;.

### Backups and monitoring

Protecting your app with a solid backup and monitoring plan is just as
important as launching or migrating it. This section provides recommendations
for backups and monitoring.

#### Backups

Backups are important for restoring your site if a server fails. There are
many ways to back up your site and content. We recommend using a combination
of server images, file-level differential backups, and configuration
management to achieve a robust, comprehensive backup strategy.

##### Backups on Linux

If you are using Linux&reg;, we recommend that you use Cloud Backup on the
following directories.

**Web and app servers**

Configure backups of the following directories for your web and app servers:

- /home
- /root
- /etc
- /var/www

**Database servers**

Configure backups of the following directories for your databases:

- /home
- /root
- /etc
- /var/lib/mysqlbackup

The last directory is for servers that run MySQL databases. Managed
Operations customers automatically dump their databases to this location.
Managed Infrastructure customers can configure the same backup by using
the Holland Backup Manager.

**Note**: We recommend that you back up databases frequently and retain them
for a long period of time.

##### Backups on Windows

If you are using Windows&reg;, we recommend that you take the following steps:

- Verify or configure backup jobs for your web and app servers at
  **C:\inetpub**.
- Verify or configure your database backups (the location to which you are
  dumping your database files). We recommend that you use frequent backups and
  long retention.

### Back up Cloud Block Storage

Using block storage is a great way to increase the amount of storage space
that your application can use. You can include block storage in a cloud
backup, and also save the volumes as image snapshots. If you’re using Cloud
Block Storage, it is important to verify the following things:

- Verify and configure backup of any Cloud Block Storage volumes.
- Verify that your attached Cloud Block Storage volumes reconnect after reboot.

### Monitoring

Monitoring can alert you if your site becomes nonresponsive. Customers with
our Managed Operations service level can choose to automatically alert
Rackspace Support when monitoring notices conditions that might be of concern.

You might want to use the following monitoring resources:

- **URL Check**: Add a Cloud Monitoring check for your site’s URL to ensure
  that your site is responding.
- **New Relic**: Consider signing up for a [free New Relic&reg;
  account](http://newrelic.com/rackspace), and installing New Relic’s server
  and application monitoring agents on your cloud servers.
