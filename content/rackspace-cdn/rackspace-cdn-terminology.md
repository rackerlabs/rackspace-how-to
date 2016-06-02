---
permalink: rackspace-cdn-terminology/
audit_date:
title: Rackspace CDN terminology
type: article
created_date: '2015-05-08'
created_by: Catherine Richardson
last_modified_date: '2015-06-08'
last_modified_by: David Hendler
product: Rackspace CDN
product_url: rackspace-cdn
---

**Caching rule**

A rule you create for your edge nodes that defines how long your content
remains cached at the edge. This is the time to live (TTL) for the
object.

**Content delivery network (CDN**)

A system of computers that contains multiple copies of data. A CDN is
designed to improve the performance of delivering your content to your
audience across the world. Your content can be anything--website files,
applications, audio and video files, ads, or interactive experiences.

When your audience or customers request your content, they get it from
their nearest edge nodes, instead of where you originally uploaded it.
This means that the travel time for your content to your customers is
much quicker than with other content systems.

**Edge node**

The local servers distributed around the world. They serve your content
directly to your audience, which reduces its transmission time. They can
also be called "points of presence" (or PoPs), or edge servers. The edge
nodes cache your content for a time frame that you set; see Time to live
(TTL) for more about the time frame.

**Edge rule**

Instructions that you give to the edge nodes that explain how to handle
the content. Caching rules and restrictions are two types of edge rules.
For more informaiton about how to set up edge rules, see [Rackspace CDN
edge rules](/how-to/rackspace-cdn-edge-rules).

**Edge server**

The same thing as an edge node.

**Origin**

Server that holds the content from which the edge nodes pull content.
The origin might be your cloud server, a cloud files container, or a
dedicated server. A CDN service can have multiple origins.

**Origin pull**

How the edge node gets the content from the origin(s). The content is
pulled when it is requested by the end users--for example, when they
visit your website or use an application that uses content on your CDN.
Rackspace CDN does not support the "push" method, which prepopulates the
cache with content before a request is made.

**Purge**

Removes content from the edge nodes so that it can be refreshed from
your origin(s).

**Restriction**

An edge rule that enables you to define who can or cannot access content
from the cache. An example of a restriction is allowing requests only
from certain domains, geographies, or IP addresses.

**Service**

A mapping of your CDN domain to your origin (web server) that tells the
edge nodes where to fetch content from for your domain.

**Status**

Indicates the current state of the service. The time that it takes for a
service configuration to be distributed among a CDN provider cache can
vary.

**Time to live (TTL)**

The period of time that an asset is cached on the edge node before a new
origin pull is made.

### Additional resources

- [Limits for Rackspace CDN](/how-to/limits-for-rackspace-cdn)
- [Differences between Rackspace CDN and Rackspace Cloud Files](/how-to/differences-between-rackspace-cdn-and-rackspace-cloud-files)
