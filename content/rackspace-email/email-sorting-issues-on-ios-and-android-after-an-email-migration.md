---
permalink: email-sorting-issues-on-ios-and-android-after-an-email-migration/
audit_date:
title: Email sorting issues on iOS and Android after an email migration
type: article
created_date: '2013-11-19'
created_by: Milton Prado
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

After completing an email migration to Rackspace, some iOS and Android
users may experience issues in the way emails are sorted on their mobile
devices.

### Specific behavior

Users may notice messages sorted in order from oldest to newest or may
notice date gaps between messages.

Mobile Devices set up with IMAP (via Exchange) would display legacy
messages in the order of oldest to newest. New messages that arrive to
the mobile devices show up in the correct order. The only users that
should be affected by this are users that choose to view a longer
time frame of data on their mobile phones after a migration.

### Cause

This is caused during the migration of data. The process exports mail
from the source mailbox in order from newest to oldest, and imports the
mail to the destination mailbox in the same fashion. This process
causes the message creation or modification date to appear newer or more
recent for older mail because it is the last to enter the mailbox.

### Solution

Most migration tools, including MigrationWiz, migrate recent emails
first. This is done so that users can start using their mailbox faster
by having recent content immediately available to them. iOS and Android
email clients are unique in the way they view this data. Those devices
use the Created/Modified Date value for sorting. Most other email
programs sort emails by Received Date. Unfortunately, this is a
limitation of these mobile devices.

In order to prevent this issue, we recommend that users not have email
from long time frames set to be viewed on their mobile devices.
