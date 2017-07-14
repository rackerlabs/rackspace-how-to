---
permalink: serving-your-domain-from-a-rackspace-cloud-server/
audit_date:
title: Serve Your Domain From a Rackspace Cloud Server
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2017-05-15'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Rackspace Cloud is not a domain registrar like GoDaddy, Tucows, or
NameCheap. In order to serve your domain from a Rackspace Cloud Server,
you will need to have already registered your domain with a valid
registrar. In order to serve that domain from your Rackspace Cloud
Server, it will be necessary to change the nameservers associated with
the domain, so that traffic can be routed to your domain being served
from your Cloud Server.

You can change the name servers for an existing domain to the Rackspace
name servers by following these steps:

1.  Use the Rackspace Cloud Control Panel to create corresponding DNS
    records for your domain.

2.  Log into your domain registrar's account and locate the section that
    specifies the name servers.

3.  Change the name servers to the Rackspace Cloud name servers:

-   **ns.rackspace.com**
-   **ns2.rackspace.com**

Changing the name servers at your registrar initiates the change that
will direct DNS queries for your domain to the Rackspace name servers.
You will still need to manage and renew your domain subscription through
the original domain registrar.

**Notes**:

-   <span>For most domains, DNS propagation can take up to
    48 hours.</span>

