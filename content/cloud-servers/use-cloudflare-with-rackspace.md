---
permalink: use-cloudflare-with-rackspace/
audit_date: '2019-01-18'
title: Use CloudFlare with Rackspace
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-01-22'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article explains why you might want to use CloudFlare with Rackspace.

### Content delivery network

When you sign up for CloudFlare, you automatically begin to cache files on
CloudFlare's content delivery network (CDN), even on free plans. As your
website visitors request static files (such as images, cascading style sheets
(CSS), and other files) from your site, those assets are cached on
CloudFlare's CDN edge nodes in a global network of caches. Then, those
assets are served from the CloudFlare edge nodes instead of your Rackspace
servers. This approach requires less bandwidth and delivers content faster.
CloudFlare helps figure out which pieces to cache and which it should serve
fresh each time.

### Cache the right content

CloudFlare also enables you to set individual page caching rules. For example,
if your “About Us” web page rarely changes, you can configure CloudFlare to
cache it in perpetuity. That page will always be cached on and delivered by
CloudFlare’s edge nodes, rather than your servers. This approach lowers your
bandwidth and reduces the load on your servers.

If your entire site is static HTML, you can cache all of it by using
CloudFlare. When you cache a static site in its entirety, your servers are
rarely required to do any work, which greatly reduces the risk of a server
crash.

With the _Always Online_ feature, CloudFlare automatically caches a limited
copy of your site so that if your servers ever go offline, your customers see
the limited version. Controlling the experience that your customers have
during a server issue can be very important.

### Security

CloudFlare began as a security company and is still strong in this area.
CloudFlare offers free Secure Sockets Layer (SSL) connections from CloudFlare
to your users’ browsers. This  technology can help keep connections secure. If
your servers are encrypted with SSL, you can encrypt the connection completely
from end-to-end, which is a security win for your customers.

On higher-tiered plans, distributed denial-of-service (DDoS) mitigation and
web application firewalls enable you to protect your site against attacks,
keeping your customers online and secure.

### Get started with CloudFlare

You can easily set up CloudFlare by using the following steps:

1. Sign up for an account at [cloudflare.com](https://www.cloudflare.com).
2. Specify the domain or domains that you want to import.
3. CloudFlare finds all of the applicable records so that you don't lose any
   functionality when the name servers are switched.
4. Choose your service level and security configuration.
5. CloudFlare provides step-by-step instructions for making your name servers
   point to CloudFlare. When you complete this step, you can start taking
   advantage of CloudFlare's security, caching, and CDN capabilities.
