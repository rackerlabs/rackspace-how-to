---
permalink: set-up-dns-records-for-cloud-office-skype-for-business/
audit_date:
title: Set up DNS records for Cloud Office Skype for Business
type: article
created_date: '2017-05-17'
created_by: William Loy
last_modified_date: '2017-05-17'
last_modified_by: William Loy
product: Microsoft Skype for Business
product_url: skype-for-business
---

**Applies To:** Account Administrator

**Difficulty:** Moderate

**Time Needed:** 30 minutes to figure/24-48 hours to propagate

**Tools Required:** DNS host administrator access

## Overview
Instructions for configuring Rackspace Cloud Office Skype for Business. If you need to configure your DNS for Rackspace Cloud Office Email products click [here](https://support.rackspace.com/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

## **Set up DNS records for Hosted Skype for Business**

To complete the configuration of your hosted implementation of Microsoft
Skype for Business formerly Microsoft Lync, you must set up DNS records.
The following three CNAME records and two SRV records must be in place
to enable Skype for Business to work with the Hosted Exchange
Environment.

CNAME records

-   autodiscover.*example.com*
-   lyncdiscover.*example.com*
-   sip.*example.com*

SRV records

-   \_sip.\_tls.*example.com*
-   \_sipfederationtls.\_tcp.*example.com*

Because of the nature of our hosted environment, the domain listed for
these three CNAME records will contain specific Skype for Business DNS
records. Use our help tool for the specific DNS records for your domain.
After you log in with a mailbox that is enabled for Skype for Business,
you can find the DNS settings through the [Help
Tool](https://emailhelp.rackspace.com/) as shown in the following image.

<img src="{% asset_path skype-for-business/set-up-dns-records-for-cloud-office-email-and-skype-for-business/SkypeforBusinessa.png %}" width="656" height="261" />

**Note:** If you have an internal DNS, you must also set up these records on your internal DNS. If you want to enable Lync federation with domains hosted outside of Rackspace or domains that are hosted within Rackspace, contact our support team to learn more.
