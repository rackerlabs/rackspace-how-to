---
permalink: blacklist-addresses-domains-and-ip-addresses-in-rackspace-email/
audit_date: '2017-11-13'
title: Blacklist addresses, domains, and IP addresses in Rackspace email
type: article
created_date: '2017-09-29'
created_by: William Loy
last_modified_date: '2017-11-29'
last_modified_by: Cat Lookabaugh
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to add an email address,domain, or IP address to a blacklist in the Rackspace Email webmail interface to protect your mailbox from unwanted mail.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:**  apps.rackspace.com access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Why use a Blacklist?

When you blacklist an email address, domain, or IP address, this creates a rule that rejects any mail sent from the source that you specified. Using a blacklist can help [combat spoofing](/how-to/email-spoofing-best-practices) or spam. If you need to **safelist** a sender see [Safelist addresses, domains and IP addresses in Rackspace email](/how-to/safelist-addresses-domains-and-ips-in-rackspace-email).

**Warning:** Use caution when blacklisting entire domains or IP addresses, because you might unintentionally block legitimate mail.

If you would prefer a video tutorial see [Email Help - Blacklisting / Safelisting With Rackspace Email](https://emailhelp.rackspace.com/l/blacklist-webmail).

### Blacklist an email address or domain

1. Log into your mailbox at [apps.rackspace.com](https://apps.rackspace.com).

2. Click your email address in the upper right-hand corner, and select **Settings** from the menu.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/blacklist_settings.png %}"/>

3. Click **Spam Settings** on the left side of the pop-up box, and the select the **Blacklist** tab.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/spam_settings.png %}"/>

4. In the **Blacklisted Domains & Email Addresses** box, click **Add**.

5. When prompted to **Add Blacklisted Domain or Email Address**, enter the domain or email address that you want to blacklist in the field under **Enter a domain or email address**, and then click **Add**.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/add_blacklist.png %}"/>

6. Confirm that the address is now listed in the box under **Blacklisted Domains & Email Addresses**, and click **Save**.

### Blacklist an IP address

If you need to blacklist an IP address, follow steps 1-3 in the preceding section, and then complete the following steps:

1. In the **Blacklisted IP Addresses** box, click **Add**.

2. When prompted to **Add Blacklisted IP Address**, enter the IP address you want to blacklist in the field under **Enter an IP address(or range)**, and then click **Add**.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/add_ip.png %}"/>

3. Confirm that the address is now listed in the box under **Blacklisted Domains & Email Addresses**, and click **Save**.
