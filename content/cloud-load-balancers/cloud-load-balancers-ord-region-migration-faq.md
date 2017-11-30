---
permalink: cloud-load-balancers-ord-region-migration-faq/
audit_date:
title: Cloud Load Balancers ORD region migration FAQ
type: article
created_date: '2015-08-18'
created_by: Jorge Miramontes
last_modified_date: '2016-04-20'
last_modified_by: Mike Asthalter
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

Fake change 2

This article provides answers to frequently asked questions about the
Cloud Load Balancers migration in the ORD region.

#### Why is there a migration?

We are migrating Cloud Load Balancers onto newer hardware to provide you
with an enhanced experience. Specifically, you will benefit in the
following ways:

-   An improved Cloud Load Balancer provisioning experience
-   Enhancements to mitigate resource oversubscription
-   Architectural improvements that allow for better fault tolerance

#### How will the migration work?

The migration is simple. During your planned migration window we will
perform the following tasks:

1.  Set your load balancer into a `PENDING_UPDATE` status
2.  Duplicate the load balancer configuration onto the new hardware
3.  Pass traffic to the load balancer

After those steps are we will set your load balancer status back to
`ACTIVE`.

#### What is the expected impact to my load balancer?

You can expect up to 15 seconds of downtime per migrated load balancer,
although 1 to 2 seconds of downtime is more realistic. Downtime for this
maintenance specifically means that all connections are dropped and
session persistence, if enabled, is reset until the migration is
completed. You might also see up to 1 minute of degradation (for
example, sporadic timeouts or some dropped connections).

#### What options are available to avoid disruption due to the migration?

The following options are available:

-   Temporarily create a load balancer in another region and leverage
    the public endpoints of your cloud servers.

    **Note:** This is not
    recommended for SSL terminated load balancers.

-   Move the load balancer and applicable nodes to a different region.
-   Temporarily leverage DNS load balancing to your cloud servers.


#### Do I need to make any update to my configurations?

If you have a firewall between your Cloud load balancer and other
devices you may be required to update your policy settings due to the
fact that the ServiceNet IP address will change. Follow the instructions
outlined in the article, [Using Cloud Load Balancers with RackConnect](/how-to/using-cloud-load-balancers-with-rackconnect),
to set up the appropriate policies so that you are not affected by the
ServiceNet IP changes.

#### Can I self-migrate my load balancer?

We do not recommend self-migrating your load balancer because you will
lose the static IP address that is currently assigned to your instance.
We have planned the migration to ensure a smooth transition of your
existing IP addresses.
