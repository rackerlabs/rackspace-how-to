---
permalink: prevent-server-overload-with-cloud-load-balancers/
audit_date:
title: Prevent server overload with Cloud Load Balancers
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2018-10-24'
last_modified_by: Kate Dougherty
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

One way that you can prevent a server from becoming overloaded is to use
the Connection Throttling feature of Cloud Load Balancers. Connection
throttling limits the number of simultaneous connections that are
allowed from each IP address. This feature helps prevent malicious or
abusive traffic from reaching your server and its installed applications.

### Prerequisites

This procedure assumes that you're working with an existing load balancer. If
you don't have a load balancer yet, follow the instructions in the article
[Configure a load
balancer](https://support.rackspace.com/how-to/configure-a-load-balancer/) to
create one.

### Configure connection throttling

Use the following steps to configure connection throttling for your load
balancer:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).
2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3.  Select **Networking > Load Balancers**.
4.  Click on the gear icon next to the load balancer that you want to
    configure, then select **Edit Connection Throttling** from the menu.

     The following pop-up window appears:

     <img src="{% asset_path cloud-load-balancers/prevent-server-overload-with-cloud-load-balancers/827-1496.png %}" width="529" height="210" />

5.  Enter a value between 1 and 100000 for **Max. Connections**.

6.  Click **Save Connection Throttling**.
