---
permalink: email-access-options-during-an-email-migration/
audit_date: '2016-12-02'
title: Email access options when migrating to Rackspace
type: article
created_date: '2013-12-04'
created_by: Milton Prado
last_modified_date: '2016-12-02'
last_modified_by: Stephanie Fillmon
product:
product_url:
---

Customers who migrate from their current email host to Rackspace often set up email clients such as Outlook after the migration is completed. Rackspace mailboxes, however, can be accessed any time after they are created, even before the migration is completed. Accessing the mailboxes does not interrupt a migration in process.

To help you and your end users have the best experience when switching over, Rackspace provides the following options for setting up user access before a migration is completed.

- Users who prefer Webmail can log in via the [Rackspace Webmail URL](https://apps.rackspace.com).

- Users who prefer to use an email program such as Outlook must change their client settings to receive mail from the Rackspace servers. Depending on your migration strategy, changes to the email program settings might occur during or after the migration.

### Webmail access

Webmail is immediately available to all users after the mailbox is created. It provides users with the ability to send and receive email even though their email clients have not yet been configured.

This option is primarily for users who access their email from a web-based interface. If you use this option, you can communicate with your users before the migration and inform them that they must access their email from a new URL, <https://apps.rackspace.com>, by the date the new system is ready.

End users requiring a desktop email client connection can get setup instructions after the migration is complete by accessing the [email help tool](https://emailhelp.rackspace.com).

#### Benefits

- Requires the least amount of downtime during transition
- Provides the fastest connection to the email server
- Allows for immediate access to send and receive email
- Ideal for remote users

### Premigration email client setup

This option is for users who are familiar with email client configurations and want to prepare for the migration, specifically before the domain's MX record changes. This option lets users configure the new email account on their own and download data from the server while the migration is happening. The account remains dormant as the user continues to send and receive from their previous account. After the MX record changes, the new account downloads the differential mail data and that account becomes the primary account.

#### Benefits

- Allows end users to configure their local settings the migration
- Allows end users with a large amount of data to begin downloading before the migration
- Allows administrators to take advantage of optimal download times such as evenings, nights, or weekends
- Allows administrators or end users to import local settings such as rules, signatures, and settings into the account
- Allows administrators to troubleshoot potential connectivity issues with the mail client
- Allows administrators to find internal DNS issues that might affect mail client configuration (for Internal DNS customers only)

#### Tips for Outlook 2007

Outlook 2007 does not support multiple Exchange accounts in the same profile. Therefore, a new profile must be created through the Windows Control Panel. IMAP and POP for Rackspace Email can be added into the same profile. For instructions on creating a new profile for Exchange, see [Manually configure Outlook 2007 for email hosted on Exchange 2010](/how-to/manually-configure-outlook-2007-for-email-hosted-on-exchange-2010).

#### Tips for Outlook 2010 and later

In Outlook 2010 and later, both Exchange and Rackspace Email accounts can be added to the same profile.  Creating a new profile is not necessary with later versions of Outlook.

To add an account, click the **File** tab, and then click **Add Account** on the Account Information page.

### Configuration resources

- [Webmail link for Rackspace Email and Exchange](https://apps.rackspace.com)
- [Email help tool](https://emailhelp.rackspace.com) (recommended for new client setups)
- [Configure email clients and mobile devices for email hosted on Exchange](/how-to/configure-email-clients-and-mobile-devices-for-email-hosted-on-exchange)
- [Rackspace Email and Hosted Exchange settings](/how-to/rackspace-email-and-hosted-exchange-settings)
