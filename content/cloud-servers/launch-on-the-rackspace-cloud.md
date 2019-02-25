---
permalink: launch-on-the-rackspace-cloud/
audit_date: '2019-01-23'
title: Launch on the Rackspace Cloud
type: article
created_date: '2019-02-25'
created_by: Rackspace Community
last_modified_date: '2019-02-25'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shares steps and recommendations for launching your 
website or application on the Rackspace Cloud.

### Prelaunch tasks

Before you launch, you should perform the tasks in the following sections.

#### Change your local hosts file

To view your content exactly as it will be presented to your users, you
probably need to modify your local hosts file on your desktop. Modifying your
local hosts file overrides the global Domain Name Servers (DNS), enabling you
to visit your site as it appears live on Rackspace, before you change your
DNS records to point to Rackspace. Any current users continue to the existing
site.

#### Lower the TTL for your DNS records

The Time to Live (TTL) that you assign to your DNS records determines how long
DNS hosts cache your DNS information. If you have a long TTL when you try to
switch to Rackspace, your users might continue to go to your previous hosting
provider. Lowering the TTL enables DNS hosts to refresh their caches and
reflect your changes more frequently. Lower the TTL for your DNS entries as
soon as possible, so that the DNS changes propagate as quickly as possible.

#### Conduct robust testing

We recommend that you test your website or application and perform the
following steps:

- Ensure that everything works the way that you expect.
- If applicable, note any website or application behavior that is different
  from what occurs on your current hosting provider.
- Iterate and test until you are confident that your site or application 
  will work the way the you expect when you launch on the Rackspace Cloud.

#### Additional prelaunch steps

You should also take the following steps:

  - Determine exactly what will switch over and back up your current DNS
    configuration. Ensure that you document and back up all components.
  - If you are switching all of your DNS hosting, ensure that you move your
    email and other system configurations.

### Launch day

The mechanism that switches your application to Rackspace varies based on your
current DNS host. We recommend that you consult with them before you launch.

**Note**: We encourage you to use [Rackspace Cloud
DNS](https://www.rackspace.com/cloud/dns) as a primary or backup DNS
provider, but you do not need to host your DNS records with us.

### Configure your DNS records to point to Rackspace

Next, you need to edit the DNS records at your DNS hosting provider so that
they point to Rackspace's servers.

**Important**: Ensure that you perform this step last, and only when you are
ready to send traffic to Rackspace.

To learn how to perform this step, see [Find your DNS
host](https://support.rackspace.com/how-to/find-dns-host/).

#### Configure Rackspace Cloud DNS

If you are using Rackspace Cloud DNS as your DNS hosting provider, you must
complete the steps in [Transfer your DNS hosting to Rackspace](https://support.rackspace.com/how-to/transferring-your-dns-hosting-to-rackspace/).

#### Wait for the changes to propagate

The changes to your DNS records take 5 minutes to 48 hours to propagate,
depending on the DNS host. After the changes take effect, visitors to 
your domain are directed to Rackspace's servers.

### Postlaunch tasks

After you launch, verify that all systems are still in production.
