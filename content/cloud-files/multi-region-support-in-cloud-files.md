---
permalink: multi-region-support-in-cloud-files/
audit_date:
title: Multi-region support in Cloud Files
type: article
created_date: '2012-09-12'
created_by: David Hendler
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

Rackspace allows you to choose the data center where you would like to
store your content. You may select our Dallas (DFW), Chicago (ORD),
North Virginia (IAD), Hong Kong (HKG), or Sydney, Australia (SYD)
locations through our multi region support. This means you can have your
Cloud Servers or Dedicated Servers in one location and your data in
another. Or, you can keep them in the same data center to reduce latency
and take advantage of free bandwidth using our internal data center
network, ServiceNet.

Customers who only serve certain geographic regions may also find it
helpful to locate the Cloud Files objects as close to that region as
possible.

**Note:** Not all third-party libraries that communicate with
Cloud Files have been updated to support multiple regions. In some
cases if the tool you use isn't uploading to the region you expect, you
can contact Support and ask them to change your account's default
region. That may get the tool to use your preferred region for file
transfers.

You don't need to do anything to set up multi region capabilities for
your account. All U.S. accounts have access to multiple regions. If you
use the Auth 1.1 or 2.0 API, you may choose which endpoint to interact
with; once you've authenticated against the regional endpoint, your
Cloud Files operations will only affect that region's content. So, if
you have content in two locations and you want to make edits, you will
have to make those edits in both locations.

MyRackspace and [Cloud Control Panel](http://mycloud.rackspace.com)
users can also take advantage of the multi region feature. When you
create a container, choose the data center where you would like it. Your
control panel will reflect the location of your container.

The following screenshots illustrate this new capability:

MyRackspace Portal - Create New Container:

<img src="{% asset_path cloud-files/multi-region-support-in-cloud-files/CreateContainer.png %}" width="745" height="401" />

Cloud Control Panel - Create New Container:

<img src="{% asset_path cloud-files/multi-region-support-in-cloud-files/TestContainerVirginia_0.png %}" width="448" height="346" />

Cloud Control Panel - Upload Files or click the Containers link in the
breadcrumb trail to see your container list.

<img src="{% asset_path cloud-files/multi-region-support-in-cloud-files/ContainerContent_0.png %}" width="727" height="361" />

Cloud Control Panel - List Containers

<img src="{% asset_path cloud-files/multi-region-support-in-cloud-files/ContainerList_0.png %}" width="1003" height="368" />

Our API users will also see changes in their Service Catalog, which now
shows multiple endpoints for "object store":

<img src="{% asset_path cloud-files/multi-region-support-in-cloud-files/cf%20-%20api%20access%20points.png %}" width="599" height="406" />

Cloud Files does NOT automatically replicate data across regions.
Customers who would like to have their data in both places should ensure
PUTs are done to both endpoints and they will be charged for data stored
in both locations along with related bandwidth charges.

All customers existing previous to September 1, 2012 had their current
region set as their "default", which orders it first in the list of
endpoints when authenticating against Cloud Files using our Auth 1.1 or
2.0 APIs. Customers using Auth 1.0 will still only have a single
endpoint returned.

If you have customers around the world, don't forget that you can
deliver your content rapidly with Akamai's Content Delivery Network
(CDN), which caches content at global edge locations and saves users
time because the requested content is received from within the region
instead of coming from the origin data center.
