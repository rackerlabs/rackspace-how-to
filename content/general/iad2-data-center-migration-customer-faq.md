---
permalink: iad2-data-center-migration-customer-faq/
audit_date: '2018-10-03'
title: IAD2 data-center migration customer FAQ
type: article
created_date: '2018-10-03'
created_by: Carrie Feiss
last_modified_date: '2018-10-03'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
noindex: true
---

IAD2, located in Ashburn, Virginia, is the oldest Rackspace data center in the
northern Virginia region and has been in operation since 2009.  The 2.275-megawatt
(MW) facility includes a single computer room covering approximately 11,300
square feet and consumes around 465 kilowatts (kW) of power.  The
10-year lease on IAD2 is due to expire in June 2019.

Rackspace has made the decision to move all customers from the IAD2 facility
into its newer facility in Virginia, IAD3.

Rackspace has had widespread success in data-center migrations over the past
decade. During this time, our dedicated migration teams have performed the
following migrations:

-   In 2009, 15,000 devices from our LON2 facility.
-   In 2011, 3,828 devices from our SAT1 and SAT2 facilities.
-   In 2012, 8,200 devices from our IAD1 facility.
-   In 2015, 11,200 devices from our LON1 and LON3/DH4 facilities.
-   In 2017 and 2018, 22,000 devices from our DFW1 to DFW3 facilities.

You can rest assured that we are investing significant resources to ensure a
smooth migration for all customers.

#### Why is Rackspace closing IAD2?

IAD3 is located in Ashburn VA, on the same corporate campus as IAD2 and is one
of Rackspace’s newer facilities.  IAD3 opened its doors to dedicated customers in
2013 with 4.334 MW of power and with an additional capacity expansion of 4.334
MW available in 2015.  The facility uses the latest networking and electrical
infrastructure, consuming 5.525 MW of power with capacity for an additional
3.143 MW.

#### Where is IAD3 located?

Both IAD2 and IAD3 are located in Ashburn, Virginia.

#### Will service be interrupted?

Yes. Rackspace will schedule an eight-hour maintenance window starting at 23:00
Eastern Standard Time (EST) on a Friday or Saturday and closing at 07:00 EST on
the following morning.

#### Will there be any IP address or DNS changes?

For most customers who stay in their allocated move group, the
public Internet Protocol (IP) addresses of the devices are retained and moved
with the devices to the new location. In this case, you do not need to make any
changes to your Domain Name System (DNS).

#### Exception for Rackspace Managed Backup service

The IP addresses used for the network that runs the Rackspace Managed Backup
service (BackupNet/ServiceNet) will change for all customers. Because Rackspace
does not have access to Managed Colocation servers, Managed Colocation
customers will need to make the Managed Backup service IP address change
themselves. Rackspace will take responsibility for updating the Managed Backup
service IP addresses for all other customers who use this service.

If you are using BackupNet/ServiceNet for any purpose other than Rackspace
Managed Backup or ObjectRocket, you will need to make the necessary
arrangements to move to ExNet before your move night. In IAD3,
BackupNet/ServiceNet, will be available for use only for Rackspace Managed
Backup and for ObjectRocket.

#### What are the high-level stages of the migration?

The migration will happen in the following stages:

1.	You are allocated to a move group that depends on the Virtual Local Area
   Network (VLAN) in which your devices are located. All devices within the same
   VLAN are moved in the same move group.

2.	Leading up to your migration date, Rackspace works with you and your account
   team to establish any specific requirements for the move. For example, do
   you have a specific order in which your devices should be turned off?

3. A couple of hours before the maintenance window opens, automated scripts
   are run to place all devices under alert suppression and to make the
   necessary Dell Remote Access Controller (DRAC) IP address changes.

4.	At the start of your migration window, all affected devices are powered off
   using another automated script and ServiceNet IPs are changed. Any servers
   that need to be turned off in a specific order need to be shutdown before
   the automated shut down script runs at 23:00 EST. If your devices must be turned
   off in a specific order, your account team provides you with a revised
   maintenance start time at least seven days before the maintenance date.

