---
permalink: blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/
audit_date:
title: Blacklist addresses, domains, and IPs in Rackspace Email webmail
type: article
created_date: '2017-09-29'
created_by: William Loy
last_modified_date: '2017-10-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to Blacklist an email address or IP address in the Rackspace Email webmail interface to protect your mailbox from unwanted mail.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:**  apps.rackspace.com access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### What does Blacklisting accomplish?

When you blacklist an email address or IP, this creates a rule that rejects any mail sent from the email address or IP you have specified. This is useful when trying to [combat spoofing](/how-to/email-spoofing-explained) or spam. If you need to **Safelist** a sender see [Safelist addresses, domains and IPs in Rackspace Email webmail](/how-to/safelist-addresses-domains-and-ips-in-rackspace-email-webmail).

**Warning:** Use caution when blacklisting entire domains or IP addresses as you may be unintentionally blocking legitimate mail.

### Add a Blacklisted email address or domain

1. Log into your mailbox at [apps.rackspace.com](https://apps.rackspace.com).

2. Click your email address in the upper right hand corner and select **Settings** from the dropdown menu.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/blacklist_settings.png %}"/>

3. Click **Spam Settings** on the left hand side of the pop up box.

4. Select the third tab labeled **Blacklist**.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/spam_settings.png %}"/>

5. Click **Add** under the box titled **Blacklisted Domains & Email Addresses**.

6. You will be prompted with a box title **Add Blacklisted Domain or Email Address**. Enter the domain or email address you wish to blacklist in the field under **Enter a domain or email address** and click **Add**.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/add_blacklist.png %}"/>

7. Confirm the address is now listed in the box under **Blacklisted Domains & Email Addresses**, then click **Save**.

### Add a Blacklisted IP address

If you need to blacklist and IP, follow steps 1-4 above and continue here.

1. Click **Add** under the box titled **Blacklisted IP Addresses**.

2. You will be prompted with a box title **Add Blacklisted IP Address**. Enter the IP address you wish to blacklist in the field under **Enter an IP address(or range)** and click **Add**.

    <img src="{% asset_path rackspace-email/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/add_ip.png %}"/>

3. Confirm the address is now listed in the box under **Blacklisted Domains & Email Addresses**, then click **Save**.
