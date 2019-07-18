---
permalink: ord1-cr5-cr8-data-center-consolidation-faq/
audit_date: '2019-07-19'
title: ORD1 CR5/CR8 data center consolidation FAQ
type: article
created_date: '2019-07-19'
created_by: Carrie Feiss
last_modified_date: '2019-07-19'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
noindex: true
---

The ORD1 data center has been operational since 2010 and offers the full suite
of Rackspace services. We are continuously working on improving efficiencies,
and we regularly examine the performance and capacity of our data centers and the
computer rooms within those data centers. To maximize efficiency and resource
usage in ORD1, we need to consolidate zones CR5 through CR8, which are in the
oldest area of the data center. Devices in the affected area will be physically
moved into another area of the data center, and the legacy rooms will be closed.

Our dedicated migration team will carry out this move. The team has had
widespread success in data center migrations over the past decade and continues
to improve and automate its processes, ensuring a smooth migration for our
customers.

### Will service be interrupted?

Yes. Rackspace will schedule a six-hour maintenance window from 23:00 to 05:00
on the following morning. We plan to return customers to service as quickly as
possible within that window. During this time, all affected devices will be
offline while they are moved from their current physical location to the new
location.

### Are all of the devices in my environment being moved?

Because this is a consolidation and not a closure, it could be anywhere from
one device to a customer’s entire environment in ORD1. It is important to note
that other devices within an environment that are not being physically moved could
also be impacted by this maintenance, depending on the device type that is being
physically moved. For example, if we take your firewall offline, any devices
logically located behind that firewall will be inaccessible while the firewall
is offline. We have provided your account teams with a list of devices that
could be impacted by this move. Reach out to your Account Manager for
further information.

### Will there be any IP address or Domain Name Service (DNS) changes?

There are no changes to any IP addresses.

### What are the high-level stages of the migration?

The migration will happen in the following stages:

1.	Leading up to your migration date, Rackspace will work with you and your account
team to establish any specific requirements for the move. For example, let us
know if you have a specific order in which your devices should be turned off or
brought back online.

2.	Rackspace will run non-disruptive audits on your devices before the
migration date to ensure that we have the necessary access to your devices to
run our shutdown scripts and identify issues that could impede a speedy return
to service.

3.	Before the migration starts, all devices are placed under alert suppression.

4.	At 23:01, all affected devices are powered off by using an automated script.
Any servers that need to be turned off in a specific order are powered down
before the automated shutdown script runs between 22:00 and 23:01.

5.	After all devices are powered off, they are removed from the old cabinets,
racked in their new cabinets, and powered on.

6.	Your configuration is tested and verified at an infrastructure level.
If you have provided clear instructions in advance of the move date, further
testing can be carried out by the migration team.

### My solution is sensitive and must be handled carefully during a shutdown. Can you help?

Yes, we can work with you to understand what needs to be done to ensure a
smooth migration, and we can help in various ways, including turning off and
turning on your devices in a certain order.

### I want to shut down the environment myself. Is that possible?

Yes, you may turn off your devices. We ask that you inform us in advance that
you are going to do this.

### I am a Managed Colocation customer, and you do not have access to my servers. How will the migration work for me?

Because Rackspace cannot access devices under the Managed Colocation terms, you
must turn off your devices before the start of the maintenance window. If devices
are not turned off by the time we need to remove them from the cabinets, we will
remove their power cables. If you do not want Rackspace to turn on your devices
when they are racked in their new cabinets, you must inform us at least seven
days before your move night.

### My data is replicated to another location. How will the migration affect this replication?

It depends on which devices are being moved, and the replication method that you
have set up. We recommend that you tell us about any replication or log shipping
so that we can work with you to ensure that it is re-established following the
maintenance. You can provide us with explicit instructions, such as what to
check for and what to do if it is not working as expected.

### I have colocation devices that Rackspace does not have access to. How will these be migrated?

Because we do not have access to your colocation devices, you are responsible
for shutting these devices down. If you contact us, Rackspace might be able to
assist you, but this will be managed on a case-by-case basis. Our standard
approach is to remove the power cables from the devices in their current
location and reconnect them in their new location.

### Who will test my environment following the maintenance?

Rackspace will test for basic connectivity. If you want us to run further tests,
such as to check whether a website is online, you can provide us with the steps
to follow to run these checks and with instructions about what to do if we
encounter issues that we cannot resolve.

### How do I prepare for the migration?

Rackspace will use all of its experience with data center migration projects to
help support you during this consolidation exercise. Our dedicated migration
team will run audits on your servers before the migration to identify and resolve
any potential migration issues in advance. They will work with you and your
account team to determine and agree to any special pre-migration and
post-migration requirements or instructions that you might have for turning off and
turning on your solution. The migration team will then focus on successfully
executing your instructions on the night of the migration.

We strongly encourage customers to back up their data, either by using the
Rackspace Managed Backup service or by making their own offsite backups. If your
solution is not currently being backed up, you can talk to your account team
about putting a backup solution in place before the migration date.

In addition to the backups, consider taking the following steps before the move
night:

- Correct any known disk issues before migration night, and ensure there are no
disk corruption issues by running a check disk (`chkdsk`). Doing so prevents
any forced `chkdsk` operations when your server is turned on.
- Fully install any pending Microsoft&reg; Windows&reg; updates before the scheduled
migration. If updates stop us from being able to turn off your servers gracefully,
the downtime for the entire move group could be extended.
- Perform a test reboot of your servers before the migration to ensure that
applications and services start correctly. You can schedule reboots from the
MyRackspace Portal.

### I want to run a full backup before my migration. Can this be arranged?

Because it may not complete in time, we do not recommend that you initiate a
full backup just before the migration. Approximately two hours before the
migration is scheduled to start, our automated steps will stop any backup still
in progress so that we can ensure a clean shutdown. If your backups have been
completing successfully in the weeks before the migration, you should not need
to run an additional backup. However, if you are concerned, you may raise a
ticket with the Managed Backup team to review the possibility of running a
differential (or incremental) backup before the migration. This task must complete
before backups are stopped at 21:00.

### How will you keep me informed about the migration?

You will receive a notification ticket 60 days from your move date and then
receive notifications 45 and 14 days before your move date, with the final
notification sent a day before. The final notification ticket updates you
throughout the move night. We will issue updates to confirm that the migration
has been given a “go” decision, to confirm that devices have been shut down,
and to confirm that the devices are back online.

### What if I need to make changes to my environment between now and the move night?

We will impose a change freeze on your environment two weeks before the move
date. The change freeze applies to networking, physical hardware, disk expansions,
and so on. It does not apply to data or application changes. If you are unsure
whether a change that you need to make is impacted by the change freeze, contact
your account team for validation or update one of the notification tickets with
details about the change.

If there is an emergency during the change freeze and you cannot wait until
after the migration to make a change, ensure that the project team is made aware
of the change by updating one of the notification tickets. Failure to do so
might result in unexpected behavior during the maintenance and could increase
downtime.

### Is the move date flexible? Can I choose the date of the migration?

No. Migration move dates are grouped together due to cabinet and IP address
locations.

### Whom should I contact if I have more questions about the migration?

Contact us in any of the following ways:

-   Create a ticket in the MyRackspace Portal. Request in the ticket that it
    be assigned to the ORD1 Migration ticket queue.
-   Ask a member of your account team for more information.
-   Respond to one of the ticket notifications that you will receive before
    your move night.
