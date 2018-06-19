---
permalink: about-ttl-best-practices/
audit_date:
title: Best practices for using TTL
type: article
created_date: '2012-07-23'
created_by: Rackspace Support
last_modified_date: '2018-06-14'
last_modified_by: Nate Archer
product: Cloud DNS
product_url: cloud-dns
---

When specifying Time To Live (TTL) you should be aware of the following important factors:

- The higher the TTL, the less frequently caching name servers need to query authoritative name servers.

     A higher TTL reduces the perceived latency of a site and decreases the dependency on the authoritative name servers.

- The lower the TTL, the sooner the cached record expires.  This allows the queries for the records to occur more frequently.

If you’re going to make DNS changes, we suggest lowering the TTL to make the changes. If you're using DNS for failover, then lowering the TTL is a good idea as it takes less time to fail-over to another server.

Generally, we recommend a TTL of 24 hours (86,400 seconds). However, if you are planning to make DNS changes, you should lower the TTL to 5 minutes (300 seconds) at least 24 hours in advance of making the changes. After the changes are made, increase the TTL back to 24 hours.

**Note**: If DNS is used for failover, then you should probably keep the TTL at approximately 5 minutes all the time.
