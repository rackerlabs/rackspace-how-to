---
permalink: upgrading-to-exchange-2016/
audit_date:
title: Upgrading to Exchange 2016
type: article
created_date: '2015-12-16'
created_by: Ronnie Canizales
last_modified_date: '2016-10-18'
last_modified_by: Aaron Medrano
product: Microsoft Exchange
product_url: exchange
---

# Self Service Exchange Upgrade Tool Instructions

This article provides information about the upgrade from your current Exchange environment to Exchange 2016. Follow the steps in this article to ensure a successful migration to Exchange 2016.

# Helpful Information:

- There is no cost for this migration through this tool
- You can run an Exchange upgrade through this tool 24/7/365. Support is available during that time to assist, but should your migration error out and need the assistance of the Internal Migration Team, be advised that team is only in office M-F from 7am to 7pm CST.

- WHAT IS MIGRATED: Current Exchange environment which includes:
  - Exchange Mailboxes
  - Email data
  - Contacts
  - Calendar
  - Tasks
  - Notes
  - Exchange Contacts
  - Distribution Lists
  - Resources

#### Back up data

We do not anticipate any issues with the migration; however, we recommend that you back up your data before the migration. You can back up your data by performing a PST export using Outlook. Note that any corrupt data will not be migrated.

#### Autodiscover

Set up your Autodiscover DNS record for Exchange 2016. Features such as Automatic Outlook Configuration, Free/Busy Time, Out of Office, and Public Folders function only if this record is in place.

