---
permalink: differences-between-rackspace-cdn-and-rackspace-cloud-files/
audit_date: '2018-06-26
title: Differences between Rackspace CDN and Rackspace Cloud Files
type: article
created_date: '2015-05-08'
created_by: Rackspace Support
last_modified_date: '2018-06-26'
last_modified_by: Becky Geizner
product: Rackspace CDN
product_url: rackspace-cdn
---

Rackspace Cloud Files is storage service that enables users to store an
unlimited number of files and to publish and distribute content behind a
content delivery network (CDN). Rackspace CDN is a service to manage your 
CDN-enabled domains and the origins and assets associated with those domains. 

Following are some differences between Rackspace CDN and Cloud Files:

-   Users of Rackspace CDN specify the origins that host the content,
    and the CDN pulls the content from these origins. Origins can be
    dedicated servers, cloud servers, cloud load balancers, 
    a Cloud Files container, or servers hosted outside of Rackspace. 
    Users of Cloud Files can enable a CDN on a container, 
    distributing the contents of that container to the CDN's edge nodes. 
-   Rackspace CDN has no limit on purges. Cloud Files limits the number
    of purges per account, per day to 25.
-   Rackspace CDN does not yet support streaming video from Cloud Files
    However, serving other CDN-enabled containers or serving CDN-enabled content over SSL/TLS is possible.
    Cloud Files supports streaming video from CDN-enabled containers as
    well as serving CDN-enabled content over SSL/TLS.

These, and other differences, are summarized in the following table:

| | Rackspace CDN | Cloud Files CDN |
| --- | --- | --- |
| Origin | Any public web server | Cloud Files CDN-enabled Container |
| Custom domains | Customizable for HTTP and HTTPS (HTTPS via SAN or Custom SSL) | CNAME for HTTP only |
| Caching rules (TTL) | Customizable | Flat per Container |
| Force Refresh Content | Purge (per file)<br />Invalidate (Simple RegEX) | Purge (per file)<br />Limit 25 per day |
| Restrictions | HTTP Referrer, GeoLocation, IP Address | N/A |
| Streaming | No support is provided, with exception to CDN-enabled content over SSL/TSL | Chunked encoded streaming and iOS streaming available |

### Additional resources

- [Rackspace CDN terminology](/how-to/rackspace-cdn-terminology)
- [Access Rackspace CDN](/how-to/access-rackspace-cdn)