5.	The affected devices are removed from the cabinets and securely transported
   to the new data-center facility.

6.	In the new data center, all devices are racked and turned on.

7.	Your configuration is tested and verified at an infrastructure level.
   Further testing can be carried out by the migration team, if you have
   provided clear instructions in advance of the move date.

#### When are my servers scheduled to be migrated?

The migration period starts in January 2019 and runs through March 2019.
One hundred days before your migration date, you will receive notification via
a ticket in the Rackspace customer portal that includes the specific date and
time that your solution will be moved. All migrations have been scheduled to
occur on either a Friday or Saturday night, starting at 23:00 EST and running
through to 07:00 EST on the following morning.

#### My solution is sensitive to the way it is handled during a shut down. Can you help?

Yes, we can work with you to understand what needs to be done to ensure a
smooth migration, and we can help in various ways, including turning off and
turning on your devices in a specific order.

#### I want to shut down the environment myself. Is that possible?

Yes, you may turn off your devices. However, because we make changes to ServiceNet
and DRAC IP addresses in the hours before the migration, you must tell
us in advance and ensure that all devices are turned off before 23:00 EST on your
allocated move night. If they are still turned on when we start to remove
devices from the cabinets, we will power them down by removing the power
cables.

You also need to tell us if you want to be responsible for turning on your
devices after the migration. In this case, we will rack your devices in the
new cabinets and await instructions from you to turn them on. If you do not give
us instructions to keep the devices turned off, we will turn them on by default.

#### I am a Managed Colocation customer, and you do not have access to my servers. How will the migration work for me?

Because Rackspace cannot access devices under the Managed Colocation terms, you
must turn off your devices before the start of the maintenance window. If
devices are not turned off by the time that we need to remove them from the
cabinets, we will remove their power cables. If you do not want Rackspace to
turn on your devices when they arrive in IAD3, you must inform us at least
seven days before your move night.

If you are using the Rackspace Managed Backup service, you will need to change
the IP addresses for the network used to run this service.  At least a week
before your migration, we will create a ticket that contains the new IP
addresses and provides instructions for updating them. We recommend that you
make this change before to the migration.

#### My data is replicated to another location. How will the migration affect this replication?

The effects of the migration depend on the replication method that you have
set up. We recommend that you tell us about any replication or log shipping so
that we can work with you to ensure that it is re-established following the
maintenance.

#### I have colocation devices that Rackspace does not have access to. How will these be migrated?

Because we do not have access to your colocation devices, you will be
responsible for shutting these devices down. If you contact us, Rackspace might
be able to assist you, but we will manage this on a case-by-case basis. Our
standard approach will be to remove the power cables from the devices in IAD2
and reconnect them in IAD3.

#### I have a leased line that terminates in IAD2. What will happen to this?

You must work with your leased-line provider to provision a line into IAD3.
Options are provisioning a new line and decommissioning the old line, or
performing a B-end shift, in which the connection is transferred from IAD2 to
IAD3 at an agreed-upon time. Review the options with your leased-line
provider. Lead times for leased-line provisioning can traditionally be fairly
significant, so we recommend that you start talking to your provider as soon as
possible to determine the options and timeframes.

Ask your account team for further information on leased lines in IAD3.

#### Who will test my environment following the maintenance?

Rackspace will test for basic connectivity. If you want us to run further
tests, for example, to check whether a website is online, you can provide us
with the steps to follow to run these checks and with instructions about what
to do if we encounter issues that we cannot resolve.

#### How do I prepare for the migration?

Rackspace will use all of its experience with data-center migration projects to
help support you during the migration to IAD3. We have assembled a dedicated
migration team, made up of some of the best Rackers from across the business.
This team will run audits on your servers before the migration to identify and
resolve any potential migration issues in advance. Ensure that you work with the
migration team and your account team to resolve any issues in a timely manner.
If you fail to resolve issues that we are auditing, we might have to perform a
manual shutdown in advance of the official 23:00 EST maintenance start time.

