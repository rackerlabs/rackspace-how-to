---
permalink: dfw1-data-center-migration-customer-faq/
audit_date:
title: DFW1 Data-center migration customer FAQ
type: article
created_date: '2017-05-22'
created_by: Ciaran Maher
last_modified_date: '2017-10-02'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
noindex: true
---

In 2014, Rackspace opened a new data-center facility in the Dallas area - DFW3.
The initial intake was only for Cloud customers; however, in 2016, it also
started serving dedicated hosting customers.

Because of the additional capacity that the new facility provides, and the
latest networking and electrical infrastructure deployed there, Rackspace has
decided to close its oldest data center, DFW1. All customers currently hosted
in DFW1 will be physically migrated to the DFW3 facility.

Rackspace has had widespread success in data-center migrations over the past
decade. During this time, our dedicated migration teams have performed the
following migrations:

-   In 2009, 15,000 devices from our LON2 facility.
-   In 2011, 3,828 devices from our SAT1 and SAT2 facilities.
-   In 2012, 8,200 devices from our IAD1 facility.
-   In 2015, 11,200 devices from our LON1 and LON3/DH4 facilities.

You can rest assured that we are investing significant resources to ensure a
smooth migration for all customers.

#### Why is Rackspace closing DFW1?

Because DFW1 has been operational for 12 years and is Rackspace’s oldest
running data center, Rackspace is closing DFW1. Rackspace has made the decision
to consolidate all DFW1 and DFW3 customers into its newest data center in the
Dallas area, DFW3.

#### Will service be interrupted?

Yes. Rackspace will schedule an eight-hour maintenance window starting at
23:00 on a Friday or Saturday and closing at 07:00 the following morning. The
goal is to return customers to service as quickly as possible within that
window. Rackspace has designed the migration plan to occur in small, manageable
blocks in order to minimize the amount of downtime for customers. Our project
plan also aims to reduce the amount of unplanned downtime by including
additional resources and multiple contingency plans.

#### Will there be any IP or DNS changes?

For most customers, who stay in their allocated move group, the
public IP addresses of the devices are retained and are moved with the devices
to the new location. In this case, you do not need to make any changes to your
DNS.

##### Exception - some edge devices

In some very rare cases, the public IP address of your edge device, which is
usually a firewall but might be a load balancer or a server, might need to
change. In this event, we will work with you and your account team to prepare
and execute the IP address change before your migration date.

##### Exception - Rackspace Managed Backup service

The IP addresses used for the network that runs the Rackspace Managed Backup
service (BackupNet/ServiceNet) will change for all customers. Because Rackspace
does not have access to Managed Colocation servers, Managed Colocation
customers will need to make the Managed Backup service IP address change
themselves. Rackspace will take responsibility for updating the Managed Backup
service IP addresses for all other customers who use this service.

If you are using BackupNet/ServiceNet for any purpose other than Rackspace
Managed Backup or for ObjectRocket, you will need to make the necessary
arrangements to move to ExNet before your move night. In DFW3,
BackupNet/ServiceNet, will be available for use only for Rackspace Managed
Backup and for ObjectRocket.

#### What are the high-level stages of the migration?

The migration will happen in the following stages:

1.	You are allocated to a move group depending on the VLAN that your devices
   are in. All devices within the same VLAN are moved in the same move group.

2.	Leading up to your migration date, Rackspace works with you and your account
   team to establish any specific requirements for the move. For example, do
   you have a specific order in which your devices should be turned off?

3. A couple of hours before the maintenance window opens, automated scripts
   are run to make the necessary ServiceNet IP address changes and to place
   all devices under alert suppression.

4.	At the start of your migration window, all affected devices are powered off
   using another automated script. Any servers that need to be turned off in a
   specific order need to be powered down before the automated shut down script
   runs at 23:00. If your devices must be turned off in a specific order, your
   account team provides you a revised maintenance start time at least seven
   days before the maintenance date.

5.	The affected devices are removed from the cabinets and securely transported
   to the new data-center facility.

6.	In the new data center, all devices are racked and turned on.

7.	Your configuration is tested and verified at an infrastructure level.
   Further testing can be carried out by the migration team, if you have
   provided clear instructions in advance of the move date.

#### When are my servers scheduled to be migrated?

