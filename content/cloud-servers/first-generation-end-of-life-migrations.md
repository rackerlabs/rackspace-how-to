---
permalink: first-generation-end-of-life-migrations/
audit_date:
title: First Generation end-of-life migrations
type: article
created_date: '2015-02-16'
created_by: Reese Mcjunkin
last_modified_date: '2015-12-14'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

On January 5, 2015, we announced plans to retire our First Generation
infrastructure and migrate all First Generation instances to our Next
Generation environment, backed by OpenStack&reg;. We are making every
effort to ensure that this transition is as painless and seamless as
possible. This article is intended to answer any questions that you
might have about the process.

### How does this migration affect me?

With the transition to our Next Generation architecture, you will be
transitioned to a newer generation of physical hardware, with a control
panel backed by the open-source OpenStack rather than our legacy control
panel.

#### Expanded product access

After you are migrated to our OpenStack infrastructure, you will have
access to OpenStack enabled products such as Cloud Block Storage and
Isolated Cloud Networks.

#### OpenStack API

The OpenStack API allows for more fine-grained programmatic control of
your servers and has SDKs available for a variety of platforms. This API
allows a variety of common configuration changes, such as the addition
of IP addresses and admin password changes to be made on-the-fly without
the need for a reboot.

#### Reliability

Because of the improved monitoring available on our Next Generation
hosts, we are able to provide higher uptime and greater service
reliability.

### Timeline

The First Generation to Next Generation migration path is currently in
the final stages of testing, and although the timeline has not yet been
finalized, we plan to begin releasing the migration path to small groups
this quarter, continuing through the end of the year.

After the migration path has been made available to your server, we will
send a communication to your account with an Assisted Migration date.
Prior to this date, there will be a window of at least 30 days in which
you will be eligible for Self-Service Migration.

#### Self-Service Migration

When your migration window is open, you will have an option via your
control panel to commence a Self-Service Migration. This option allows
you to schedule your migration at your convenience.

#### Assisted Migration

If you want Rackspace to migrate your server for you, you can simply
take no action. On your specified Assisted Migration date, you will be
migrated automatically.

For more information about Self-Service and Assisted Migrations, see the
[Migration thread in our community forums](https://community.rackspace.com/products/f/25/t/4787).

### The migration process

The First Generation to Next Generation migration process will be
similar to the current resize process. In most cases, your server will
remain active for the majority of the migration process, and memory
contents will be maintained to prevent your server from rebooting. As a
result, most servers will experience little to no downtime.

**Note**: For Windows flavors and the oldest iteration of Linux flavors,
we will be unable to retain the contents of memory. This means that the
server will be halted before the final stage of migration.

#### IP addresses

All PublicNet and ServiceNet IP addresses will be retained during the
migration, including shared IP addresses.

#### MAC addresses

Some of our customers use software that is licensed by MAC address.
These MAC addresses will not change during the migration process.

#### Server flavor

Linux servers will retain the RAM and vCPU allocation available to them
in our First Generation environment, including 256 MB servers, with no
change in billing. Windows servers will be migrated to the closest
available Next Generation flavor.

### Preparing for your migration

The migration process is intended to be a direct one-to-one transfer of
your server to the Next Generation environment. For the majority of
customers, this means that no action need be taken on your part. To
ensure a smooth transition, however, we have created articles with
recommendations for your OS.

-   [Preparing for Migration - Linux](/how-to/prepare-to-migrate-a-linux-server)
-   [Preparing for Migration - Windows](/how-to/prepare-to-migrate-a-windows-server)

### Migrating prior to your designated window

The First Generation to Next Generation migration process is being
released slowly over the next year to allow us to provide support to any
customer who needs it during the transition. As such, we will be unable
to provide this process early.

If you want to make the transition early, you can do so via the
traditional [Image-Based migration method](/how-to/next-generation-cloud-servers-migration-considerations-and-options),
with the caveats that accompany it. Be aware that image-based migration
does not allow for IP address retention across platforms. If this
retention is a necessity, you might want to wait until your designated
migration window.

### Finding more information

For more information, contact your support team or refer to the
following resources:

-   [First Generation to Next Generation Migration FAQ](/how-to/first-generation-to-next-generation-cloud-server-migration-faq)
-   [Community Migration Thread](https://community.rackspace.com/products/f/25/t/4787)
