---
permalink: rackspace-cloud-dns-overview/
audit_date: '2018-05-15'
title: Rackspace Cloud DNS overview
type: article
created_date: '2011-10-19'
created_by: Rackspace Support
last_modified_date: '2018-11-05'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

A Domain Name System (DNS) is a distributed system of servers that host the
resource records that are used to find where a website is hosted or where to
deliver an e-mail. Your registrar controls where a lookup is directed when
someone tries to check a record related to your domain.

### Rackspace Cloud DNS

The Rackspace Cloud DNS infrastructure is a globally-distributed Anycast
network. Rackspace has DNS servers located in Texas, Virginia, Illinois, and
London. Within each data center, we split up our name servers so that there's
no single point of failure in front of our DNS servers.

The following architecture diagram shows the Rackspace Cloud DNS
infrastructure:

<img src="{% asset_path cloud-dns/rackspace-cloud-dns-overview/dnsoverview.png %}" alt="" />

By using Anycast, Rackspace broadcast Internet Protocol (IP) addresses from
each location, which offers the following advantages:

-  DNS queries generally go to the geographically closest name servers and are
   therefore faster.
-  If an entire data center fails, or even if all of the DNS
   servers within a specific data center fail, the DNS queries
   automatically start going to the next best location.

**Next steps:** [Rackspace Cloud DNS - Available
Features](/how-to/rackspace-cloud-dns-available-features)
