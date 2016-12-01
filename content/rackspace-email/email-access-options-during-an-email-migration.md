---
permalink: email-access-options-during-an-email-migration/
audit_date:
title: Email access options when migrating to Rackspace
type: article
created_date: '2013-12-04'
created_by: Milton Prado
last_modified_date: '2016-12-01'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

When migrating from your current email host to Rackspace, it is common to set up email clients such as Outlook after a migration is completed. Rackspace mailboxes, however, can be accessed at any time after they are created. Accessing the mailbox does not interrupt a migration in process.

Users who prefer Webmail can log in via the [Rackspace Webmail
URL](https://apps.rackspace.com).

Users who prefer to use an email program such as Outlook need to
change their client settings to receive mail from the Rackspace
servers. Depending on your migration strategy, changes to the email
program settings may occur during or after the migration.

To help you and your end users have the best experience when switching
over, Rackspace provides the following options for setting up user
access before a migration is complete.

### Webmail access

**Note**: Webmail is immediately available to all users after the mailbox
is created. It provides them with the ability to send and receive email
even though their email clients have not yet been configured.

This option is primarily for users who access their email from a
web-based interface.  If you use this option, you can communicate with
your users ahead of time and inform them that they must access their
email from a new URL, <https://apps.rackspace.com>, by your "go live"
date.

End users requiring a desktop email client connection can get setup
instructions after the migration is complete by going to the Rackspace
Auto-Config Tool, <https://emailhelp.rackspace.com>.

#### Benefits

-   Recommended and provides the least amount of downtime during
    transition
-   Fastest connection to the email server
-   Allows for immediate access to send and receive email
-   Ideal for remote users

### Pre-stage email client setup

This option is for users who are familiar with email client
configurations and want to prepare for the migration ahead of time,
specifically before your domain's MX record changes. This option lets
users configure the new email account on their own and download data
from the server while the migration is happening. The account remains
dormant as the user continues to send and receive from their previous
account. After the MX record changes, the new account downloads the
differential mail data and that account becomes the primary account.

#### Benefits

-   Allows end users to configure their local settings before going live
-   Allows end users with a large amount of data to begin downloading
    ahead of time
-   Allows administrators to take advantage of optimal download times
    such as evenings, nights, or weekends before going live
-   Allows administrators or end users to import local settings such as
    rules, signatures, and settings into the account before going live
-   Allows administrators to troubleshoot potential connectivity issues
    with the mail client before going live
-   Allows administrators to find internal DNS issues that might affect
    mail client configuration (for Internal DNS customers only)

#### Tips for certain versions of Outlook

**Outlook 2007** - Outlook 2007 does not support multiple Exchange
accounts in the same profile. Therefore, a new profile must be created
through the Windows Control Panel. IMAP and POP for Rackspace Email can
simply be added into the same profile. For instructions on creating a
new profile for Exchange, see [Manually configure Outlook 2007 for email hosted on Exchange 2010](/how-to/manually-configure-outlook-2007-for-email-hosted-on-exchange-2010).

**Outlook 2010+** - Both Exchange and Rackspace Email accounts can be
added to the same profile.  Creating a new profile is not necessary with
newer versions of Outlook.

To add an account in Outlook 2010+ click the **File** tab, and then
click **Add Account** in the Account Information section.

### Configuration resources

- [Webmail link for Rackspace Email and Exchange](https://apps.rackspace.com)

- [Auto-Config Tool](https://emailhelp.rackspace.com) (recommended for new
client setups)

- [Configure email clients and mobile devices for email hosted on Exchange](/how-to/configure-email-clients-and-mobile-devices-for-email-hosted-on-exchange)

- [Rackspace Email and Hosted Exchange settings](/how-to/rackspace-email-and-hosted-exchange-settings)
