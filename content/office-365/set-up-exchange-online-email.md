---
permalink: set-up-exchange-online-email/
audit_date: '2020-08-24'
title: Set up Exchange online email
type: article
created_date: '2020-08-18'
created_by: Allison Battles
last_modified_date: '2020-08-24'
last_modified_by: Nicholas Ramirez
product: Office 365
product_url: office-365
---

### Prerequisites

- **Applies to:** User (Admin to enable authentication via SMTP)
- **Difficulty:** Easy
- **Time needed:** 5-10 Minutes for initial configuration. Sync time varies based on network speed.
- **Tools required:** Licensed Microsoft 365&reg; user, active network connection

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

For additional information about Microsoft 365 licensing, see our [product comparison chart](https://www.rackspace.com/sites/default/files/2020-06/Rackspace-Data-Sheet-Microsoft-365-Plans-and-Pricing-Sheet-CLO-TSK-1487.pdf).

This article describes how to enable *authenticated SMTP* for Microsoft 365 Exchange&reg; Online mailboxes and
outlines the server settings for SMTP, IMAP, and POP protocols.

**Note:** If you are unsure whether your license includes Exchange Online, contact your administrator.

### Enable SMTP authentication for Microsoft 365 Exchange Online mailboxes

To send messages by using SMTP from an Exchange Online mailbox, an administrator needs to enable
**Authenticated SMTP** for the user through the [Microsoft 365 Admin Center](https://portal.office.com/Adminportal/Home)
by using the following steps:

1. Sign in through the [Microsoft 365 Admin Center](https://portal.office.com/Adminportal/Home).

2. Select **Users**->**Active Users**.

3. Click the display name of the mailbox for which you want to enable **Authenticated SMTP**.

4. In the mailbox details, select **Mail** and click **Manage email apps**.

5. Click the checkbox to enable **Authenticated SMTP** and then select **Save changes**.


### Configure Microsoft 365 Exchange Online mailboxes for SMTP, IMAP, and POP


To configure your Microsoft 365 Exchange Online mailbox for use through **SMTP**, use the following settings:

- **Outgoing server:** smtp.office365.com

- **Port:** 587

- **Encryption method:** TLS or STARTTLS


To configure your Microsoft 365 Exchange Online mailbox for use through **IMAP**, use the following settings:

- **Incoming Server:** outlook.office365.com

- **Port:** 993

- **Encryption method:** SSL


To configure your Microsoft 365 Exchange Online mailbox for use through **POP**, use the following settings:

- **Incoming Server:** outlook.office365.com

- **Port:** 995

- **Encryption method:** SSL
