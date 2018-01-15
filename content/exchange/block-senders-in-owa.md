---
permalink: block-senders-in-owa/
audit_date: '2018-01-15'
title: Block Senders in Outlook Web App
type: article
created_date: '2017-12-18'
created_by: William Loy
last_modified_date: '2018-01-15'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article describes how to automatically mark senders as junk through the Outlook Web App interface. If you need to safelist a sender, see [Safelist senders in Outlook Web App](/how-to/safelist-senders-in-owa).

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 15 minutes for change to complete
- **Tools Required:** Mailbox access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Block Senders

**Warning:** Outlook Web App does not include a setting to reject senders. It only automatically marks blocked senders as junk. Administrators can reference [Blacklists in Microsoft Exchange](/how-to/spam-preferences-safe-lists-and-black-list-in-microsoft-exchange/#manage-black-list) for instructions on how to reject senders.

1. Log in to your Exchange mailbox at [apps.rackspace.com](apps.rackspace.com)

2. Click the gear icon in the upper right-hand corner, and then select **Options** from the drop down menu.

    <img src="{% asset_path exchange/block-senders-in-owa/options_gear.png %}" />

3. In the **Options** menu, click **Mail > Accounts > Block or Allow**.

    <img src="{% asset_path exchange/block-senders-in-owa/block_or_allow.png %}" />

4. Enter the email address or domain of the sender that you want to automatically mark as junk.

    <img src="{% asset_path exchange/block-senders-in-owa/blocked_senders.png %}" />

5. Click **Save**.     
