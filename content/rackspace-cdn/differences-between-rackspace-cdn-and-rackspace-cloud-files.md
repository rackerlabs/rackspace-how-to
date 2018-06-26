---
permalink: differences-between-rackspace-cdn-and-rackspace-cloud-files/
audit_date:
title: Differences between Rackspace CDN and Rackspace Cloud Files
type: article
created_date: '2015-05-08'
created_by: Rackspace Support
last_modified_date: '2015-10-05'
last_modified_by: Catherine Richardson
product: Rackspace CDN
product_url: rackspace-cdn
---

Rackspace Cloud Files is storage service that enables users to store an
unlimited number of files and to publish and distribute content behind a
content delivery network (CDN). Following are some differences between
Rackspace CDN and Cloud Files:

-   Users of Rackspace CDN specify the origins that host the content,
    and the CDN pulls the content from these origins. Origins can be
    dedicated servers, cloud servers, cloud load balancers, or even
    servers hosted outside of Rackspace. Users of Cloud Files can
    CDN-enable a container, thereby distributing the contents of that
    container to the CDN's edge nodes. In Rackspace CDN, it is not yet
    possible to specify a Cloud Files container as an origin.
-   Rackspace CDN has no limit on purges. Cloud Files limits the number
    of purges per account, per day to 25.
-   Rackspace CDN does not yet support streaming video from Cloud Files
    CDN-enabled containers however serving CDN-enabled content over 
    SSL/TLS is possible.  Cloud Files supports streaming video from 
    CDN-enabled containers as well as serving CDN-enabled content 
    over SSL/TLS.

These, and other differences, are summarized in the following table:

| | Rackspace CDN | Cloud Files CDN |
| --- | --- | --- |
| Origin | Any public web server | Cloud Files CDN-enabled Container |
| Custom domains | Customizable for HTTP and HTTPS (HTTPS via SAN or Custom SSL) | CNAME for HTTP only |
| Caching rules (TTL) | Customizable | Flat per Container |
| Force Refresh Content | Purge (per file)<br />Invalidate (Simple RegEX) | Purge (per file)<br />Limit 25 per day |
| Restrictions | HTTP Referrer, GeoLocation, IP Address | N/A |
| Streaming | No Support Provided (HTML5 compatible) | Chunked encoded streaming and iOS streaming available |

### Additional resources

- [Rackspace CDN terminology](/how-to/rackspace-cdn-terminology)
- [Access Rackspace CDN](/how-to/access-rackspace-cdn)
