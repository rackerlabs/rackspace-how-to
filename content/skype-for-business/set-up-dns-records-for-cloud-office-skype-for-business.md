---
permalink: set-up-dns-records-for-cloud-office-skype-for-business/
audit_date: '2017-05-30'
title: Set up DNS records for Cloud Office Skype for Business
type: article
created_date: '2017-05-17'
created_by: William Loy
last_modified_date: '2017-05-30'
last_modified_by: William Loy
product: Microsoft Skype for Business
product_url: skype-for-business
---

This article describes how to set up DNS for the Skype for Business offering from Rackspace Cloud Office. If you need to configure your DNS for Rackspace Cloud Office email products, see [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email).

### Prerequisites

- **Applies to:** Administrators
- **Difficulty:** Moderate
- **Time needed:** Approximately 30 minutes to configure and an additional 24-48 hours to propagate
- **Tools required:** DNS host administrator access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Set up DNS records for Skype for Business

To configure your hosted implementation of Microsoft Skype for Business formerly Microsoft Lync, you must set up DNS records. The following CNAME and SRV records must be in place to enable Skype for Business to work with the Hosted Exchange environment.

**CNAME records**

-   autodiscover.*example.com*
-   lyncdiscover.*example.com*
-   sip.*example.com*

**SRV records**

-   \_sip.\_tls.*example.com*
-   \_sipfederationtls.\_tcp.*example.com*

Because of the nature of our hosted environment, the domain listed for the the CNAME records will contain specific Skype for Business DNS records. Use our help tool for the specific DNS records for your domain. 

After you log in with a mailbox that is enabled for Skype for Business, you can find the DNS settings through the [Help Tool](https://emailhelp.rackspace.com/) as shown in the following image.

<img src="{% asset_path skype-for-business/set-up-dns-records-for-cloud-office-email-and-skype-for-business/SkypeforBusinessa.png %}" width="656" height="261" />

**Note:** If you have an internal DNS, you must also set up these records on your internal DNS. If you want to enable Skype for Business federation with domains hosted outside of Rackspace or domains that are hosted within Rackspace, contact our support team to learn more.

### Related article

[Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email)
