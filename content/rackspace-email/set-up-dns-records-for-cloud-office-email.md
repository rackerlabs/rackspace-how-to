---
permalink: set-up-dns-records-for-cloud-office-email/
audit_date: '2017-05-30'
title: Set up DNS records for Cloud Office email
type: article
created_date: '2014-08-15'
created_by: William Loy
last_modified_date: '2017-10-20'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to initially configure your domain's DNS to start receiving email through Rackspace Cloud Office. If you do not require instructions, see the table in step 2 of [Configure DNS to send and receive email](#configure-dns-to-send-and-receive-email) for the required DNS entry values.

### Prerequisites

- **Applies to:** Administrators
- **Difficulty:** Moderate
- **Time needed:** Approximately 30 minutes to configure and an additional 24-48 hours to propagate
- **Tools required:** DNS host administrator access

You also need access to update DNS entries for your domain. If you do not know where your DNS is hosted, see [Find your DNS host](/how-to/find-dns-host).

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Types of DNS entries

The following DNS entries are required to properly use email services at Rackspace.

- **MX records** tell other email providers where to send email. Your MX records should point to Rackspace. [More about MX records](/how-to/dns-record-definitions#mx-record).

- **SPF records** reduce unwanted SPAM and spoofing from your domain and ensures that outgoing emails are delivered [More about SPF records](/how-to/dns-record-definitions#txt-record).

- **Autodiscover records** allow for full functionality of calendar features (free/busy information) and easier email client setups. [More about Autodiscover records](/how-to/dns-record-definitions#cname-record).

### Configure DNS to send and receive email

Use the following steps to ensure your domain properly routes incoming and outgoing email.

**Warning:** If you host your email through our Office 365 solution please see [Office 365 domain setup](/how-to/add-a-domain-in-office-365/) for instructions.

1. Log in to the control panel for your domain DNS host. If you host your DNS with Rackspace Cloud Office please see [Edit DNS in the Cloud Office control panel](/how-to/edit-dns-in-the-cloud-office-control-panel).

2. Set the DNS entries to the values shown in the following table. Ensure that no other MX record entries exist or you will experience complications with your email. For more information, see [Add or edit entries for your DNS host](/how-to/find-dns-host#add-or-edit-entries-for-your-dns-host).

   | Type | Hostname | Destination | Priority | TTL |
   | :---: | :---: | --- | :---: | :---: |
   | MX | @ or left blank | **mx1.emailsrvr.com** | 10 | 3600 seconds or lowest allowed |
   | MX | @ or left blank | **mx2.emailsrvr.com** | 20 | 3600 seconds or lowest allowed |   
   | TXT | @ or left blank | **v=spf1 include:emailsrvr.com ~all** | NA | 3600 seconds or lowest allowed |
   | CNAME | autodiscover | **autodiscover.emailsrvr.com** | NA | 3600 seconds or lowest allowed |

    **Note:** Your new settings take 24 to 48 hours to propagate to the world. For more information on **propagation**, see [DNS propagation](/how-to/dns-record-definitions#dns-propagation).

3. Save your changes.

You have successfully set up your DNS for your domain.

**Warning:** If you change DNS settings for a domain that was hosting email elsewhere, user email clients and devices must be reconfigured to point to Rackspace. Send your users to <http://emailhelp.rackspace.com> to assist them with new settings.


If you would prefer a video tutorial with more information about DNS, see [Rackspace Email - Domain Name System: Introduction & Setup](https://emailhelp.rackspace.com/l/dns-introduction-and-setup).

### Related article

- [Set up DNS for Cloud Office Skype for Business](/how-to/set-up-dns-records-for-cloud-office-skype-for-business)