The migration period starts in September 2017 and runs through September 2018.
One hundred days before your migration date, you will receive notification via
a ticket in the Rackspace customer portal that includes the specific date and
time that your solution will be moved. All migrations have been scheduled to
occur on either a Friday or Saturday night, starting at 23:00 and running
through to 07:00 the following morning.

#### My solution is sensitive to the way it is handled during a shut down. Can you help?

Yes, we can work with you to understand what needs to be done to ensure a
smooth migration, and we can help in various ways, including turning off and
turning on your devices in a certain order.

#### I want to shut down the environment myself. Is that possible?

Yes, you may turn off your devices. However, because the changes to ServiceNet
and DRAC IP addresses are made in the hours before the migration, you must tell
us in advance and ensure that all devices are turned off before 23:00 on your
allocated move night. If they are still turned on when we start to remove
devices from the cabinets, we will power them down by removing the power
cables.

You also need to tell us if you want to be responsible for turning on your
devices after the migration. In this case, we will rack your devices in the
new cabinets and await instruction from you to turn them on. If you do not give
us instruction to keep the devices turned off, we will turn them on by default.

#### I am a Managed Colocation customer and you do not have access to my servers. How will the migration work for me?

Because Rackspace cannot access devices under the Managed Colocation terms, you
must turn off your devices before the start of the maintenance window. If
devices are not turned off by the time we need to remove them from the
cabinets, their power cables will be removed. If you do not want Rackspace to
turn on your devices when they arrive in DFW3, you must inform us at least
seven days before your move night.

If you are using the Rackspace Managed Backup service, you will need to change
the IP addresses for the network used to run this service.  At least a week
before your migration, we will create a ticket that contains the new IP
addresses and provides instructions for updating them. We recommend that you
make this change prior to the migration.

#### My data is replicated to another location. How will the migration affect this replication?

It depends on the replication method that you have set up. We recommend that
you tell us about any replication or log shipping so that we can work with you
to ensure that it is re-established following the maintenance.

If you are using BackupNet/ServiceNet, you will need to make arrangements to
move this to ExNet before your move night. In DFW3, BackupNet/ServiceNet will
be available for use only for Rackspace Managed Backup and for ObjectRocket.

#### I have colocation devices that Rackspace does not have access to. How will these be migrated?

Because we do not have access to your colocation devices, you will be
responsible for shutting these devices down. If you contact us, Rackspace might
be able to assist you, but this will be managed on a case-by-case basis. Our
standard approach will be to remove the power cables from the devices in DFW1
and reconnect them in DFW3.

#### I have a leased line that terminates in DFW1. What will happen to this?

You must work with your leased-line provider to provision a line in to DFW3.
Options are provisioning a new line and decommissioning the old line, or
performing a B-end shift, in which the connection is transferred from DFW1 to
DFW3 at an agreed-upon time. Review the options with your leased-line
provider. Lead times for leased-line provisioning can traditionally be fairly
significant so we recommend that you start talking to your provider as soon as
possible to determine the options and timeframes.

Please ask your account team for further information on leased lines in DFW3.

#### Who will test my environment following the maintenance?

Rackspace will test for basic connectivity. If you want us to run further
tests, for example, to check whether a website is online, you can provide us
with the steps to follow to run these checks and with instructions about what
to do if we encounter issues that we cannot resolve.

#### How do I prepare for the migration?

Rackspace will use all of its experience with data-center migration projects to
help support you during the migration to DFW3. We have assembled a dedicated
migration team, made up of existing Rackers from across the business. This team
will run audits on your servers before the migration to identify and resolve,
any potential migration issues in advance. They will work with you and your
account team to determine and agree to any special requirements that you might
have for pre-migration and post-migration instructions as we turn off and turn
on your solution. The migration team will then be focused on successfully
executing your instructions on the night of the migration.

We strongly encourage customers to back up their data, either by using the
Rackspace Managed Backup service or making their own offsite backups. If your
solution is not currently being backed up, you can talk to your account team
about putting a backup solution in place before the migration date.

In addition to the backups, consider taking the following steps before the move
night:

-   Correct any known disk issues before migration night, and ensure there are
    no disk corruption issues by running a check disk (`chkdsk`). Doing so
    prevents any forced `chkdsk` operations when your server is turned on.

