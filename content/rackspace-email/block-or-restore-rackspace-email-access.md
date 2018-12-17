---
permalink: block-or-restore-rackspace-email-access/
audit_date: '2018-01-10'
title: Block or restore Rackspace Email access
type: article
created_date: '2017-09-13'
created_by: William Loy
last_modified_date: '2018-01-10'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to block or restore user access to a Rackspace email mailbox.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

Blocking access to a mailbox prevents users from logging into that mailbox. You might need to block access to a mailbox if an employee has left your company, or if you suspect the account has been compromised.

**Warning:** Disabling a mailbox does not remove it from your billing. The mailbox continues to receive and store mail even after access is blocked.

### Block mailbox access

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") by using your Rackspace Cloud Office admin ID and password.
2. In the **Rackspace Email** section, click **Mailboxes**.

   <img src="{% asset_path rackspace-email/block-or-restore-rackspace-email-access/add-mailbox-sc1.png %}" />

3. If you have multiple domains, select the domain for the mailbox to which you intend to block access.
4. Next, you see a list of your mailboxes. In the far-right column, **Action**, click **Block Access** to block access to the corresponding mailbox in that row.

   <img src="{% asset_path rackspace-email/block-or-restore-rackspace-email-access/list_block_access.png %}" />

5. A message displays confirming that you want to block access. Read the message, and then click **YES, BLOCK ACCESS**.

   <img src="{% asset_path rackspace-email/block-or-restore-rackspace-email-access/block_pop_up.png %}" />

The mailbox is then greyed out in the mailbox list. You have now blocked users from accessing that mailbox.

### Restore mailbox access

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") by using your Rackspace Cloud Office admin ID and password.
2. In the **Rackspace Email** section, click **Mailboxes**.

   <img src="{% asset_path rackspace-email/block-or-restore-rackspace-email-access/add-mailbox-sc1.png %}" />

3. If you have multiple domains, select the domain for the mailbox to which you intend to restore access.
4. Next, you see a list of your mailboxes. In the far right column **Action**, click **Restore Access** to restore access to the corresponding mailbox in that row.

    <img src="{% asset_path rackspace-email/block-or-restore-rackspace-email-access/restore_access.png %}" />

5. A message displays confirming that you want to restore access. Read the message and click **YES, RESTORE ACCESS**.

    <img src="{% asset_path rackspace-email/block-or-restore-rackspace-email-access/restore_pop_up.png %}" />

The mailbox is no longer greyed out in the mailbox list. Users can now access that mailbox.
