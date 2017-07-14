---
permalink: design-and-build-cloud-servers-for-stability/
audit_date:
title: Design and Build Cloud Servers for Stability
type: article
created_date: '2013-12-17'
created_by: Joseph Palumbo
last_modified_date: '2016-09-23'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

Developing a powerful application or a beautifully designed web
interface is only part of the job when mission critical availability is
necessary for your business. Following are some best practices that the
support team at Rackspace has developed to keep your site highly
available.

### Cloud Monitoring and Cloud Backups

Even when you're using cutting edge cloud technology, you have to
remember the basics. Learn how to learn how to these two key features of
the Rackspace Cloud can help you monitor, report, and restore your data
in the cloud.

-   Learn more about [Cloud Monitoring](/how-to/available-checks-for-rackspace-monitoring)
    and read an [Introduction to Cloud Monitoring](https://community.rackspace.com/products/f/25/t/1892.aspx).
-   Learn more about [Cloud Backup](/how-to/cloud-backup)
    and read an [Introduction to Cloud Backup](https://community.rackspace.com/products/f/25/t/1887.aspx).

In addition to the Rackspace Monitoring, it is also useful to look at
some of our partners that specialize in monitoring and reporting in the
cloud. [New Relic](https://newrelic.com/) offers a
performance management solution that enables developers to diagnose and
fix application performance problems in real time.

### RAID Configuration of Your Cloud Block Storage Volumes

Cloud Block Storage allows you a maximum of 14 volumes per Cloud Server
and a maximum of 50 volumes per region. Although these volumes already
offer a tremendous amount of stability, they can be configured in a RAID
for extra redundancy.

Learn more about Cloud Block Storage best practices from this [blog post](http://www.rackspace.com/blog/best-practices-for-cloud-block-storage/).

### Dynamic DNS and Multiple Configurations

Customers that are serious about uptime will duplicate their production
configuration in multiple locations to use in case of major failures. A
fast failover is possible when you use a Dynamic DNS (DDNS) service that
will start sending your traffic to a different IP address if it detects
a failure in your primary configuration. This second IP address can even
be to a configuration in a different region for geographic redundancy.

[Cedexis](http://www.cedexis.com/)
offers multiple solutions that can improve performance and availability
by load balancing between multiple cloud regions.

Through an application-aware global CDN platform,
[Incapsula](https://www.incapsula.com/)
provides any website and web application with best-of-breed security,
DDoS protection, and load balancing and failover solutions. Incapsula
is available as a stand-alone service or as an integrated solution.

### Load Testing

Enough cannot be said about the value of testing (and then re-testing)
your application's infrastructure before putting it into production.
Load testing reveals potential failure points in the design of your
infrastructure and opportunities to optimize your code, which can also
help overall stability.

Rackspace has several partners that can provide this service, and a
Rackspace support tech can help you analyze the results and make the
right recommendations.

-   [Soasta](https://www.soasta.com/)
-   [Apica](https://www.apicasystem.com)
-   [Load Impact](https://loadimpact.com/)
-   [LoadView](https://www.loadview-testing.com/)

### RackConnect

The Rackspace Hybrid Cloud can provide a number of benefits, among which
is solid stability under the heaviest of traffic. Learn more about how
RackConnect can help you build for and maintain the highest availability
possible.

For more information, read [How do I get started with RackConnect v2.0](/how-to/rackconnect-v20) and
[RackConnect v2.0 Best Practices](/how-to/rackconnect-v20-best-practices).
