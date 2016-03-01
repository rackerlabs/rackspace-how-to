---
node_id: 5054
title: Cloud Hosting FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

### DNS

#### What is an SOA record?

A Start of Authority (SOA) resource record indicates which DNS name
server is the best source of information for the specified domain. Every
domain must have an SOA record.

When you add a domain to DNS, the email address that you indicate is
added to the SOA record for the domain. This publicly associates the
email with the domain.

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/emailtoDomainassociation.png" width="445" height="247" />

For example, the email address associated with the **rackspace.com**
domain is **hostmaster@rackspace.com**. You can see the SOA record for
**rackspace.com** by running the following command:

        dig rackspace.com +nssearch

The following information is returned:

    SOA ns.rackspace.com. hostmaster.rackspace.com. 1392389079 300 300 1814400 300 from server 69.20.95.4 in 12 ms.

The SOA record includes the following details:

-   The primary name server for the domain, ns.rackspace.com
-   The e-mail for the domain, hostmaster@rackspace.com.
-   Revision number that changes whenever you update your domain.
-   Refresh time, the number of seconds before the zone should
    be refreshed.
-   Retry time, the number of seconds before a failed refresh should
    be retried.
-   Expiration time, the time, in seconds, before the data is
    considered unreliable.
-   Minimum TTL, this default applies to all resource records in the
    zone

------------------------------------------------------------------------

### General

#### Does Rackspace donate used equipment?

Rackspace sends ALL used compute/storage/network/drives (e-waste) to a
certified electronics refurbisher that is under contract with Rackspace.
This insures that all assets are securely and responsibly processed. We
are working on an Employee Purchase Program with the refurbishing
company to offer Rackers discounts on purchasing used/lower cost gear
that has been cleaned, tested and carries a limited warranty. Stay tuned
for more on this.
