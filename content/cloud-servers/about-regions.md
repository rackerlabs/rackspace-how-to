---
permalink: about-regions/
audit_date: '2017-03-22'
title: About regions
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2017-03-22'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

When you create new Rackspace cloud resources, it's important to understand what
a region is and how to use regions effectively.

### What is a region?

A region is a collection of one or more data centers interconnected by a low-latency,
high-bandwidth network. A region can be considered a "logical data center" and is
designated by the three-letter code for a nearby airport (such as DFW for Dallas/Fort
Worth).

Following is a list of available Rackspace regions:

-   Dallas-Fort Worth (DFW)
-   Chicago (ORD)
-   Northern Virginia (IAD)
-   London (LON)
-   Sydney (SYD)
-   Hong Kong (HKG)

For more information about Rackspace data centers, see the
[Global Infrastructure page](http://www.rackspace.com/about/datacenters/).

### Region availability

Not all cloud services are available in all regions.

Because of maintenance or capacity concerns, the provisioning of cloud services
might also be restricted in some regions in which they are normally available.
Contact Support to request access to a restricted region.

**Note:** At this time, the provisioning of cloud services in the DFW and IAD
regions is not available to new customers.

### Benefits of using the same region

Locating all of your Rackspace infrastructure in the same region provides the following benefits:

-   **Geographic choice** - You can provision resources closer to your end users
    or other applications, data centers, clouds, and so on. This choice becomes
    increasingly important with hybrid on-premises cloud scenarios.

-   **Network performance** - All resources provisioned within a region have
    internal connectivity over a private, low latency, high bandwidth network.
    The physical distance between resources is small and improves the speed of
    network traffic and throughput.

-   **Free bandwidth** - - All communication between resources in the same region is free. For example, if you need to add a load balancer for two servers that are in the same region (for example, DFW), create the load balancer in the same region (DFW) to avoid bandwidth charges for traffic between the load balancer and the servers. If you later add a server running in a different region (for example, ORD) to the load balancer, normal bandwidth charges would be incurred for traffic between the new server in ORD and the load balancer in DWF.


