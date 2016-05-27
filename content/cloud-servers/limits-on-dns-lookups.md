---
permalink: limits-on-dns-lookups/
audit_date:
title: Limits on DNS lookups
type: article
created_date: '2015-06-16'
created_by: David Hendler
last_modified_date: '2015-07-10'
last_modified_by: Renee Rendon
product: Cloud Servers
product_url: cloud-servers
---

All servers provisioned by Rackspace are configured to use Rackspace
caching name servers. This article addresses an individual server's
usage of Rackspace caching name servers to resolve domain names. It does
not relate to Rackspace authoritative name servers or Rackspace Cloud
DNS.

Rackspace does not permit unlimited or excessive DNS lookups from hosts
inside the data center.

By default, Rackspace does not limit traffic to our DNS servers, which
can allow short-term "bursts" to occur.  However, if a consistent rate
of more than 10 queries per second per host IP address (or 100 queries
per second per lookup target per account) is sustained, Rackspace will
limit this traffic to 10 queries per second. In some circumstances,
such as when a single large environment places excessive load on the DNS
system, it might be necessary to impose a lower limit to protect
Rackspace's shared infrastructure. Rackspace will determine such
circumstances at its sole discretion.

If Rackspace determines that the traffic generated is malicious,
Rackspace will block all DNS traffic to our DNS servers in order to
protect our shared DNS infrastructure in accordance with [our AUP](http://www.rackspace.com/information/legal/aup) until the situation
is resolved.

If your situation requires you to sustain recursive DNS lookup rates in
excess of the stated limits, consider the following options:

-   Install a server-side caching mechanism such as nscd (Linux). This
    will continue to query our name servers but will store results in a
    cache on the server. This option might also improve performance
    because your server will not need to make a DNS request for
    every lookup.
-   Install a stand-alone caching name server such as BIND.  All queries
    will then stay on the local network or server. This name server can
    be installed on an existing server or a dedicated system.
-   Use a third-party resolver.
-   If the lookups are for a small number of static names, you could use
    a **hosts** file to create static local entries. This option works
    well if a local service uses DNS to resolve another local service.
