---
permalink: high-traffic-event
audit_date:
title: High Traffic Event
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
For some customers, launching a site is only the first leg of the race, not the finish line.For some customers, the goal is a major event with publicity of some sort driving traffic. This might be their launch date as it occurs when they point their DNS; For others it might occur days or weeks later, corresponding with an episode of Shark Tank, a press release or some other kind of announcement. Whenever your event happens, we want you to succeed. Here are a few tips and tricks we’ve collected.
Added guarantees for high traffic events

We offer an additional service level guarantee for our Managed Operations service level customers that notify us in advance of their high traffic event. This is only available for our Managed Operations service level customers, and does have a few restrictions, including advanced notice and code freezes. Contact your account team if you’re interested in this advanced SLA.
Be aware of possible issues that can occur during high traffic events & solutions to remedy

* Over-saturation of traffic to Web01 from other web servers
* Resource exhaustion & contention
* Reboot check

### Create awareness of event in advance

* Document time, POCs, config summary, tactical plans, proactive configuration of backups & domain monitoring, and pre-work by adding cloud load balancers & databases.
Scaling from 1 server to multiple servers

Our most successful high traffic event customers will scale their application from a single server to multiple servers. Here are some additional tips on how to achieve the scale.

### Web and app tier

* Learn about the “Seed Config” - our architecture recommendation for a scale-ready cloud application.
* Once you have the Seed Config in place, start scaling horizontally with additional app and web servers.

### Data tier

* Scale your databases and add replication - your database can be a significant bottleneck for your application. Since most transactions must pass through the database, consider scaling this tier both vertically and horizontally.
* Adding additional compute resources to the primary server will allow you to process more data, faster. Adding replication provides your application with redundancy, and replicants can be used as a read-only version for faster data access.
* Rackspace Cloud Databases can help with both the scaling and the replication.
* Consider using a query caching layer to speed up the site and improve scalability.
Test, test, and test some more

We always recommend testing, but testing becomes more important as you scale up for a high traffic event. Below are our recommendations on load testing and optimizing before an event. Don’t hesitate to reach out to Rackspace for additional recommendations while preparing for a high traffic event.

### Application testing

Test your application’s functionality at scale.
* Does everything work? Seems simple, but a web node left out of the load balancer, or a misconfigured SSL certificate can throw off the whole application.
* Make sure that transactional email has been configured to send through Mailgun, to remove that process from your application servers.
* Fix everything at the application level first, then test the performance.

### Load testing

Test your application’s performance at scale.
* Run a baseline test load test using Load Impact, Loader.io, Apica LoadTest, or another load testing service - you should know how your application works under normal conditions so you can better estimate how additional traffic will impact the app.
* Examine your test results and make appropriate changes to your configuration (adjust Apache MaxClients etc).
* Run an additional load test after tuning your configuration to get an idea of how much traffic your site/app can handle.
* GET vs POST testing - if your application is at all transactional, be sure that you load test the transactions, not just page loads.

### Optimizing

* Serve static files from the Rackspace CDN to improve performance and load speeds
* Introduce one or more caching layers within your configuration
* Use a third party tool such as CloudFlare or Incapsula to cache and optimize your web content at the DNS level

If anything goes wrong

The old saying is that the best offense is a good defense, so we highly recommend that you contact Rackspace early, as soon as you know about an upcoming event. This will allow us to work with you to develop a plan for addressing any issues that might come up. Let us know when the event is scheduled, who will be your primary point of contact, how to get in touch with that person, etc. The more we know ahead of time, the better. If anything does go wrong, call support immediately.
After the event

If you’ve just completed a high traffic event - congratulations! Hopefully everything went well. Likely you’ll not need to continue on with the expanded infrastructure you’ve built for to accommodate the enhanced traffic; if you do, then you’ve just had a very successful event.
Scaling back after a high traffic event

If you’ve followed our guides for scaling up, you can follow them in reverse to scale back down. We recommend staggering the scale down, so that you don’t scale your app too low to handle your traffic. Begin by draining connections from one of the servers behind your load balancer at a time. When all connections are gone, you can remove that node, and delete the server. Test to see that your traffic is keeping up, and repeat until your architecture meets traffic demand.
If you run into any issues, don’t hesitate to contact support.
Lessons learned from the high traffic event

We also recommend that you take the time to review the event, how your applications performed, and make any changes that might be necessary. If you found any unexpected bottlenecks or limitations, document and fix them. This might be an issue with the application itself, or it might be a problem escalating a support need to the correct stakeholders in time. Whatever the issue, identifying it, documenting it, and fixing it now will help you the next time out.
