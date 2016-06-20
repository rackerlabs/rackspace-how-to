---
permalink: tiered-configuration-using-cloud-load-balancers
audit_date: '2016-05-24'
title: Tiered configuration using Cloud Load Balancers
type: article
created_date: '2015-05-24'
created_by: Nate Archer
last_modified_date: '2016-05-24'
last_modified_by: Nate Archer
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

You can configure your [deployment environment](/how-to/rackspace-open-cloud-reference-architecture/) at Rackspace in many ways. However, if your configuration uses a single cloud server and your server fails, your application also fails.

You can optimize your infrastructure by splitting your single server into a tiered configuration. A tiered configuration can reduce potential downtime caused by server failure while balancing traffic to your application.

### Tiered configuration diagram

Tiered configurations augment a single server with a cloud load balancer and at least one web server. The following diagram provides an example of a tiered configuration:

<img src="{% asset_path cloud-load-balancers/tiered-configuration-using-cloud-load-balancers/tiered-config.svg %}" alt="Tiered configuration diagram" />

The size of both general purpose servers are half the size of the single server. For example, if your single server is 4 GB, the size of your web servers is 2 GB.

### Set up a tiered configuration

You can set up a tiered configuration with [Cloud Orchestration](/how-to/cloud-orchestration/).

For an example of how to set up a tiered configuration, watch the [Rackspace Cloud Servers - Building a LAMP using Orchestration](https://www.youtube.com/watch?v=9tk7NrR7tYo&feature=youtu.be) tutorial.
