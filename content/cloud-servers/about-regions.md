---
permalink: about-regions/
audit_date:
title: About regions
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

When you create new Rackspace cloud resources, it's important to
understand what a region is and how to use regions effectively.

### What is a region?

A region is a collection of one or more data centers interconnected by a
low-latency, high-bandwidth network. A region can be viewed as a
"logical data center" and is designated by the three-letter code for a
nearby airport (like DFW for Dallas/Forth Worth and LON for London).

Following is a list of available Rackspace regions:

-   Dallas-Fort Worth (DFW)
-   Chicago (ORD)
-   Northern Virginia (IAD)
-   London (LON)
-   Sydney (SYD)
-   Hong Kong (HKG)

More information about Rackspace data centers is located on the [Global Infrastructure page](http://www.rackspace.com/about/datacenters/).

**Note:** Because Classic v1 and Cloud Servers have
different architectures, they are not considered to be in the same
region, even if they are in the same data center. For example, a Classic
v1 and Cloud server that are both located in the DFW data
center are not in the same region.

### Region availability

Not all cloud services are available in all regions.

Because of maintenance or capacity concerns, the provisioning of cloud
services might also be restricted in some regions in which they are
normally available. Contact Support to request access to a restricted
region.

**Note:** At this time, the provisioning of cloud services in the ORD
region is not available to new customers. If you are a new customer, you
can open a ticket in the Cloud Control Panel to add ORD to your account,
pending approval.

### Benefits of using regions

Whenever possible, consider locating all of your Rackspace
infrastructure in the same region to receive the following benefits:

-   **Geographic choice** - You can provision resources closer to your
    end users or other applications, data centers, clouds, and so on.
    This becomes increasingly important with hybrid on-premises to
    public cloud scenarios.

-   **Network performance** - All resources provisioned within a region
    have internal connectivity over a private, low latency, high
    bandwidth network. The physical distance between resources is small
    and improves the speed of network traffic and throughput.

-   **Free bandwidth** - All communication over the Rackspace network
    (aka ServiceNet) within the same region is free.

### About free bandwidth

The following example explains how to avoid bandwidth charges for communication
between resources in the same region.

You have two Cloud Servers currently running in the DFW region that need a load balancer. When
you create the new load balancer, choose the same region as your
servers, DFW. There will be no bandwidth charges
for the communications between the load balancer and the two servers in this
region. If you later add a Cloud Server running in the Chicago
region to the load balancer in DFW, normal bandwidth charges would be
incurred for traffic between the server in Chicago and the load balancer
in Dallas.

This concept applies to all Rackspace cloud infrastructure for which you can choose a region when you create the resource. In most cases, you should create your resources in the same region to keep the resource
close to end-users and other infrastructure, for increased network
performance, and to avoid internal bandwidth charges.
