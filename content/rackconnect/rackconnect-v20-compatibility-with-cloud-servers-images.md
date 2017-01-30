---
permalink: rackconnect-v20-compatibility-with-cloud-servers-images/
audit_date:
title: RackConnect v2.0 compatibility with Cloud Servers images
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2016-01-06'
last_modified_by: Catherine Richardson
product: RackConnect
product_url: rackconnect
---

**Applies to:** RackConnect v2.0

For the Rackspace Public Cloud offering, the image list for RackConnect
customers with the Managed Infrastructure service level has been
simplified. If your RackConnect implementation is complete, you can
select any of the base images displayed in your image list (via the API,
the [MyRackspace portal](https://my.rackspace.com/), or the [Cloud Control
Panel](https://mycloud.rackspace.com/)), and we can configure
RackConnect on your cloud servers. This is now true for Windows and
Linux images, as well as for Managed Operations service level and
Managed Infrastructure service level customers.

**Note:** Some images at the Managed Infrastructure service level are
incompatible with RackConnect. You can find a list of these images in
[Cloud Servers images for use with RackConnect v2.0](/how-to/cloud-server-images-for-use-with-rackconnect-v20).

### Server flavors and regions

In the MyRackspace portal and Cloud Control Panel, you can choose the
*flavor* of server that you want to provision. You can choose from
standard and workload-optimized flavors. When creating new cloud
servers, always be sure to select the *region* where your RackConnect
configuration is located.

### Cloud Servers API "access IP"

The *access IP* is the IP address used by RackConnect automation to
access the server. This value is accessible via the API. The access IP is
already part of the MyRackspace portal and is being added to the Cloud
Control Panel soon. At the time a server is built, it is populated with
the public IP address of the server. In the case of a cloud server
connected through RackConnect, the RackConnect automation updates the
access IP to reflect the public IP address assigned through network
address translation (NAT) through the RackConnect edge network device.

**Note:** There are accessIPv4 and accessIPv6 values in the API.
RackConnect continues to be an IPv4-only solution, so only accessIPv4
reflects a value after the RackConnect automation has performed its
post-build updates. Because these values can be updated via the public
API, it is possible (although not recommended) for you to modify the
values.

### Related article

[RackConnect v2.0 API](/how-to/rackconnect-v20-api)
