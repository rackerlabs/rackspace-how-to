---
permalink: rackconnect-v30-cloud-server-image-compatibility/
audit_date:
title: RackConnect v3.0 Cloud Servers image compatibility
type: article
created_date: '2014-09-19'
created_by: Juan Perez
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0

RackConnect v3.0 has no restrictions on Cloud Servers images. All of the
Cloud Servers images listed as available in your RackConnect v3.0-enabled
cloud account are compatible with RackConnect v3.0. You can see the list
of images available for your cloud account by using the
[Cloud Servers
API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#document-getting-started/create-server/list-images),
or when you build a new cloud server in the [Cloud Control
Panel](https://mycloud.rackspace.com/). RackConnect v3.0 is also
compatible with the following Cloud Servers flavor types: Standard, General Purpose, and I/O, Compute, and Memory optimized.

This enhanced image compatibility is possible because
RackConnect v3.0 leverages the same underlying technology as Cloud
Networks. As a result, RackConnect v3.0 can support all cloud servers
that Cloud Networks supports. This also means that RackConnect v3.0 does
not currently support OnMetal servers. You can view the [RackConnect
v3.0 compatibility matrix](/how-to/rackconnect-v30-compatibility)
for a list of all products with which RackConnect v3.0 is compatible.

To provide you with the best experience possible, we recommend that you
use the Cloud Control Panel, rather than the MyRackspace portal, when
building new RackConnect v3.0 cloud servers or when working and
performing any tasks with your RackConnect v3.0 associated cloud
account.

**Important**: When you build RackConnect v3.0 cloud servers, be sure to
select the region where your RackConnect v3.0 environment is located.
Cloud servers created in a different region are not usable with your
RackConnect v3.0 configuration.

### "Access IP" address

Each cloud server instance has an entry associated with it called an
*access IP* that RackConnect v3.0 uses to store the dedicated public IP
address of your cloud servers. You can see this value by accessing a
cloud server's details via the Cloud Servers API or by viewing the
**RackConnect IP** field of your cloud servers in the Cloud Control
Panel. By default, with RackConnect v3.0, an access IP is not set when
you build a cloud server via the Cloud Control Panel, unless you select
the **RackConnect IP** option to provision a public IP address. The
access IP is also updated when you add and remove a public IP address
from your cloud servers with the [RackConnect v3.0
API](/how-to/getting-started-with-the-rackconnect-v30-api).

**Note:** Both `access_ip_v4` and `access_ip_v6` values are listed via
the Cloud Servers API, but because RackConnect v3.0 is currently an
IPv4-only solution, only the `access_ip_v4` value is modified when you
add and remove dedicated public IP addresses from your RackConnect v3.0
cloud servers.