The team will work with you and your account team to determine and agree to any
special requirements that you might have for pre-migration and post-migration
instructions as we turn off and turn on your solution. The migration team will
focus on successfully executing your instructions on the night of the
migration.

We strongly encourage customers to back up their data, either by using the
Rackspace Managed Backup service or making their own offsite backups. If your
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
    applications and services start correctly. You can schedule reboots from
    the MyRackspace portal.

#### I would like to run a full backup before my migration. Can this be arranged?

Because it might not complete in time, we do not recommend that you initiate a
full backup just before the migration. Approximately two hours before the
migration is scheduled to start, our automated steps will kill any backup
still in progress so that we can ensure a clean shut down. If your backups
have been completing successfully in the weeks before the migration, you should
not need to run an additional backup. However, if you are concerned, you can
open a ticket with the Managed Backup team to review the possibility of
running a differential (or incremental) backup before the migration.

#### How will you keep me informed about the migration?

You will receive a ticket notification 100 days from your move date, and
then receive notification 45 and 14 days before the date, with the
final notification created a day before your move date. The final
notification ticket will be used to update you throughout the move night. We
will issue updates to confirm that the migration has begun, to confirm that
devices are in transit, and to confirm that the devices are back online.

#### What if I need to make changes to my environment between now and the move night?

We will impose a change freeze on your environment two weeks before the move
date. The change freeze will apply to networking, physical hardware, disk
expansions, and so on. It will not apply to data or application changes. If
you are unsure whether the change freeze impacts a change that you need to make,
contact your account team for validation or update one of the notification
tickets with details about the change.

If there is an emergency during the change freeze and you cannot wait until
after the migration to make a change, ensure that the project team is aware of
the change by updating one of the notification tickets. Failure to do so could
result in unexpected behavior during the maintenance and could increase
downtime.

#### Is the move date flexible?  Can I choose the date of the migration?

The VLAN that your solution is in determines your move group. We will
move an entire VLAN in one move night so that you can retain your IP addresses,
thus minimizing disruption for you. You will be notified 100 days before the
date of your migration so that you can plan accordingly with your customers and
end users. To provide a set schedule for all of our customers, we cannot change
the date of your move without further impacting your solution and introducing
more risk. We recommend that you make all the necessary preparations
required to stay with the original move date.

#### I have more than one solution in IAD2. Will they all be migrated at the same time?

Yes, we have worked with the networking team to ensure your entire environment
can move at once, regardless of the aggregation zone from which your VLANs are
provided.

#### Will any of the services that Rackspace currently offers me change?

There will be no change to any of the services that you currently consume. The
only change to your solution will be the physical location.

#### How will my solution be transported?

We will be using a third-party specialist transport company to migrate all
hardware. To mitigate risks and ensure the safe transportation of your
solution, Rackspace has carefully and extensively planned this migration and
selected appropriate partners.

The vehicles will be loaded within the data-center compound and will be
subject to our stringent physical security controls. They will be unloaded
within the same conditions in IAD3. The tailgates of the vehicles will be
locked with special bolts by two Rackspace personnel, and photographs of the
secured bolts will be taken at both locations to prove that they have not been
tampered with.  The vehicles will have GPS tracking, will not display the Rackspace
logo, and will be followed by Rackspace personnel.

Data in our shared SAN environment will be replicated to IAD3 before each
migration date and will be kept synchronized with IAD2 until the devices are
turned off at the start of the maintenance windows.

#### Are there any guarantees that my server will not have to be migrated again afterwards?

Rackspace has invested heavily in the design of the IAD3 data center and has no
current plans to move away from it. The lease is set to run for at least 15
years.

#### Who should I contact if I have more questions about the migration?

Contact us in any of the following ways:

-   Create a ticket in the MyRackspace portal. Request in the ticket that it
    be assigned to the DC Migration ticket queue.
-   Ask a member of your account team for more information.
-   Respond to one of the ticket notifications that you will receive before
    your move night.

