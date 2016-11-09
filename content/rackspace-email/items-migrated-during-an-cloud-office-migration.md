---
permalink: items-migrated-during-an-cloud-office-migration/
audit_date:
title: Items migrated during an Cloud Office migration
type: article
created_date: '2013-11-13'
created_by: Milton Prado
last_modified_date: '2016-11-09'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

When migrating email to Rackspace Cloud Office, we use a tool called
MigrationWiz. Depending on which email platform you choose to migrate
to, the items that are migrated by MigrationWiz might differ.

### Items that are migrated

The following table shows which items are automatically migrated by the tool.

<img src="{% asset_path rackspace-email/items-migrated-during-an-cloud-office-migration/items-migrated-table.png %}" width="681" height="626" />

### Items that are not migrated

Because of system limitations, the following items will not be
automatically migrated in the migration process. To migrate
these items, they must be manually created or brought over via an
email client.

-   Items that do not match folder types (for example, calendar responses within a mail folder)
-   Custom items that do not inherit from the core system types (for example, items that are not true emails, calendars, contacts, journals, mail, notes, or tasks)
-   Personal distribution lists
-   Bounce notifications such as Non-Delivery Report/Receipt (NDR) or Delivery Status Notification (DSN)
-   Calendar notifications such as invites, cancellations, and so on
-   Public folders
-   RSS feeds
-   Mailbox settings, permission settings, sharing settings, client settings (for example, default font)
-   Mailbox rules
-   From Exchange 2003: BCC recipients (also resource attendees for appointments)
-   Acceptance status for meeting participants (for example, accepted, declined, tentative)

MigrationWiz is a content migration solution and is unable to perform any of the following:

-   Creation of Outlook profiles
-   Migration of client-side settings
-   Provisioning of accounts
-   ActiveDirectory related object creations or synchronization
-   NK2 files migration
