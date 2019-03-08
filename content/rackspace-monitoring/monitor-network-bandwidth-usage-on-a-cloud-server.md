---
permalink: monitor-network-bandwidth-on-a-cloud-server/
audit_date: '2019-03-08'
title: Monitor network bandwidth on a cloud server
type: article
created_date: '2019-03-08'
created_by: Rackspace Community
last_modified_date: '2019-03-08'
last_modified_by: Cat Lookabaugh
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

Because of outgoing bandwidth charges, many customers are interested in
monitoring their bandwidth usage. They need to track their spending to stay
within their company budget by monitoring the bandwidth usage and investigating
bandwidth spikes.

### How to monitor bandwidth

The Rackspace Monitoring agent does not keep track of bandwidth usage. To
monitor your usage, you can use a third-party monitoring agent like NewRelic&reg;,
which can monitor the bandwidth on your servers. You can also set up alerts in
NewRelic to trigger when you reach a certain threshold.

### Why bandwidth spikes

There are several reasons why you might experience an increase in your bandwidth
usage. You might have a legitimate traffic spike, experience a distributed
denial-of-service (DDoS) attack, have a compromised server, or have a
misconfiguration in your application.

For a legitimate traffic spike, ensure that you have enough resources to handle
the load. You might need to use a load balancer, add servers, and so on.

For a DDoS, you might use a company that does DDoS mitigation. For example,
Cloud Flare&reg; excels at providing protections for this scenario.

Compromised servers are much trickier. According to the
[Rackspace Terms of Service](https://support.rackspace.com/how-to/terms-of-service/),
the customer is responsible for ensuring that their cloud servers are secured.

### What to do with compromised servers

Investigate the servers to see if you can locate the cause and location of the
compromise and correct the issue.

The best course of action is to avoid compromise in the first place. See
the following documents for some security suggestions:

- [Best practices in the cloud](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-ops/bestpractice/)
- [Windows Server security best practices](https://support.rackspace.com/how-to/windows-server-security-best-practices/)
- [Best practices for firewall rules configuration](https://support.rackspace.com/how-to/best-practices-for-firewall-rules-configuration/)
- [Controlling network traffic by using security groups and rules](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/controlling-network-access/security-groups/)

### Site and application configuration

Some organizations have a multitiered environment, which is good, but instead
of using the private network, they use the public network for server communication.
If you have servers in the same data center, there is no charge for bandwidth
when configuring your application to use a private network. If you configured
the application to use the public network, this incurs a charge, and it is less
secure than using a private network.  Use a private network whenever possible.
