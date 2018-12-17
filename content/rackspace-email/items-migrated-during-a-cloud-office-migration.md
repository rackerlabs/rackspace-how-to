---
permalink: items-migrated-during-a-cloud-office-migration/
audit_date: '2017-01-23'
title: Items migrated during a Cloud Office migration
type: article
created_date: '2013-11-13'
created_by: Milton Prado
last_modified_date: '2017-01-23'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

When migrating email to Rackspace Cloud Office, we use a tool called
MigrationWiz. Depending on which email platform you choose to migrate
to, the items that are migrated by MigrationWiz might differ.

### Items that are migrated

The following table shows which items are automatically migrated from a source platform to the different target platforms in Cloud Office.

| Source | Hosted Exchange | Rackspace Email | Microsoft Office 365 |
|-----------------------|----------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------|
| **Microsoft Office 365** | Email, Calendars, Contacts, Tasks, Journals, Notes | Email | Email, Calendars, Contacts, Tasks, Journals, Notes |
| **Exchange Server 2003 or later** | Email, Calendars, Contacts, Tasks, Journals, Notes | Email | Email, Calendars, Contacts,  Tasks, Journals, Notes |
| **Google Apps/Gmail** | Email, Calendars, Contacts | Email | Email, Calendars, Contacts |
| **GroupWise 7 or later** | Email, Calendars, Contacts, Tasks | Email | Email, Calendars, Contacts, Tasks |
| **IMAP** | Email | Email | Email |
| **Lotus Notes 6.5 or later** | Email, Calendars, Contacts, Tasks | Email | Email, Calendars, Contacts, Tasks |
| **POP (inbox only)** | Email | Email | Email |
| **Zimbra 6 or later** | Email, Calendars, Contacts, Tasks | Email | Email, Calendars, Contacts, Tasks |

### Items that are not migrated

Because of system limitations, the following items are not automatically migrated in the migration process. These items must be manually created or brought over via an email client.

-   Items that do not match folder types (for example, calendar responses within a mail folder)
-   Custom items that do not inherit from the core system types (for example, items that are not true emails, calendars, contacts, journals, mail, notes, or tasks)
-   Additional calendar color categories that are not supported by the target platform
-   Personal distribution lists
-   Bounce notifications such as Non-Delivery Report/Receipt (NDR) or Delivery Status Notification (DSN)
-   Calendar notifications such as invitations, cancellations, and so on
-   Public folders
-   RSS feeds
-   Mailbox settings, permission settings, sharing settings, client settings (for example, default font)
-   Mailbox rules
-   On-Premise Archive Servers or Enterprise Vaults
-   (From Exchange 2003), BCC recipients (also resource attendees for appointments)
-   Acceptance status for meeting participants (for example, accepted, declined, tentative)

MigrationWiz is a content migration solution and is unable to perform any of the following:

-   Create Outlook profiles
-   Migrate client-side settings
-   Provision accounts
-   Create or synchronize Active Directory related object
-   Migrate NK2 files
