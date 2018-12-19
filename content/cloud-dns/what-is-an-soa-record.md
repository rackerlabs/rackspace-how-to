---
permalink: what-is-an-soa-record/
audit_date: '2018-12-18'
title: DNS SOA records
type: article
created_date: '2016-01-19'
created_by: Rose Contreras
last_modified_date: '2018-12-18'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

A Start of Authority (SOA) resource record indicates which Domain Name
Server (DNS) is the best source of information for the specified domain.
Every domain must have an SOA record.

When you add a domain to the DNS, the email address that you enter is
added to the SOA record for the domain. This publicly associates the email
with the domain.

For example, the email address associated with the **rackspace.com**
domain is **hostmaster@rackspace.com**. You can see the SOA record for
**rackspace.com** by running the following command:

    $ dig rackspace.com +nssearch

**Note**: You use the `dig` command to perform DNS queries on Linux&reg;
systems. If you have a Microsoft&reg; Windows&reg; server, use the
[nslookup](/how-to/nslookup-checking-dns-records-on-windows) tool instead.

The command returns the following response:

    SOA ns.rackspace.com. hostmaster.rackspace.com. 1392389079 300 300 1814400 300 from server 69.20.95.4 in 12 ms.

The SOA record includes the following details:

-   **Primary name server for the domain**: In this example,
    `ns.rackspace.com`.
-   **Email for the domain**: In this example, `hostmaster@rackspace.com`.
-   **Revision number**: This number changes every time you update the domain.
-   **Refresh time**: The number of seconds before the zone refreshes.
-   **Retry time**: The number of seconds before a failed refresh is
    retried.
-   **Expiration time**: The time, in seconds, before the data is
    considered unreliable.
-   **Minimum TTL**: The default that applies to all of the resource records
    in the zone.
