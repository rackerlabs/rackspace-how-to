---
permalink: use-rackspace-cdn-with-a-wordpress-site/
audit_date: '2019-02-12'
title: Use Rackspace CDN with a WordPress site
type: article
created_date: '2019-02-13'
created_by: Rackspace Community
last_modified_date: '2019-02-13'
last_modified_by: Kate Dougherty
product: Rackspace CDN
product_url: rackspace-cdn
---

This article shows you how to use Rackspace CDN with a WordPress&reg; 
website.

This setup involves the following services:

1. WordPress
2. Rackspace Cloud Files
3. Akamai&reg; Content Delivery Network (CDN)

### About WordPress

WordPress is a PHP&reg;-based, blog-centric application that runs on a variety
of web servers. WordPress usually runs on either an Apache&reg; or NGINX&reg;
web server. WordPress uses a significant amount of memory on servers that have
certain configurations.

### About Cloud Files

Rackspace Cloud Files is an independent, redundant, cloud-based solution for
file storage. Cloud Files uses containers that are limited to 5 GB of storage, but you
have an unlimited number of containers available to you.

These files are not directly accessible from any server by default. However,
you can use Cloudfuse to _mount_ the files to a server. You can access and
manage your Cloud Files by using our [Cloud Files application programming
interface (API)](https://developer.rackspace.com/docs/cloud-files/v1/).
Utilities like Cloudfuse, Cyberduck&reg;, and FireUploader can all use our API
to access the files. You can publish each container to Akamai's CDN on a
per-container basis.

### About Akamai CDN

Rackspace uses Akamai CDN, which caches content from your servers on a network
of Akamai servers (_edge nodes_) that are distributed across the globe. When a
user requests your content, Akamai delivers the cached version from the edge
node that is geographically closest to the user, increasing speed and
performance. Akamai automatically retrieves new content from your servers and
refreshes the cache when the time to live (TTL) expires. Delivering cached
versions of your content from Akamai's servers also reduces the load on your
own servers.

If you update content on your servers and want Akamai's servers to reflect the
change immediately (rather than waiting until the TTL expires), you can use
Akamai's _purge_ operation to remove up to 25 objects per day from Akamai's
cache. This operation wipes the outdated content from all of the edge nodes
that cached it. Because Akamai deploys content globally, purging operations
might take some time to propagate.

### Use Rackspace CDN with a WordPress website

To use Rackspace CDN with a WordPress website, you need to take the following
steps:

1. Connect your WordPress website to Cloud Files by using the W3 Total Cache
   plug-in for WordPress. For detailed instructions, see [Quick Tip: How to
   Utilize Akamai CDN with Your WordPress Site](https://code.tutsplus.com/articles/quick-tip-how-to-utilize-akamai-cdn-with-your-wordpress-site--wp-23403).
2. [Upload the content to the Cloud Files
   container](/how-to/getting-started-with-cloud-files-and-cdn/) that is
   published to the CDN by using the [Cloud Control
   Panel](https://login.rackspace.com).
3. Ensure that you have marked your Cloud Files container for publishing to
   the CDN.

Your WordPress deployment loads the new content.
