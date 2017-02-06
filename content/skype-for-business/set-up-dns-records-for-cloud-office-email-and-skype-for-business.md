---
permalink: set-up-dns-records-for-cloud-office-email-and-skype-for-business/
audit_date:
title: Set up DNS records for Cloud Office email and Skype for Business
type: article
created_date: '2014-08-15'
created_by: Cody Jobson
last_modified_date: '2017-02-06'
last_modified_by: Stephanie Fillmon
product: Microsoft Skype for Business
product_url: skype-for-business
---

To complete the configuration of your Rackspace Email, your hosted
implementation of Microsoft Exchange, or your hosted implementation of
[Microsoft Skype for Business](#set-up-dns-records-for-hosted-skype-for-business), you must set up DNS records. If incorrect
DNS settings are associated with your domain, you will experience
problems using these applications.

### Set up DNS records for email

This section provides information about the DNS records that you need to
set up for email transfer in Rackspace Email or Hosted Exchange.

Create the following entries, which are described below, on your DNS server:

-   [MX records](#mx-records)
-   [Autodiscover records](#autodiscover-records)
-   [SPF records](#spf-records)


#### MX records

A mail exchange (MX) record directs incoming email sent to your domain
to the specific server set up to accept email traffic for your domain.
For example, if your email is hosted through Rackspace you have MX
records that point to **mx1.emailsrvr.com (10)** and **mx2.emailsrvr.com
(20)**.

On your DNS server, set up MX records for both **mx1.emailsrvr.com** and
**mx2.emailsrvr.com** with the following information:

-   **Hostname:** blank or @
-   **Time to live (TTL):** 3600
-   **Record type:** MX
-   **Destination:** `mx1.emailsrvr.com`
-   **Priority:** 10

<!-- -->

-   **Hostname:** blank or @
-   **Time to live (TTL):** 3600
-   **Record type:** MX
-   **Destination:** `mx2.emailsrvr.com`
-   **Priority:** 20

<!-- -->

**Note:** To change the settings for your domain, you must own and have
access to edit these records. If you do not have access to do so,
contact your DNS provider. Typically it takes between 24 and 48 hours
for changes to DNS records to fully propagate. We recommend updating
your DNS records during off-peak traffic hours to allow for DNS
propagation. No mail is lost during this time.

#### Autodiscover records

Autodiscover is a service that enables you and your team to easily
configure your email clients by knowing only your Rackspace Email or
Microsoft Exchange email address and password. Autodiscover enables
additional features for Microsoft Exchange mailboxes such as downloading
the offline address book, viewing free and busy time in a calendar, and
using the Out-of-Office Assistant.

**Note:** Autodiscover is not compatible with Outlook 2011, Outlook
2016, or Mac Mail when setting up an email account as POP or IMAP.

To enable Autodiscover, set up a Canonical Name (CNAME) record with the
following information.

Replace *example.com* with your own domain name.

-   **Hostname:** `autodiscover.example.com`
-   **Time to live (TTL):** lowest possible
-   **Record type:** CNAME
-   **Destination:** `autodiscover.emailsrvr.com`

#### SPF records

The Sender Policy Framework (SPF) record is a DNS record designed to
combat and reduce spam for your domain. SPF records help mail servers
identify unauthorized use of your domain in the form of forgeries
(spoofing). SPF records also help improve your email deliverability rate
by preventing the email that you send from landing in a recipient's spam
or junk mail inbox.

To have an SPF record implemented, contact your DNS hosting provider and
have them add the following TXT record to your DNS:

-   **Hostname:** blank or @
-   **Time to live (TTL):** lowest possible
-   **Record type:** TXT
-   **Destination:** `v=spf1 include:emailsrvr.com ~all`

### **Set up DNS records for Hosted Skype for Business**

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
