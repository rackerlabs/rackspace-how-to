---
permalink: cloud-hosting-faq/
audit_date:
title: Cloud Hosting FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2016-06-16'
last_modified_by: Kelly Holcomb
product: undefined
product_url: undefined
---

Get quick answers to common questions about Cloud Hosting.

### DNS

#### What is an SOA record?

A Start of Authority (SOA) resource record indicates which domain name
server (DNS) is the best source of information for the specified domain. Every
domain must have an SOA record.

When you add a domain to DNS, the email address that you indicate is
added to the SOA record for the domain. This publicly associates the
email with the domain.

<img src="{% asset_path general/cloud-hosting-faq/emailtoDomainassociation.png %}" width="445" height="247" />

For example, the email address associated with the **rackspace.com**
domain is **hostmaster@rackspace.com**. You can see the SOA record for
**rackspace.com** by running the following command:

    $ dig rackspace.com +nssearch

**Note**: `dig` is used for Linux systems. If you have a Windows server, use [nslookup](/how-to/nslookup-checking-dns-records-on-windows) instead.

The following information is returned:

    SOA ns.rackspace.com. hostmaster.rackspace.com. 1392389079 300 300 1814400 300 from server 69.20.95.4 in 12 ms.

The SOA record includes the following details:

-   The primary name server for the domain, ns.rackspace.com
-   The email for the domain, hostmaster@rackspace.com
-   Revision number that changes whenever you update the domain
-   Refresh time, which is the number of seconds before the zone should
    be refreshed
-   Retry time, which is the number of seconds before a failed refresh should
    be retried
-   Expiration time, which is the time, in seconds, before the data is
    considered unreliable
-   Minimum TTL, which is the default that applies to all resource records in the zone

------------------------------------------------------------------------

### General

#### Does Rackspace donate used equipment?

Rackspace sends *all* used compute/storage/network/drives (ewaste) to a
certified electronics refurbisher that is under contract with Rackspace.
This insures that all assets are securely and responsibly processed. We
are working on an Employee Purchase Program with the refurbishing
company to offer Rackers discounts on purchasing used/lower cost gear
that has been cleaned, tested and carries a limited warranty. Stay tuned
for more on this.