-   Fully install any pending Windows updates before the scheduled migration.
    If updates stop us from being able to gracefully turn off your servers,
    the downtime for the entire move group could be extended, and we might need
    to remove the power before the update process concludes.

-   Perform a test reboot of your servers before the migration to ensure that
    applications and services start correctly. You can schedule reboots from
    the MyRackspace portal.

#### I would like to run a full backup before my migration. Can this be arranged?

Because it may not complete in time, we do not recommend that you initiate a
full backup just before the migration. Approximately two hours before the
migration is scheduled to start, our automated steps will kill any backup
still in progress so that we can ensure a clean shut down. If your backups
have been completing successfully in the weeks before the migration, you should
not need to run an additional backup. However, if you are concerned, you may
raise a ticket with the Managed Backup team to review the possibility of
running a differential (or incremental) backup before the migration.

#### How will you keep me informed about the migration?

You will receive notification via a ticket 100 days from your move date, and
then receive notification 60, 30, 14, and 7 days before the date, with the
final notification created a day before your move date. The final
notification ticket will be used to update you throughout the move night. We
will issue updates to confirm that the migration has begun, to confirm that
devices are in transit, and to confirm that the devices are back online.

#### What if I need to make changes to my environment between now and the move night?

We will impose a change freeze on your environment two weeks before the move
date. The change freeze will apply to networking, physical hardware, disk
expansions, and so on. It will not apply to data or application changes. If
you are unsure whether a change that you need to make is impacted by the change
freeze, contact your account team for validation or update one of the
notification tickets with details about the change.

If there is an emergency during the change freeze and you cannot wait until
after the migration to make a change, ensure that the project team is aware of
the change by updating one of the notification tickets. Failure to do so could
result in unexpected behavior during the maintenance and could increase
downtime.

#### Is the move date flexible?  Can I choose the date of the migration?

Your move group is determined by the VLAN that your solutions is in. We will
move an entire VLAN in one move night so that you can retain your IP addresses,
thus minimizing disruption for you. You will be notified 100 days before the
date of your migration so that you can plan accordingly with your customers and
end users. To provide a set schedule for all of our customers, we cannot change
the date of your move without further impacting your solution and introducing
more risk. As such, we recommend that you make all the necessary preparations
required to stay with the original move date.

If it is absolutely necessary for you to change your move date, then you will
likely be required to change the public IP addresses of your solution's edge
device. These changes will include DNS changes and potential configuration work
on your side.

#### I have more than one solution in DFW1. Will they all be migrated at the same time?

The migration date depends on the VLANs in which your solutions are located. If
the solutions are in the same VLAN, they will be moved at the same time.

**Note**: Solution means everything behind the edge device, which is usually a
firewall but might be a load balancer or a server.

#### Will any of the services that Rackspace currently offers me change?

There will be no change to any of the services that you currently consume. The
only change to your solution will be the physical location.

#### How will my solution be transported?

We will be using a third-party specialist transport company to migrate all
hardware. To mitigate risks and ensure the safe transportation of your
solution, Rackspace has carefully and extensively planned this migration and
selected appropriate partners.

The vehicles will be loaded within the data-center compound and so will be
subject to our stringent physical security controls. They will be unloaded
within the same conditions in DFW3. The tailgates of the vehicles will be
locked with special bolts by two Rackspace personnel. The vehicles will have
GPS tracking, will not display the Rackspace logo, and will be followed by
Rackspace personnel.

Data in our shared SAN environment will be replicated over to DFW3 before each
migration date and will be kept synchronized with DFW1 until the devices are
turned off at the start of the maintenance windows.

#### Are there any guarantees that my server will not have to be migrated again afterwards?

Rackspace has invested heavily in the design of the DFW3 data center and has no
current plans to move away from it. The lease is set to run for at least 15
years.

#### Where is DFW3 located?

This facility is located in the Richardson area of Dallas, approximately 30
miles from DFW1.

#### Who should I contact if I have more questions about the migration?

Contact us in any of the following ways:

-   Create a ticket in the MyRackspace portal. Request in the ticket that it
    be assigned to the DFW1 Migration ticket queue.
-   Ask a member of your account team for more information.
-   Respond to one of the ticket notifications that you will receive before
    your move night.























