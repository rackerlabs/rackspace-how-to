---
permalink: lon7-global-switch-data-center-migration-faq-for-managed-customers/
audit_date: '2020-01-29'
title: LON7 (Global Switch) data center migration FAQ for managed customers
type: article
created_date: '2020-01-29'
created_by: Sarah Wellburn
last_modified_date: '2020-01-29'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
noindex: true
---

### Overview

In November 2017, Rackspace completed its acquisition of Datapipe, which
increased the Rackspace data center footprint across the globe. In some regions,
including London, this has resulted in multiple locations within a small
geographical area. Rackspace leaders identified which data centers offer the
most reliability, high availability, and efficiency while offering our
customers access to the full range of Rackspace products and services.

Rackspace operates out of two main data centers in the vicinity of London,
which offer high levels of redundancy in power and cooling infrastructure and
high levels of resilience in the network infrastructure, consistently providing
99.999% core network uptime. Both sites are operated 24x7x365 by a team of data
center operations technicians and offer the full range of Rackspace services.
Find more information on the specification of our data centers
[here](https://www.rackspace.com/about/data-centers).

Following a review of our global data center footprint, Rackspace decided to
reduce our footprint in the Global Switch GS2 (LON7) data center by moving all
managed services customers from suites J1 and J2 to an existing Rackspace data
center. This document relates specifically to customers with managed
infrastructure and the Stratosphere&reg; products (EStrat, VStrat, and PCIStrat).

#### When will the relocation take place?

Rackspace assigns all customers to a move group, which we will schedule for a
date in April and May 2020. We schedule the move groups to run in a maintenance
window starting on either a Friday or Saturday night and running through to the
following morning. We plan to keep the maintenance window shorter than 12 hours.
We confirm the exact timings when we allocate the move groups, at least 60 days
in advance of the move date.

#### Will there be an interruption to service?

Yes, we are performing a physical migration of your environment, so it will be
offline while moving to the new location.

#### How will the migration be carried out?

We will use a physical migration method, which means that after we power down
the devices in the source data center, we remove them from the cabinets and
physically transport them to the destination data center. Upon arrival, we rack
the devices in their new locations and bring the environment back online. The
high-level stages for the move are as follows:

- You are allocated a move group at least two months in advance of the date.
- As your maintenance date nears, Rackspace works with you and your account
  team to establish any specific requirements for the move.
- During this period, Rackspace performs non-intrusive audits on your
  environment to make sure that the information in our system is up-to-date and
  to get a better understanding of how it might perform when it is shut down and
  re-started. The results of these audits might require input from you. We will
  also replicate data on our shared storage platforms to the destination data
  center.
- On the night of the migration, shortly before the maintenance window is due
  to start, we run a final audit, place all devices under alert suppression,
  and make any required changes to Rackspace management IP addresses. If you
  requested that we shut down your devices in a specific order, we do this
  shortly before the maintenance window officially opens.
- At the start of the maintenance window, Rackspace runs an automated script to
  shut down all servers. After all servers are offline, we remove physical
  devices from the cabinets and shut down dedicated storage and network devices
  and remove them from the cabinets.
- We place all devices onto a truck and transport them to the new facility
  where we rack all devices in new locations that we prepared in advance with
  the appropriate cabling and power.
- Your environment undergoes basic connectivity testing, and the team performs
  any custom testing that we agreed to before the maintenance. You should also
  be prepared to carry out tests after the move completes. You can request that
  we contact you after we complete our tests.

#### Will there be any IP address changes?

In most cases, we don't need to change public IP addresses. If we need to make
any changes, we will work with you to minimize the impact of the change.

We might need to change private IP addresses as we transition your devices to
the Rackspace Managed Backup service. This product uses a separate network
exclusively for backups to avoid degradation of public traffic as it takes
backups. Rackspace is responsible for making these changes to devices to which
we have access. If you have devices that use managed backup that Rackspace
cannot access, we can give you the new IP information so that you can make the
necessary changes.

#### My environment requires special handling during shutdown and start-up. Can you help?

Yes, if you tell us the order in which we should shut down and re-start devices,
we can follow these steps on the night of your move.

**Note**:  if you need us to shut down the devices in a specific order, we
might need to start the process before the standard maintenance window begins.
If you prefer to shut down your devices or require us to involve you in the
process, let us know in advance of the move.

#### My data is replicated to another location. How will the migration affect the replication?

It depends on the replication method that you have set up. We recommend that
you tell us about any replication or log shipping so that we can work with you
to ensure that it is re-established following the move.

#### I have devices within my managed environment to which Rackspace has no access. How will these be migrated?

Because we usually have no access to your colocation devices, you are
responsible for shutting these down. If you take no action, our standard
approach is to perform the following steps:

- Remove the power cables from the colocation devices after all managed devices
  in the environment are offline.
- Rack them in the destination data center following the same cabling
  configuration as in the source data center. Unless you provide other
  instructions, we cable and rack them in their new locations and power them on.

#### How do you keep me informed about the migration?

We will create a ticket in the customer portal, and post all updates to that
ticket. Do not close the ticket until we complete the migration.

#### What if I need to make changes to my environment between now and the move date?

Approximately one month out from your move date, we will perform a
non-intrusive audit on your environment and then complete another two weeks
later. After we run the second audit, you should make no more configuration
changes to the environment, such as adding hardware or expanding drives on
shared storage platforms. We will remind you of the change freeze and the items
that are included in that freeze nearer to the time of your maintenance window.
You can make changes to your applications and data during the freeze.

#### I have more than one environment with Rackspace. Will you migrate them at the same time?

This migration targets environments in specific suites within our LON7 data
center. Whether we move different environments together depends on the
dependencies between the different environments. If your managed environment in
LON7 is linked to another environment, either with Rackspace or outside of it
in Global Switch, update your notification ticket with the relevant information
or speak with your Rackspace account team.

#### How do I prepare for the move?

Rackspace will use all of its experience with data center migration projects to
help support you before and during the migration. We have assembled a dedicated
migration team, made up of some of the best Rackers from across the business.
This team will run audits on your servers before the migration to identify and
resolve any potential migration issues in advance. Ensure that you work with the
migration team and your account team to resolve any issues promptly.
If you fail to resolve issues that we are auditing, we might have to perform a
manual shutdown in advance of the official maintenance window start time.

The team will work with you and your account team to determine and agree to any
special requirements that you might have for pre-migration and post-migration
instructions as we turn off and turn on your environment. The migration team
will focus on successfully executing your instructions on the night of the
migration.

We strongly encourage you to back up your data, either by using the
Rackspace Managed Backup service or making your own offsite backups. If your
solution is not currently being backed up, you can talk to your account team
about putting a backup solution in place before the migration date.

In addition to the backups, consider taking the following steps before the move
night:

-   Correct any known disk issues before migration night. Ensure that there
    are no disk corruption issues by running a check disk (`chkdsk`). Doing so
    prevents any forced `chkdsk` operations when your server is turned on.

-   Fully install any pending Windows&reg; updates before the scheduled migration.
    If updates stop us from being able to turn off your servers gracefully,
    the downtime for the entire move group could be extended, and we might need
    to remove the power before the update process concludes.

-   Perform a test reboot of your servers before the migration to ensure that
    applications and services start correctly. If you want Rackspace to do this,
    raise a request by using the customer portal.

#### Will I continue to receive the same services that I currently receive?

Yes, you continue to receive the same services.

#### We have a leased line that terminates in LON7. What happens to this?

If Rackpsace provides the leased line, we take care of this and work
with you to schedule the change. If not, you must work with your telco provider
and Rackspace to understand the options for relocating the line. The data
center you are moving to and your provider determine the options available to
you. Because lead times for new leased lines are significant, we advise you to
reach out to your provider at your earliest convenience to understand the options.

#### Whom should I contact with questions about the relocation?

Contact us in one of the following ways:

- Reach out to your Rackspace account team.
- Update one of the ticket notifications published in the ticketing system
  before and during the migration.
