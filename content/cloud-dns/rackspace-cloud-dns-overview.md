---
permalink: rackspace-cloud-dns-overview/
audit_date: '2018-05-15'
title: Rackspace Cloud DNS - Overview
type: article
created_date: '2011-10-19'
created_by: Rackspace Support
last_modified_date: '2018-05-15'
last_modified_by: Cat Lookabaugh
product: Cloud DNS
product_url: cloud-dns
---

The Rackpace Cloud DNS infrastructure is a globally-distributed Anycast
network. Rackspace currently has DNS servers located in Texas, Virginia,
Illinois, and London. Within each datacenter, we split up our name servers so
that we have no single point of failure in front of our DNS servers.

<img src="{% asset_path cloud-dns/rackspace-cloud-dns-overview/dnsoverview.png %}" alt="" />

Using Anycast, we broadcast IP addresses from each location, which gives
us two advantages:

1.  The DNS queries generally go to the geographically closest name servers. This gives 
    faster results no matter where the queries originate.
2.  If an entire datacenter fails, or even if all of the DNS
    servers within a specific datacenter fail, the DNS queries
    automatically start going to the next best location.

**Next steps:** [Rackspace Cloud DNS - Available Features](/how-to/rackspace-cloud-dns-available-features)
