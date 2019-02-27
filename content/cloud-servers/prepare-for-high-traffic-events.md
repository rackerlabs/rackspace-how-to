---
permalink: prepare-for-high-traffic-events/
audit_date: '2019-01-22'
title: Prepare for high-traffic events
type: article
created_date: '2019-01-25'
created_by: Rackspace Community
last_modified_date: '2019-01-25'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If you are planning a major event or publicity campaign, you can use the
information in this article to help your website successfully handle unusually
high traffic.

### Additional guarantees for high-traffic events

Rackspace offers an [additional service-level
guarantee](/how-to/managed-cloud-service-levels-faq/#guarantees) for Managed
Operations service level customers who notify us in advance of their 
high-traffic event. This guarantee is only available for our Managed Operations
service level customers and does have a few restrictions, including advanced
notice and code freezes. If you are interested in this advanced service level
agreement (SLA), contact your Account Manager.

### Be aware of issues that might occur during high-traffic periods and potential solutions

The following issues might occur during high-traffic periods:

- Over-saturation of traffic to **Web01** from other web servers
- Resource exhaustion and contention
- [Forced reboot checks that cause longer
  downtimes](/how-to/ensure-servers-reboot-successfully/)

### Create awareness of the event and document important facts in advance

Document the following information:

- Date and time of the event
- Points of contact
- A configuration summary
- Tactical plans
- Proactive configuration of backups and domain monitoring
- Preparations such as adding cloud load balancers and databases

### Scale from one server to multiple servers

Our most successful high-traffic event customers scale their application from
a single server to multiple servers. This section shares tips for scaling up.

#### Scale at the web and app tier

Use the following steps to scale at the web and app tier:

- Learn about the _[seed configuration](https://blog.rackspace.com/fundamentals-of-cloud-architecture-the-seed-config-video?cm_mmc=community-_-activation-_-gsg-_-links)_, our architecture recommendation for a scale-ready cloud application.
- After you have the seed configuration in place, start scaling horizontally by using
  additional app and web servers.

#### Scale at the data tier

Use the following steps to scale at the data tier:

- Scale your databases and add
  [replication](/how-to/database-replication-with-cloud-databases/). Your
  database can be a significant bottleneck for your application. Because most
  transactions must pass through the database, consider scaling this tier both
  vertically and horizontally.
- Adding more compute resources to the primary server enables you to process
  more data faster. Adding replication gives your application redundancy, and
  you can use replicants as read-only versions for faster data access.
- Rackspace Cloud Databases can help you with both scaling and
  [replication](/how-to/database-replication-with-cloud-databases/).
- Consider using a query caching layer to [speed up the site and improve
  scalability](https://blog.rackspace.com/preparing-ddpyoga-com-for-the-shark-tank-effect?cm_mmc=community-_-activation-_-gsg-_-links).
- Test thoroughly.

### Testing

We always recommend testing, but testing becomes more important as you scale
up for a high-traffic event. This section explains our recommendations for
load testing and optimizing before an event. For additional recommendations
for preparing for a high-traffic event, contact your Account Manager or
Rackspace Support.

#### Application testing

Test your application’s functionality at scale by performing the following
tasks:

- Verify that everything works. A web node that is left out of the load
  balancer or a misconfigured Secure Sockets Layer (SSL) certificate can throw
  off the entire application.
- Ensure that you have configured Mailgun&reg; to send transactional email to
  remove that process from your application servers.
- Fix everything at the application level first, then test the performance.

#### Load testing

Test your application’s performance at scale by performing the following
tasks:

- Run a baseline load test by using Load Impact, Loader.io, Apica&reg;
  LoadTest&reg;, or another load testing service. This step helps you estimate
  how additional traffic might impact the application.
- Examine the test results and make appropriate changes to your configuration
  (such as adjusting Apache&reg; MaxClients).
- Run an additional load test after you tune your configuration to
  estimate how much traffic your site or application can handle.
- Conduct GET versus POST testing. If your application is transactional,
  ensure that you load test the transactions in addition to page loads.

### Optimization

Use the following steps to optimize your website or application:

- Serve static files from the [Rackspace Content Delivery Network
  (CDN)](https://www.rackspace.com/en-us/cloud/cdn-content-delivery-network)
  to improve performance and load speeds.
- Introduce one or more caching layers in your configuration.
- Use a third-party tool such as Cloudflare&reg; or Incapsula&reg; to cache
  and optimize your web content at the Domain Name System (DNS) level.

### Contact Rackspace

We recommend that you contact Rackspace as soon as you know about an upcoming
event. This notice enables us to work with you to develop a plan to address
any issues that might arise.

Include the following information:

- When the event is scheduled
- The primary point of contact
- How to get in touch with that person

If you experience any issues, call Rackspace Support at 1 800 961 4454
immediately.

### After the event

This section describes steps that you should take after a high-traffic event.

### Scale back your architecture

If you followed our preceding guides for scaling up, you can follow them in reverse to
scale back down. We recommend staggering the scale-down so that you don’t
scale your app too low to handle your traffic.

Begin by draining connections from the servers behind your load balancer, one
server at a time. When there are no more connections, you can remove that node
and delete the server. Verify that your traffic is keeping up, and repeat
these steps until your architecture meets current traffic demand.

If you run into any issues, contact Rackspace Support.

### Analyze performance during the event

We also recommend that you take the time to review how your applications
performed during the event and make any changes that might be necessary. If
you find unexpected bottlenecks or limitations, document and fix them. These
issues might be related to the application itself, or they might indicate a
problem escalating a support need to the correct stakeholders in time.
Identifying, documenting, and correcting issues now helps you the next time
you experience a high-traffic event.
