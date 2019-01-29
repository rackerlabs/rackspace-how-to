---
permalink: design-and-build-cloud-servers-for-stability/
audit_date:
title: Design and build Cloud Servers for stability
type: article
created_date: '2013-12-17'
created_by: Joseph Palumbo
last_modified_date: '2018-01-29'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

When mission critical availability is necessary for your business, developing
a powerful application or a beautifully designed web interface is only part of
the job. Following are some best practices that the Support team at Rackspace
has developed to keep your site highly available.

### Rackspace Monitoring and Cloud Backups

Even when you're using cutting edge cloud technology, you have to
remember the basics. Learn how to learn how to use these two key features of
the Rackspace Cloud to help you monitor, report, and restore your data
in the cloud.

-   Learn more about [Rackspace Monitoring](/how-to/available-checks-for-rackspace-monitoring)
    and read the [Rackspace Monitoring FAQ](/how-to/rackspace-monitoring-faq).
-   Learn more about [Cloud Backup](/how-to/cloud-backup)
    and read the [Cloud Backup FAQ](/how-to/cloud-backup-faq).

In addition to the Rackspace Monitoring, consider exploring some of our
partners that specialize in monitoring and reporting in the cloud. For
example, [New Relic&reg;](https://newrelic.com/) offers a performance management
solution that enables developers to diagnose and fix application performance
problems in real time.

### RAID configuration of your Cloud Block Storage volumes

Cloud Block Storage allows you a maximum of 14 volumes per cloud server
and a maximum of 50 volumes per region. Although these volumes already
offer a tremendous amount of stability, you can configure them in a RAID
for extra redundancy.

Learn more about Cloud Block Storage best practices from this
[blog post](http://www.rackspace.com/blog/best-practices-for-cloud-block-storage/).

### Dynamic DNS and multiple configurations

Customers that are serious about uptime choose to duplicate their production
configuration in multiple locations for use in case of major failures. A
fast failover is possible when you use a Dynamic Domain Name Server (DDNS)
service that starts sending your traffic to a different Internet Protocol (IP)
address when it detects a failure in your primary configuration. This second IP
address can even be to a configuration in a different region for geographic
redundancy.

[Cedexis](http://www.cedexis.com/) offers multiple solutions to improve
performance and availability by load balancing between multiple cloud regions.

Through an application-aware global content delivery network (CDN) platform,
[Incapsula](https://www.incapsula.com/) provides any website and web
application with best-of-breed security, distributed denial of service (DDoS)
protection, and load balancing and failover solutions. Incapsula
is available as a stand-alone service or as an integrated solution.

### Load Testing

Enough cannot be said about the value of testing (and then retesting)
your application's infrastructure before putting it into production.
Load testing reveals potential failure points in the design of your
infrastructure and opportunities to optimize your code, which helps overall
stability.

Rackspace has several partners who provide this service, and
Rackspace Support can help you analyze the results and make the
right recommendations.

-   [Soasta](https://www.soasta.com/)
-   [Apica](https://www.apicasystem.com)
-   [Load Impact](https://loadimpact.com/)
-   [LoadView&reg;](https://www.loadview-testing.com/)

### RackConnect

The Rackspace Hybrid Cloud provides a number of benefits, including
solid stability under the heaviest of traffic. Learn more about how
RackConnect can help you build for and maintain the highest availability
possible.

For more information, read [How do I get started with RackConnect v2.0](/how-to/rackconnect-v20) and
[RackConnect v2.0 Best Practices](/how-to/rackconnect-v20-best-practices).
