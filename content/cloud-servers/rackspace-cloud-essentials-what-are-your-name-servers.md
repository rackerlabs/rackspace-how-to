---
node_id: 731
title: Rackspace Cloud Essentials - What Are Your Name Servers?
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-04'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Rackspace Cloud Essentials - Building your cloud inventory](/how-to/rackspace-cloud-essentials-guide-building-your-cloud-inventory/)

By now, you have built your server, made it secure, and uploaded content
to your server. The last step in the First 48 Hour Essentials is to
configure your DNS so the rest of the Internet knows where to find your
site.

The most commonly asked DNS question is about our name servers. Name
servers store the internet directory information that connects your
domain name to your website and email hosting. Essentially, name
servers tell the internet where to find your website and where to
deliver your email. Our name servers are:

-   **dns1.stabletransit.com**
-   **dns2.stabletransit.com**

If you have a domain that you have already registered and you want to
host it from your Rackspace Cloud Server, you will need to go to the
domain registrar and set our name servers for the domain.  This DNS
change will take a variable amount of time to propagate to the Internet
from your domain registrar, but usually not more than 24 hours.

If you're unsure of your current name servers, a WHOIS search can help
you determine which name servers are currently assigned to your domain
name. Whenever you change your hosting service provider, the name server
information for your domain must be updated to reflect that your site is
now being served by a different IP address.

In the next article we'll go into more detail on the process for
Transferring Your Domain to be Served From the Rackspace Cloud.

### Next steps

[Transferring Your Domain to the Rackspace Cloud](/how-to/rackspace-cloud-essentials-transferring-your-domain-to-be-served-from-rackspace-cloud)
