---
permalink: configure-a-load-balancer/
audit_date: '2018-10-08'
title: Configure a load balancer
type: article
created_date: '2012-07-17'
created_by: Rackspace Support
last_modified_date: '2018-10-08'
last_modified_by: Kate Dougherty
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

Mission-critical web-based applications and workloads require a high
availability (HA) solution. Load balancing distributes workloads across two or
more servers, network links, and other resources to maximize throughput,
minimize response time, and avoid overload. Rackspace [Cloud Load
Balancers](https://www.rackspace.com/cloud/load-balancing) enable you to
quickly load balance multiple cloud servers or external servers for optimal
resource utilization.

This article provides instructions for setting up and configuring a load
balancer in the Rackspace Cloud.

### Set up a load balancer

Use the following steps to set up a load balancer:

1. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).

2. In the top navigation bar, click **Networking > Load Balancers**.

    The Cloud Load Balancers page appears.

3. Click **Create Load Balancer**.

4. In the **Identification** section, enter a name for the new load balancer
   and select the region.

5. In the **Configuration** section, select one of the following choices for
   **Virtual IP**:

    - **Accessible on the Public Internet**: Setting your virtual IP type to
      public enables any two servers with public Internet Protocol (IP)
      addresses to be load balanced. While these servers can be nodes outside
      of the Rackspace network, be aware that standard bandwidth rates apply.

    - **On the Rackspace Service Network**: This is the best option for load
      balancing two cloud servers because it enables the load-balancing
      traffic to run on the Rackspace Cloud internal network or ServiceNet.
      This option has two advantages: the rate limit on ServiceNet is double
      the rate limit on the public interface, and traffic between cloud
      servers has no charge for bandwidth.

6. Choose the protocol and port that you want to use. The port adjusts to the
   protocol that you select, but you can also manually edit the port.

    **Note**: For more information about the protocols that you can choose
    when configuring a load balancer, see [Choosing the Right
    Protocol](/how-to/available-protocols-when-configuring-a-cloud-load-balancer).

7. Choose the appropriate algorithm for your load balancer.

    **Note**: This is an important attribute to set, especially as your
    load balancer implementation becomes more complex. In most cases, the
    Random, Round Robin, or Least Connections algorithm is sufficient when
    you are load balancing two identical servers for increased web traffic. If
    your servers are unequal in size or resources, consider using weighted
    algorithms to favor the servers that have more resources.

8.	In the **Add Nodes** section, click **Add Cloud Servers** to set your load
    balancer to operate on one or more of your cloud servers.

9.	To add one or more external nodes, click **Add External Node**, then enter
    the IP address and port (usually port 80 for HTTP traffic) of the service
    that you want to load balance. You can then enable or disable the
    load-balancing service on your external node directly through the Control
    Panel.

     **Note**: The only domain names that you can use are host names that are
     associated with Cloud Database host names.

10.	Click **Create Load Balancer**.

     After your load balancer is built, you can view a summary of it.

### Additional configuration options

You can also configure the following options on the details page for the load
balancer:

- **Health Monitoring**: In addition to the default passive health monitor
  check, active health monitoring uses synthetic transaction monitoring to
  inspect an HTTP response code and body content to determine if the
  application or site is healthy.

- **Access Control**: This setting enables you to easily manage who can and
  can't access the services that the load balancer exposes.

- **Session Persistence**: If you're load balancing HTTP traffic, this feature
  uses an HTTP cookie that directs subsequent requests to the same node in
  your load balancer pool.

- **Logging**: For log management simplification, the logging feature supports
  both Apache-style access logs (for HTTP-based protocol traffic) and
  connection and transfer logging (for all other traffic) to your Cloud Files
  account. Logs are sorted, aggregated, and delivered to Cloud Files so that
  you have raw data in a single place that you can use for performance tuning
  or web analytics.

- **Connection Throttling**: Connection throttling limits the number of
  simultaneous connections that are allowed from each IP address. This feature
  helps prevent malicious or abusive traffic from reaching your server and its
  installed applications.

- **Content Caching**: Content caching improves website performance by
  temporarily storing data that was recently accessed. While the data is
  cached, the load balancer serves the data, instead of making another query
  to a web server behind it. This approach reduces response times for those
  requests and reduces the load on the web server. This feature works well if
  you have files that rarely change, such as static content and images.

- **Secure Traffic (SSL)**: SSL enables you to secure the traffic on your
  servers with an SSL certificate and private key.

- **HTTPS Redirect**: This feature enables you to configure a load balancer
  to redirect non-SSL HTTP traffic to SSL-secured HTTPS traffic. To
  use this feature and enable HTTPS redirects, you must configure your load
  balancers with SSL over port 443 and **Only Allow Secure Traffic**.

- **Logging**: When logging is enabled, the service processes load balancer
  access log files every hour and stores them in Cloud Files.

- **Error Page**: The service presents visitors with a **Default Message**
  error page when a load balancer is unable to pass traffic to the nodes
  behind it. However, this feature has a **Custom Error Page** option that
  enables you to use your own custom error page.

### Pricing

The cost for each load balancer is based on an hourly rate, plus
the number of concurrent connections, plus bandwidth.  You can view pricing
details on the following product pages for Cloud Load Balancers:

- [US product page for Cloud Load Balancers](http://www.rackspace.com/cloud/load-balancing/)
- [UK product page for Cloud Load Balancers](http://www.rackspace.co.uk/cloud-load-balancers/)

**Next steps:** [Cloud Files and the Content Delivery Network](/how-to/getting-started-with-cloud-files-and-cdn/)
