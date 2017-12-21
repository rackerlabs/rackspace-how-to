---
permalink: block-senders-in-owa/
audit_date:
title: Block Senders in Outlook Web App
type: article
created_date: '2017-12-18'
created_by: William Loy
last_modified_date: '2017-12-21'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article describes steps to automatically mark senders as Junk through the Outlook Web App interface. See [Safelist senders in Outlook Web App](/how-to/safelist-senders-in-owa) if you would need to safelist a sender. 

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 15 minutes for change to complete
- **Tools Required:** Mailbox access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).


#### Block Senders

**Warning:** Outlook Web App does not include a setting to reject senders. It will only automatically mark blocked senders as junk. Administrators can reference [Blacklists in Microsoft Exchange](/how-to/spam-preferences-safe-lists-and-black-list-in-microsoft-exchange/#manage-black-list) for instructions on rejecting senders.

1. Log into your Exchange mailbox at [apps.rackspace.com](apps.rackspace.com)

2. Click the gear icon in the upper right-hand corner. Select **Options** from the drop down menu.

  <img src="{% asset_path exchange/block-senders-in-owa/options_gear.png %}" />

3. Click **Block or Allow** from the menu on the left hand side of the screen.

  <img src="{% asset_path exchange/block-senders-in-owa/block_or_allow.png %}" />

4. Enter the email address or domain of the sender which you would like to automatically send to Junk.

  <img src="{% asset_path exchange/block-senders-in-owa/blocked_senders.png %}" />
