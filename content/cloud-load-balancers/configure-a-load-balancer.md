---
permalink: configure-a-load-balancer/
audit_date:
title: Configure a load balancer
type: article
created_date: '2012-07-17'
created_by: Rackspace Support
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

Mission-critical web-based applications and workloads require a high availability (HA) solution. Load balancing distributes workloads across two or more servers, network links, and other resources to maximize throughput, minimize response time, and avoid overload. Rackspace Cloud Load Balancers enable you to quickly load balance multiple cloud servers or external servers for optimal resource utilization.

This article provides instructions for setting up and configuring a load balancer in the Rackspace Cloud.

### Set up a load balancer

1. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers**.

3. Under Create Resources, click **Load Balancers**.

4. Under **Identification**, enter the name of your new load balancer and select the region.

5. Under **Configuration**, select one of the following choices for **Virtual IP**.

    - **Accessible on the Public Internet:** Setting your virtual IP type to public allows any two servers with public IP addresses to be load balanced. These can be nodes outside of the Rackspace network, but be aware that standard bandwidth rates will apply.

    - **On the Rackspace Service Network:** This is the best option for load balancing two cloud servers because it allows the load-balancing traffic to run on the Rackspace Cloud internal network, or ServiceNet. This option has two distinct advantages: the rate limit is double what the rate limit is on the public interface, and all traffic on ServiceNet between cloud servers is not charged for bandwidth.

    - **Shared VIP on Another Load Balancer:** Use this option if you want to load balance multiple services on different ports while using the same virtual IP address.

6. Choose the protocol and port that best suits your needs. The port adjusts to the protocol that you select, but you can also edit the port yourself. (See [Choosing the Right Protocol](/how-to/available-protocols-when-configuring-a-cloud-load-balancer) for more information about the protocols that you can choose when configuring a load balancer.)

7. Choose the appropriate algorithm for your load balancer.

    **Note:** This is a very important attribute to set, especially as your load balancer implementation gets more complex. In most cases, the Random, Round Robin, or Least Connections algorithm are sufficient when load balancing two identical servers for increased web traffic. If your servers are unequal in size or resources, consider using weighted algorithms to favor the servers that have more resources.

8.	Under **Add Nodes**, click **Add Cloud Servers** to set your load balancer to operate on one or more of your cloud servers.

9.	To add one or more external nodes, click **Add External Node**, and then enter the IP address and port (usually port 80 for HTTP traffic) of the service that you want load balanced. You can then enable or disable the load-balancing service on your external node directly through the control panel.

    **Note**: The only domain names that can be used are hostnames associated with Cloud Database hostnames.

10.	Click **Create Load Balancer**.

    After your load balancer is built, you can view a summary of it.

### Additional configuration options

On the details page for the load balancer, you can set the following options:

- **Health Monitoring:** In addition to the default passive health monitor check, active health monitoring uses synthetic transaction monitoring to inspect an HTTP response code and body content to determine if the application or site is healthy.

- **Access Control:** Easily manage who can and can't access the services that are exposed via the load balancer.

- **Session Persistence:** If you are load balancing HTTP traffic, the session persistence feature uses an HTTP cookie to ensure that subsequent requests are directed to the same node in your load balancer pool.

- **Logging:** To simplify log management, the logging feature allows for Apache-style access logs (for HTTP-based protocol traffic) or connection and transfer logging (for all other traffic) to your Cloud Files account. If you need raw data in one place for performance tuning or web analytics, logs are sorted, aggregated, and delivered to Cloud Files.

### Pricing

The cost for each load balancer (instance) is based on an hourly rate plus the number of concurrent connections plus bandwidth.  You can view pricing details on the product pages for Cloud Load Balancers:

- [US product page for Cloud Load Balancers](http://www.rackspace.com/cloud/load-balancing/)
- [UK product page for Cloud Load Balancers](http://www.rackspace.co.uk/cloud-load-balancers/)

**Next steps:** [Cloud Files and the Content Delivery Network](/how-to/getting-started-with-cloud-files-and-cdn/)
