---
permalink: disable-or-enable-exchange-email-access/
audit_date: '2018-01-15'
title: Disable or enable Exchange email access
type: article
created_date: '2017-12-19'
created_by: William Loy
last_modified_date: '2018-01-15'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article explains how to disable or enable access to an Exchange mailbox.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

Blocking access to a mailbox prevents users from logging in to that mailbox. You might need to block access to a mailbox if an employee has left your company or if you suspect the account has been compromised.

**Warning:** Disabling a mailbox does not remove it from your billing. The mailbox continues to receive and store mail when access to it has been blocked.

### Disable mailbox access

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") by using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Mailboxes**.

   <img src="{% asset_path exchange/disable-or-enable-exchange-email-access/hex_mailboxes.png %}" />

3. If you have multiple domains, select the domain for the mailbox to which you intend to block access.
4. Next, you see a list of your mailboxes. In the far-right column, **Action**, click **Disable** to block access to the corresponding mailbox in that row.

   <img src="{% asset_path exchange/disable-or-enable-exchange-email-access/hex_disable.png %}" />

5. A message displays confirming that you have disabled access to the mailbox.

   <img src="{% asset_path exchange/disable-or-enable-exchange-email-access/disable_success.png %}" />

The mailbox is then greyed out in the mailbox list. You have now blocked users from accessing that mailbox.

### Enable mailbox access

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") by using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Mailboxes**.

   <img src="{% asset_path exchange/disable-or-enable-exchange-email-access/hex_mailboxes.png %}" />

3. If you have multiple domains, select the domain for the mailbox to which you intend to restore access.
4. Next, you see a list of your mailboxes. In the far-right column, **Action**, click **Enable** to restore access to the corresponding mailbox in that row.

   <img src="{% asset_path exchange/disable-or-enable-exchange-email-access/hex_enable.png %}" />

The mailbox is no longer greyed out in the mailbox list. Users can now access that mailbox.
