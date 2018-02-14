---
permalink: upgrade-rackspace-email-and-microsoft-exchange-to-office-365-faq/
audit_date: '2017-07-11'
title: Upgrade Rackspace Email and Microsoft Exchange to Office 365 FAQ
type: article
created_date: '2017-06-29'
created_by: Casey Gurbanov
last_modified_date: '2018-01-08'
last_modified_by: William Loy
product: Office 365
product_url: office-365
---

Get quick answers to common questions about moving from Rackspace Email or Hosted Microsoft Exchange to Rackspace Office 365.

### Prerequisites

- **Applies to:** Administrators
- **Difficulty:** Moderate

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Upgrade FAQ

#### Who sets up the Rackspace Office 365 environment and what does that process entail?

Administrators add the Office 365 licenses to their account and create their new Office 365 environment. See the following instructional articles in the order listed to prepare for migration:

 1.  [Create your Office 365 Tenant](/how-to/set-up-office-365#create-a-tenant-id)
 2.  [Add your domain in Office 365](/how-to/add-a-domain-in-office-365)
 3.  [Add an Office 365 license](/how-to/add-an-office-365-license)
 4.  [Assign an Office 365 license to a user](/how-to/add-an-office-365-license#assign-an-office-365-license-to-a-user)

**Note:** You must complete these steps before self-migrating or requesting an assisted migration.

#### Can the Rackspace Migrations Team migrate my data?

Yes! Admins can request Assisted Migration with our team or use the [Self-Service Migration tool](/how-to/migrate-your-email-by-using-the-self-service-migration-tool/) located within the [Cloud Office Control Panel](cp.rackspace.com). Admins are responsible for re-creating their entire environment within Office 365 and the Migrations team migrates the email data by using MigrationWiz.

#### Do my users have to create new profiles for their desktop mail clients and mobile devices?

Yes, all users must create new profiles. We’ve created an online mail client setup tool that walks users through configuring their email for use on all of the most popular desktop and mobile platforms: [https://emailhelp.rackspace.com/](https://emailhelp.rackspace.com/)

#### Am I charged for both environments during this transitional period?

Yes. Your invoice will reflect fees for both environments while they remain active on your account. We can work with you to determine a timeline for migration that accommodates any billing concerns. After your transition to Office 365 is complete, you must delete your Rackspace Email and Microsoft Exchange mailboxes and request that those licenses be removed from your account to avoid future billing.

#### Is there be downtime during the migration?

No. When we migrate your data, you will continue to use your Microsoft Exchange or Rackspace Email mailboxes until you change your domain's DNS records to receive mail at your new Office 365 mailboxes.

#### Does Rackspace update the customer’s DNS records?

No. Admins are responsible for updating their domain's DNS records. The migration specialist provides you with a list of records that must be updated. Rackspace does not have access to your externally hosted DNS and cannot accept access to external DNS hosting accounts.

If you use the self-service migration tool, follow the instructions in [Add your domain in Office 365](/how-to/add-a-domain-in-office-365) to update your domain's DNS records.

#### Are my Rackspace Email or Microsoft Exchange passwords migrated over?

No. Admins create the new mailboxes via the Office 365 Admin Center and create new passwords. Existing passwords might or might not work with the Office 365 password requirements. We can access your Microsoft Exchange passwords for migration purposes, but all Rackspace Email passwords must be provided. If you use the self-service migration tool, you must enter those individual passwords into that tool.

#### What items are *not* migrated from Rackspace Email or Microsoft Exchange to Office 365?

  - Aliases
  - Alternate addresses
  - Group lists
  - Distribution lists
  - Public folders
  - Custom groups created via Outlook
  - Custom color coded calendar items
  - Local data
