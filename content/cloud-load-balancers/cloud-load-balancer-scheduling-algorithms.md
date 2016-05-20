---
permalink: cloud-load-balancer-scheduling-algorithms/
audit_date:
title: Cloud Load Balancer scheduling algorithms
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

As part of creating a Cloud Load Balancer, you'll choose a load balancing
algorithm. It's important to choose the algorithm that best suits the resources you have and the
expected workload for each resource. Note that in most cases, the Random, Round Robin, or Least Connections algorithms are sufficient when load-balancing two identical servers for increased web traffic. However, if your servers are unequal in size or RAM, you should consider using a weighted algorithm that favors your server with the maximum available resources.

You can choose from one of the following load balancing algorithms:

- **Round robin** -  This algorithm directs traffic in a circular pattern to each node of a load balancer in
succession. If your servers are comparable in size and RAM, this algorithm is a good choice, since it directs traffic to the next node in succession, regardless of its current workload or number of open connections. This algorithm works well in most
situations.

- **Weighted round robin** -  This algorithm directs traffic in a circular pattern to each node of a load balancer in succession, with a larger portion of requests being serviced by nodes with a greater weight. This algorithm works well when you have two or more Cloud Servers that are unequal in computing power and available resources. For example, you want the majority of traffic to go to the server that has the most RAM. Or if one of your servers hosts several mission critical applications, you may want to direct the majority of
traffic to a different server that hosts fewer
applications.

- **Random** - This algorithm directs traffic to a randomly selected node. Consider using
this algorithm when nodes are equally matched in computing power and
available resources. For example, you have two Cloud Servers with the
same size disk and RAM.

- **Least connections** - This algorithm directs traffic to the node
with the fewest open connections. This algorithm
works best in environments where the servers you are load balancing have similar
capabilities.

- **Weighted least connections** - This algorithm directs traffic to the node with the fewest open connections, however nodes with a larger weight will service proportionally more connections at any one time. This algorithm uses more computation time than the Least Connections algorithm. However, the additional computation results in distributing the traffic more efficiently to the node that is most capable of
handling the request.
