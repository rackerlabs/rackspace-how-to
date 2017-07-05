---
permalink: rackspace-email-and-microsoft-exchange-upgrade-to-office-365-faq/
audit_date:
title: Rackspace Email and Microsoft Exchange upgrade to Office 365 FAQ
type: article
created_date: '2017-06-29'
created_by: Casey Gurbanov
last_modified_date: '2017-06-29'
last_modified_by: William Loy
product: Office 365
product_url: office-365
---
Frequently Asked Questions by customers moving from Rackspace Microsoft Exchange or Rackspace Email to Rackspace Office 365.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** Onboarding to O365 (which includes the data migration) can take anywhere from 2 to 6 weeks depending on your situation.
- **Tools required:** Customers will need access to their Cloud Office Control Panel, Office 365 Admin Center and the ability to access and edit your DNS Records.

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Rackspace Email and Hosted Exchange upgrade to Office 365 FAQ

#### Who sets up my Rackspace Office 365 environment and what does that process entail?
Administrators will be tasked with adding the Office 365 licenses to their account and creating their new Office 365 environment. Please see the following instructional articles in the order listed to prepare for migration:
 - [Create your Office 365 Tenant](/how-to/office-365/#create-your-tenant-id/)
 - [Add your domain in Office 365](/how-to/add-a-domain-in-office-365/)
 - [Add an Office 365 license](/how-to/add-an-office-365-license/#add-an-office-365-license/)
 - [Create users in Office 365](how-to/add-an-office-365-license/#assign-an-office-365-license/)


  Note: You will need to complete these steps before self-migrating or requesting an assisted migration.

#### Can the Rackspace Migrations Team migrate my data?
Yes! Admins can request an Assisted Migration with our team or utilize the [Self-Service Migration Tool](/how-to/migrate-your-email-by-using-the-self-service-migration-tool/) located within the [Cloud Office Control Panel](cp.rackspace.com). Admins will be responsible for recreating their entire environment within Office 365 and the Migrations Team will copy the email data over using MigrationWiz.

#### Will my users have to create brand new profiles for their desktop mail clients and mobile devices?
Yes, all users will have to create new profiles. For your convenience, we’ve created an online mail client setup tool for you to direct your users to.  This site walks users through configuring their email for use on all of the most popular desktop and mobile platforms: [https://emailhelp.rackspace.com/](https://emailhelp.rackspace.com/)

#### Am I charged for both environments during this transitional period?
Yes, your invoice will reflect fees for both environments while they remain active on your account. We can work with you to determine best timelines for migrating to try and accommodate billing concerns. Once your transition to Office 365 is complete you will need to delete your Rackspace Email and Hosted Exchange mailboxes and request those licenses be removed from your account to avoid future billing.

#### Will there be downtime during the migration?
No. When we copy over your data you will continue using your Rackspace Microsoft Exchange or Rackspace Email mailboxes until it is time to change your domain's DNS records to receive mail at your new Office 365 mailboxes.

#### Will Rackspace update the customer’s DNS records?
No, the Admin is responsible for updating their domain's DNS records. The migration specialist will provide you with a list of records that need to be updated. Rackspace does not have access to your externally hosted DNS and is not able to accept access to external DNS hosting accounts due to privacy and security reasons.

If you use the self-migration tool, follow the instructions in [Add your domain in Office 365](/how-to/add-a-domain-in-office-365/) carefully to update your domain's DNS records

#### Will my Rackspace Email or Microsoft Exchange passwords be migrated over?
No, Admins will create the new mailboxes via the Office 365 Admin Center and create new passwords. The existing password may or may not work with the Office 365 password requirement. We are able to access your Rackspace Hosted Exchange passwords for migration purposes but all Rackspace Email passwords will need to be provided. If you use the Self-Service Migration tool you will need to input those individual passwords into that tool.

#### What items are NOT migrated from Rackspace Email or Microsoft Exchange to Office 365?

  - Aliases
  - Alternate Addresses
  - Grouplists
  - Distribution Lists
  - Public Folders
  - Custom Groups created via Outlook
  - Custom color coded Calendar items
  - Local data
