---
permalink: rackspace-cloud-essentials-choosing-the-right-size-cloud-server/
audit_date: '2018-10-24'
title: Rackspace Cloud Essentials - Choose the right-size cloud server
type: article
created_date: '2012-05-02'
created_by: Rackspace Support
last_modified_date: '2018-10-31'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

One of the great advantages of using [Rackspace Cloud
Servers](http://www.rackspace.com/cloud/servers/) is the flexibility that you
have to purchase only the amount of computing power that you need. When
business is good and you need to increase your server capacity, you can scale
your implementation horizontally by distributing your traffic over multiple
servers by using [Cloud Load
Balancers](http://www.rackspace.com/cloud/load-balancing).

One way to find out how much computing power you need is to install and test
your application on a few implementations of different sizes. Then, load test
your application while simulating traffic to your site.

We recommend that you test your site from a URL that does more than just
retrieve a static web page. For example, access a page that uses PHP and makes
a database query to make the test more representative of normal traffic.

This article shows you some of the standard tools that you can use to view
your server's performance, and helps you determine whether the server size
that you chose is up to the task.

### Considerations

Rackspace Cloud Servers are virtual partitions of larger physical machines
that allocate resources based on a process called central processing unit
(CPU) scheduling. As a result, they don't perform exactly like a dedicated
machine with similar resources. You can learn more about CPU scheduling by
reading the "Performance" section of the [Cloud Servers
FAQ](/how-to/cloud-servers-faq).

[OnMetal Cloud Servers](http://www.rackspace.com/cloud/servers/onmetal) are
also available. OnMetal servers are single-tenant, bare metal servers that you
provision through the same OpenStack&reg; API as a Rackspace cloud server.
Because you can create or delete them as quickly as virtual machines (VMs),
they offer the agility of multi-tenant environments with the performance of
single-tenant hardware.

Also consider that cloud servers come in the following flavors or server
types:

- General Purpose Compute optimized
- Memory optimized
- I/O optimized servers

The Memory, Compute, and I/O flavors offer faster disk access and network
speed than General Purpose flavors. Disk size and virtual CPU allocation are
different for equivalent flavors. Compare the offerings based on the
performance needs that you identify in the following sections.

The following table shows flavor classes for different workloads:

| (Prototype) | (Scale) | (Optimize) |
| --- | --- | --- |
| General purpose virtual servers | General purpose or Workload-optimized virtual servers | General purpose or Workload-optimized OnMetal servers |
|   | **Description** |   |
| VMs running on multi-tenant hosts. Smaller sizes, balanced resources, and CPU and network burst capability provide the lowest price points and best value. | VMs running on multi-tenant hosts. Smaller sizes and workload-specific designs allow for price-performance optimization for your particular application. | API-driven, instantly provisioned, single-tenant, bare metal servers. Full host and workload-specific designs provide large-scale cost efficiencies, as well as maximum and consistent performance. |
| **General purpose** | **Workload optimized** | **Workload optimized** |
| Class name: **General Purpose v1** | Class name: **Compute v1** | Class name: **OnMetal General Purpose** |
| Use cases:<br /><br /> - Testing and development<br /> - Low to medium-traffic web servers<br /> - Batch processing<br /> - Network appliances<br /> - Small to medium databases | Use cases:<br /><br /> - Medium to large-traffic web servers, application servers, batch processing, and network appliances | Use cases:<br /><br /> - Large-traffic web servers, application servers, batch processing, and network appliances|
|   | **I/O optimized** | **I/O optimized** |
|   | Class name: **I/O v1** | Class name: **OnMetal I/O** |
|   | Use cases:<br /><br />- Medium to large relational databases and NoSQL data stores | Use cases:<br /><br />- Large-scale online transaction processing (OLTP), relational databases, and NoSQL data stores |
|   | **Memory optimized** | **Memory optimized** |
|   | Class name: **Memory v1** | Class name: **OnMetal Memory** |
|   | Use cases:<br /><br /> - Medium to large caches, search indexes, and in-memory analytics | Use cases:<br /><br />- Large caches, search indexes, and in-memory analytics |

### Performance testing in Linux

If your application is running on a Linux&reg; system, there are many
utilities that you can use to determine how well your server is handling the
load. The main statistics that you should examine are the **load average** on
the server and the **available memory** while your application is running.

You can use the following utilities to monitor server performance:

-  `free`: This is a quick and easy-to-use monitoring utility that gives you a
   snapshot view of the amount of available memory on your server. Adding the
   `-m` switch to the command shows you the available memory in megabytes (as
   opposed to the default measurement, which is kilobytes).

-  `top`: This utility does more than just check available memory. You can
   also view the load average on the server and the processes that are using
   the most resources on your server.

-  `iotop`: You can use the `iotop` command to monitor disk I/O on a
   per-process basis.

-  `dstat`: The `dstat` command shows you the I/O statistics and other
   information with more versatility than other commands.

**Note**: You might need to install extra packages on your server to use the
`iotop` and `dstat` commands.

If you use these tools while you run your web application and see an excessive
load average or excessive memory usage, you either need to tune your
application or choose a more powerful server flavor on which to run it.
