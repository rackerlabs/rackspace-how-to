---
permalink: upgrading-to-exchange-2016/
audit_date: '2016-10-27'
title: Upgrading to Exchange 2016
type: article
created_date: '2016-10-25'
created_by: Aaron Medrano
last_modified_date: '2016-10-27'
last_modified_by: Nate Archer
product: Microsoft Exchange
product_url: exchange
---

This article provides instructions for upgrading your current Exchange environment to Exchange 2016 using a self-service upgrade tool.

### Supported email clients for Exchange 2016

Only the following email clients can safely upgrade to Exchange 2016:

- Outlook 2016
- Outlook 2013
- Outlook 2011 for Mac
- Outlook 2010
- Outlook 2007 SP3
- Entourage 2008 EWS
- Mac Mail

**Note:** Outlook 2003, Outlook 2007, and Entourage 2004 are not supported with
Exchange 2016. Users on Outlook 2003 or 2007 must upgrade to Outlook 2010 or later.

### What is migrated

Everything from your current Exchange environment is migrated, including the following:

  - Exchange mailboxes
  - Email data
  - Contacts
  - Calendar
  - Tasks
  - Notes
  - Exchange contacts
  - Distribution lists
  - Resources

### Before migration

Before migrating to Exchange 2016, consider the following information and perform the following tasks.

#### Back up data

Although we do not anticipate any issues with the migration, we recommend that you back up your data before the migration. You can back up your data by performing a PST export with Outlook. Note that any corrupt data is not migrated.

#### Autodiscover

Ensure that your Autodiscover DNS record points to Rackspace. For instructions on setting up a DNS record, see [Set up DNS records for Cloud Office email and Skype for Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business/).

#### Public folders

Exchange 2016 offers public folders on a hosted environment and has the following limitations:

- There is a limit of 25 folders with a maximum size of 250 MB per folder (root folder included).

- Exchange 2016 administrators must use the Admin Control Panel to manage public folders.

- Public folder administration (create, edit, move, and so on) is disabled in Outlook for Exchange 2016 customers.

- User permissions (such as granting read, edit, and delete access) is not available.

#### Spam filtering

The spam handling in Exchange 2016 is the same as Exchange 2013, and is different from Exchange 2007 and 2010. The quarantine manager is no longer used for Exchange mailboxes, and any spam messages that are sent to users are delivered to the junk/spam folder.

The domain quarantine still receives spam messages for other Exchange addresses (contacts, distribution lists, public folders, and resources). You can set the user's spam to be delivered to the domain quarantine, but only an administrator can access this quarantine manager.

#### Length of migration

The following items affect the length of your migration:

- Item count
- Mailbox size
- Total size of attachments
- Number of mailboxes on the domain
- Provisioning delays in our Exchange environment (see the [System Status Page](http://status.apps.rackspace.com/) for notice on this type of issue).

### Upgrade Exchange

You can use the self-service tool to upgrade Exchange at any time. All users of your Exchange server must migrate during the upgrade. If you receive an error while using the tool, contact [Rackspace Support](https://www.rackspace.com/support).

1. Log in to [Rackspacemigrations.com](https://rackspacemigrations.com/Account/Login) with the following information:

   - Account number
   - Admin ID
   - Password

   The migration portal lists all of your domains that use Exchange services.

2. Click the gear icon next to the domain that you want to upgrade and select **Create migration**.

   <img src="{% asset_path exchange/upgrade-to-exchange-2016/exchange-upgrade-step-1.png %}" />

3. On the Create Migration page, select a date and time to schedule the migration and then click **Next**.

   <img src="{% asset_path exchange/upgrade-to-exchange-2016/exchange-upgrade-2.png %}" />

4. On the confirmation page, verify the date and time, then click **Submit Migration**.

After you submit the migration information, you are returned to the [Rackspace migrations home page](https://rackspacemigrations.com/).

On the home page, you can see the status of your migration and see the Support ticket number used to track your migration. No automatic responses from this support ticket will be emailed to you, unless you log in to the Mail control panel and update the ticket.

You can also reschedule or cancel the migration before the scheduled time by clicking the gear icon next to the domain you are migrating and selecting the appropriate command.

  <img src="{% asset_path exchange/upgrade-to-exchange-2016/exchange-upgrade-5.png %}" />  

When the migration completes you can log into the [Mail Control Panel](https://apps.rackspace.com/) and manage the mailboxes.


### Frequently asked questions

This section provides answers to questions that you might have about the Exchange 2016 migration.

#### Do I need to change my MX records?

In most cases, you do not need to change your MX records because they should already be pointed to our environment. Our MX record details are located here in [Set up DNS records for Cloud Office email and Skype for Business](how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business/).

#### Can we migrate only some of our mailboxes?

No. This type of migration requires all users to migrate at once. This is because our environment allows the domain to reside in one exchange environment.

#### If Autodiscover is not set up, and I set it up now, will my users receive a prompt?

The reconfiguration prompt occurs in the following situations:

  - The user is using Outlook 2010 or 2013.
  - The user's profile was set up using Autodiscover.
  - The Autodiscover CNAME points to **autodiscover.emailsrvr.com** and the profile was configured using Autodiscover.

#### Is there any downtime?

There is no downtime during the migration. Mail is delivered without interruption. Users can send and receive email normally throughout the migration process.

#### How long does the migration take?

Many factors affect the speed of the migration, so we cannot accurately predict how long the migration takes. For factors that affect the migration, see the “Length of migration” section.

#### Do I need to reconfigure my mobile devices?

Yes, all mobile devices must be reconfigured. For all ActiveSync devices, you can either update the existing entries or remove the account and then add it again. Blackberry Enterprise Server 5 is not compatible with Exchange 2016. For Blackberry devices with software version 10.0 and later using ActiveSync, no reconfiguration is necessary.

#### Will I have access to my Admin Control Panel during the migration?

Yes, but it is important that you do not make any changes to your domain. Changes made during the migration cause issues.
