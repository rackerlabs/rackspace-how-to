---
permalink: using-cloudflare-with-Rackspace
audit_date:
title: Using CloudFlare with Rackspace
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

At Rackspace we frequently recommend CloudFlare to our customers.  They are also a member of our partner program.
Content Delivery Network

At the heart of CloudFlare is their Content Delivery Network - their CDN. By signing up for CloudFlare, you’ll automatically start to cache files on their CDN, even on their free plans. So what’s that mean? It means that as your website visitors request static files (images, css, etc.) from your site, those assets are cached on their CDN edge nodes - a global network of caches - and then those assets are served from the CloudFlare edge nodes instead of your Rackspace servers. That means less bandwidth and faster content delivery. And CloudFlare helps to figure out which pieces to cache, and which are dynamic, and should be served fresh each time.
Caching the Right Content

CloudFlare also allows you to set individual page caching rules. Does your “About Us” page rarely change? Then configure it to be cached in perpetuity - that page will always be cached on and delivered by CloudFlare’s edge nodes, not your servers, again lowering your bandwidth, and placing less load on your servers. If your entire site is static HTML, you can cache the entire thing with CloudFlare. Last year I helped a Veterans Day telethon raise hundreds of thousands of dollars through their static HTML website, hosted at Rackspace and cached on CloudFlare. Since the entire site was static, the servers were rarely required to do any work - that meant a site that never crashed, and more donations were able to be collected.
With their “Always Online” feature, CloudFlare automatically caches a limited copy of your site, so that if your servers ever go offline, the limited version will be seen by your customers. Controlling the experience that your customers have during a server issue can be very important.
Security

CloudFlare started as a security company, and they still carry that DNA with them. They recently implmented free SSL connections from CloudFlare to your users’ browsers. This can help keep connections secure. If your servers are encrypted with SSL, you’ll be able to encrypt the connection completely from end to end - a huge security win for your customers.
For their higher tiered plans, DDoS mitigation and web application firewalls allow you to protect your site against attacks, keeping your customers online and secure.
Getting Started with CloudFlare

Setting up CloudFlare for your site is almost ridiculously easy. Their website purports 5 minute setup, and that seems to be about right in my case.

1. Sign up for an account at cloudflare.com. 
2. Specify the domain(s) you want to import.
3. CloudFlare finds all of the applicable records, so that you won't lose any functionality when the name servers are switched.
4. Choose your service level and security configuration.
5. CloudFlare provides step-by-step instructions for moving your name servers to point to CloudFlare. As soon as the name servers reflect CloudFlare, you’ll start taking advantage of the security, caching, and CDN capabilities of CloudFlare. 
