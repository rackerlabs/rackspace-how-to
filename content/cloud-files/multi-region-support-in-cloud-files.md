---
permalink: multi-region-support-in-cloud-files/
audit_date: '2018-10-22'
title: Multi-region support in Cloud Files
type: article
created_date: '2012-09-12'
created_by: David Hendler
last_modified_date: '2018-10-24'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

Rackspace enables you to choose the data center where you want to
store your content. You can select the Dallas (DFW), Chicago (ORD),
North Virginia (IAD), Hong Kong (HKG), or Sydney, Australia (SYD)
location through Rackspace multi-region support. This means that you can have
your Cloud Servers or Dedicated Servers in one location and your data in
another. Alternatively, you can keep them in the same data center to reduce
latency and take advantage of free bandwidth by using our internal data center
network, ServiceNet.

If you only serve certain geographic regions, you might also find it
helpful to locate the Cloud Files objects as close to those regions as
possible.

**Note**: Not all third-party libraries that communicate with
Cloud Files support multiple regions. In some cases, if the tool that you use
isn't uploading to the region that you expect, you can ask Rackspace Support
to change your account's default region. Taking this step might get the tool
to use your preferred region for file transfers.

You don't need to do anything to set up multi-region capabilities for
your account. All US accounts have access to multiple regions. If you
use the Rackspace Identity API, you may choose the endpoint with which you want
to interact. After you authenticate against the regional endpoint, your
Cloud Files operations only affect that region's content.

**Note**: Cloud Files does not automatically replicate data across regions.
If you want your data to reside in multiple places, you must make requests to
the appropriate multiple endpoints. You are charged for data stored in all
locations, as well as related bandwidth charges.

### Changes to the API Service Catalog

The Service Catalog that the API returns now shows multiple endpoints
under `object-store`, as shown in the following image:

<img src="{% asset_path cloud-files/multi-region-support-in-cloud-files/cf%20-%20api%20access%20points.png %}" width="599" height="406" />

### Changes to Rackspace web interfaces

You can also use the multi-region feature through the [Cloud Control
Panel](https://login.rackspace.com/). When you create a container, choose the
data center in which you want it to be located. The Cloud Control Panel
reflects the location of your container.

### Default region

As part of this change, if you were an existing customer as of September 1,
2012, Rackspace set your current region as your default region.

Your default region appears first in the list of endpoints that's returned
when you authenticate against Cloud Files by using our Identity API.

### Akamai CDN

If you have customers around the world, you can deliver your content rapidly
with [Akamai's Content Delivery Network
(CDN)](https://www.rackspace.com/cloud/cdn-content-delivery-network), which
caches content at global edge locations and saves time because the requested
content is received from within the region instead of coming from the origin
data center.
