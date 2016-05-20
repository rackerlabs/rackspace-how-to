---
permalink: cloud-bursting-using-auto-scale-rackconnect-and-f5-load-balancers/
audit_date:
title: 'Cloud Bursting using Auto Scale, RackConnect, and F5 Load Balancers'
type: article
created_date: '2014-04-30'
created_by: Maria Abrahms
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

You can use Auto Scale and RackConnect for "cloud bursting" by adding
cloud servers dynamically in response to demand, and removing them after
they are no longer needed. This article provides information about
configuring Auto Scale to use RackConnect to perform cloud bursting with
an F5&reg; BIG-IP&reg; Local Traffic Manager (LTM) load balancer. Using these
technologies together, you can automatically scale your dedicated
infrastructure to the Rackspace cloud by using scaling policies. In this
way, RackConnect and Auto Scale enable you to realize the power of
the [Hybrid Cloud](http://www.rackspace.com/cloud/hybrid/).

The following diagram shows the path that inbound (and return) load
balancer pool traffic follows to your cloud servers when you use Auto
Scale with a F5 BIG-IP load balancer and RackConnect.

<img src="{% asset_path rackspace-auto-scale/cloud-bursting-using-auto-scale-rackconnect-and-f5-load-balancers/F5_AS-5-13-14%5B1%5D.jpg %}" width="700" />
[View image at full
resolution](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/F5_AS-5-13-14%5B1%5D.jpg)


### Configure Auto Scale to use RackConnect to perform cloud bursting

You provision RackConnect for auto scaling by setting a metadata key for
a RackConnect load balancer pool in Auto Scale. You set this key in the
**metadata** option of the **server** argument in
the **launchConfiguration** parameter for scaling groups. When that
metadata is set properly and Auto Scale scales up a scaling group,
RackConnect modifies new servers to disable their public interface and
to enable them to begin receiving your private cloud traffic from the
RackConnect load balancer pool. When you delete the cloud servers, they
are automatically removed from the load balancer pool.

The metadata key must be **RackConnectLBPool**. The value for the
**RackConnectLBPool** key must be the exact name of the pool as defined
on the load balancer. Use a semicolon-separated list for more than one
pool.  Following is an example RackConnect metadata key/value pair for
Auto Scale:

    "metadata": {
    "RackConnectLBPool": "MyRCPoolName"
     }

For more information see the [Auto Scale API Developer Guide: Set Launch
Configuration.](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#document-api-operations/configurations)

### Important notes

When setting metadata for Auto Scale created servers, consider the
following requirements:

-   Verify that an appropriate health check has been configured for
    members of the load balancer pool or pools being used. The health
    check should confirm that the website or application is fully ready
    to accept end-user traffic, because the cloud server might be added
    almost immediately after creation but before your application is
    ready to accept traffic, depending on the timing of the automation.
    For example, it would be advisable to use a URL content check
    instead of a TCP port check to confirm that a web application is
    ready to accept end-user requests.
-   The service port for each member of the load balancer pool must
    match or the automation will not be able to determine which service
    port to use. For this same reason, there should always be at least
    one member in the pool. If a common service port cannot be
    determined, a notification will be routed to your Support team for
    manual intervention.
-   To learn more about cloud bursting see [Using Dedicated Load
    Balancers with
    RackConnect](/how-to/using-dedicated-load-balancers-with-rackconnect-v20).

To get the name of one or more load balancer pools, contact your Support
team.