Complete instructions for setting up your Autodiscover record are located in [Set up DNS records for Cloud Office email and Skype for Business](http://www.rackspace.com/knowledge_center/article/set-up-dns-records-for-cloud-office-email-and-skype-for-business).

#### Outlook Web Access

The Outlook Web Access (OWA) tool will be available via the following links:

- Rackspace unified login - [https://apps.rackspace.com](https://apps.rackspace.com/)
- Direct login - [https://mex09.emailsrvr.com](https://mex08.emailsrvr.com/)


# Helpful Information:

- There is no cost for this migration through this tool
- You can run an Exchange upgrade through this tool 24/7/365. Support is available during that time to assist, but should your migration error out and need the assistance of the Internal Migration Team, be advised that team is only in office M-F from 7am to 7pm CST.
- WHAT IS MIGRATED: Current Exchange environment which includes:
  - Exchange Mailboxes
  - Email data
  - Contacts
  - Calendar
  - Tasks
  - Notes
  - Exchange Contacts
  - Distribution Lists
  - Resources

## Exchange Upgrade Tool Requirements:

In order to utilize this tool, you **MUST** have the following items:

- Make sure your Autodiscover record is set up and points to Rackspace. To Setup Autodiscover: [http://www.rackspace.com/knowledge\_center/article/how-to-set-up-dns-records-for-email-and-skype-for-business](http://www.rackspace.com/knowledge_center/article/how-to-set-up-dns-records-for-email-and-skype-for-business)
- Less than 25 Public Folders currently with your Exchange 2007 services (more details listed below)

# Prior to your Migration:

### Here are the supported email clients for Exchange 2016:

Anything older clients will not be able to successfully connect to our Exchange 2016 environment.

- Outlook 2016
- Outlook 2013
- Outlook 2011 for Mac
- Outlook 2010
- Outlook 2007 SP3
- Entourage 2008 EWS
- Mac Mail

### Here are some other things to consider prior to utilizing this tool:

- This type of migration requires all users to migrate at once.
- We highly recommend performing a local backup of your data since corrupt items will not migrate.
- The spam handling in Exchange 2016 **DOES NOT** utilize the quarantine manager for exchange mailboxes. Messages marked as spam will be delivered to the **JUNK-EMAIL** folder of the user&#39;s mailbox. The domain quarantine will still receive spam messages for other exchange addresses such as contacts, distribution lists and resources.
- Custom permissions for distribution lists (such as Send As/Restricted) and custom permissions for shared calendars in your email clients are **NOT** migrated.

# Running the Migration

## During the Migration:

- **DO NOT** make changes to the domain within the admin control panel because it will negatively impact the migration.
- This migration is a &quot;live mailbox move&quot;, which means that users can send and receive mail as the migration is taking place.

## Step 1:

Log in at [Rackspacemigrations.com](https://rackspacemigrations.com/Account/Login) with the following information:

- Account number
- Admin ID
- Password

You will be taken to a portal that lists all of your domains with Exchange services. Select the gear icon next to the domain you would like to upgrade (see below):

 ![Exchagne Upgrades 1.jpg]

## Step 2:

You will be prompted to select a date and time (time zone is Central Standard Time). You can only schedule migrations every hour, on the hour.

 ![Exchagne Upgrades 2.jpg]

## Step 3:

After selecting the date and time you will be taken to a screen that will seek your confirmation. Click &quot;Submit Migration&quot; when ready.

 ![Exchagne Upgrades 3.jpg]

You will then be taken back to the main screen. You will see the status for your migration as well as the Support Ticket number created to track your migration. Unless you log into your mail control panel and update this ticket, no automatic responses will be emailed directly to you.

As you can see from the screen shot, you have the ability to Reschedule or Cancel your migration prior to it starting.

\*\*Some things that affect the length of the migration are:

- Item count
- Mailbox size
- Total size of attachments
- Number of mailboxes on the domain
- Provisioning delays in our Exchange environment (you can consult our Rackspace Status Page, http://status.apps.rackspace.com/) for notice on this type of issue.

 ![Exchagne Upgrades 4.jpg]

## Step 4:

Once the migration begins you can monitor the status in the home page of rackspacemigrations.com. When the migration completes you can log into your Mail Control Panel and manage the mailboxes.

 ![Exchagne Upgrades 5.jpg]

 
# Post Migration:

- Users will have immediate access to the new Outlook Web Access: apps.rackspace.com
- The following link contains set up guides for manual configurations and our auto-configuration tool: https://emailhelp.rackspace.com

**Note**: Outlook 2003 and 2007 and Entourage 2004 are not supported with Exchange 2016. Users on Outlook 2003 or 2007 must be upgraded to Outlook 2010 or later.

#### Spam filtering

The spam handling in Exchange 2016 is the same as Exchange 2013, and is different from Exchange 2007 and 2010. We are no longer using the quarantine manager for Exchange mailboxes, and any spam messages that are sent to users will be delivered to the junk/spam folder.

The domain quarantine will still receive spam messages for other Exchange addresses (contacts, distribution lists, public folders, and resources). You can set the user's spam to be delivered to the domain quarantine, but only an administrator can access this quarantine manager.


### Frequently asked questions

This section provides answers to questions that you might have about the Exchange 2016 migration.

#### Do I need to change my MX records?

In most cases, you do not need to change your MX records because they should already be pointed to our environment. Our MX record details are located here in [Set up DNS records for Cloud Office email and Skype for Business](https://admin.rackspace.com/knowledge_center/article/set-up-dns-records-for-cloud-office-email-and-skype-for-business).

#### Could we migrate a portion of our mailboxes?

No. This type of migration requires all users to migrate at once. This is because our environment allows the domain to reside in one exchange environment.

#### If Autodiscover is not set up, and I set it up now, will my users receive a prompt?

The reconfiguration prompt will occur in the following situations:

  - The user is using Outlook 2010 or 2013.
  - The user's profile was set up using Autodiscover.
  - The Autodiscover CNAME points to **autodiscover.emailsrvr.com** and the profile was configured using Autodiscover._ _

#### Is there any downtime?

There is no downtime during the migration. Mail will be delivered without interruption. Users can send and receive email normally throughout the migration process.

#### How long will the migration take?

Many factors affect the speed of the migration, so we cannot accurately predict how long the migration will take.

#### Will I need to reconfigure my mobile devices?

Yes, all mobile devices must be reconfigured. For all ActiveSync devices, you can either update the existing entries or remove the account and then add it again. Blackberry Enterprise Server 5 is not compatible with Exchange 2016. For Blackberry devices with software version 10.0 and later using ActiveSync, no wipe is necessary.

#### Will I have access to my Admin Control Panel during the migration?

Yes, but it is important that you do not make any changes to your domain. Changes made during the migration will cause issues.
