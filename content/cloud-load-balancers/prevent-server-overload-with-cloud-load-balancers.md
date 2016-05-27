---
permalink: prevent-server-overload-with-cloud-load-balancers/
audit_date:
title: Prevent server overload with Cloud Load Balancers
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-04-21'
last_modified_by: Rose Contreras
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

One way that you can prevent a server from becoming overloaded is to use
the Connection Throttling feature of Cloud Load Balancers. Connection
throttling limits the number of simultaneous connections that are
allowed from each IP address. This feature helps prevent malicious or
abusive traffic to your server and its installed applications.

### Prerequisites

This procedure for configuring connection throttling assumes that you're
working with an existing load balancer. If you don't have a load
balancer yet, [create one](https://support.rackspace.com/how-to/configure-a-load-balancer/).

### Configure connection throttling

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2.  At the top of the Control Panel, click **Networking > Load Balancers**.
3.  Click on the gear icon next to your load balancer, and
    select **Edit Connection Throttling** from the menu.

    The following pop-up window appears:

    <img src="{% asset_path cloud-load-balancers/prevent-server-overload-with-cloud-load-balancers/827-1496.png %}" width="529" height="210" />

4.  Enter a value for **Max. Connections** between 1 and 100000.

6.  Click **Save Connection Throttling**.
