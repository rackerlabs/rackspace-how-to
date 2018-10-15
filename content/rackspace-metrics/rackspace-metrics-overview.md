---
permalink: rackspace-metrics-overview/
audit_date: '2018-10-12'
title: Rackspace Metrics overview
type: article
created_date: '2015-03-03'
created_by: Shane Duan
last_modified_date: '2018-10-15'
last_modified_by: Kate Dougherty
product: Rackspace Metrics
product_url: rackspace-metrics
---

Rackspace Metrics is a multitenant software-as-a-service (SaaS) product
that offers a flexible and affordable platform for storing and serving
time-series metrics. It provides a REST API for metrics ingestion and
retrieval. In addition, it also provides out-of-box integration with
popular open-source tools. The software that powers this service is an
open-source project named [Blueflood](http://blueflood.io), which is built on
top of [Apache&reg; Cassandra&reg;](http://cassandra.apache.org/). Rackspace
Metrics is designed to meet the functional and performance requirements of
enterprise-scale metrics.

### The growth of metrics

The number of applications that are built for and deployed in
the cloud is growing. Instead of a monolithic design, these
applications have distributed architectures and are deployed as
clusters of platform components. These components constantly communicate
with each other to form the business functions of the application.

In distributed architectures, each platform component instance is an
independent process that can be monitored individually. As a result, the
size of the data collected by infrastructure-monitoring tools such as
Rackspace Monitoring and Nagios&reg; has grown exponentially.

Rackspace Metrics focuses on changing the cost structure of metrics
collection by replacing the storage component. Metrics storage is
challenging to manage because it continually grows in size and
performance requirements. Rackspace Metrics meets this challenge by
aligning with popular open-source tools for collecting and
visualizing data. Users get the same experience with a familiar toolset,
without the hassle of managing the metrics storage.

### Rackspace Metrics components

Rackspace Metrics consists of the following components:

-   **Metrics ingestion**: Rackspace Metrics enables you to ingest
    metrics through the Ingestion API. Rackspace Metrics is
    integrated with popular open-source metrics collection systems such
    as StatsD, collectd, and Logstash.

     You can start using Rackspace Metrics by changing only a few lines of
     the configuration in your existing metrics collection system. You can also
     choose to leave your existing metrics storage engine running for a while
     to compare the results against Rackspace Metrics.

     The Metrics Ingestion API is currently in the [Early Access
     program](https://developer.rackspace.com/docs/metrics/v2/early-access-program/).

-   **Metrics query**: Rackspace Metrics enables you to retrieve
    metrics data via a public API. Through its Query API, Rackspace
    Metrics supports metrics visualization in the Rackspace Cloud
    Control Panel and Rackspace Intelligence for data collected through
    Rackspace Monitoring. In addition, Rackspace Metrics can also integrate
    with Graphite and Grafana&reg;. For more information, see [Create a Grafana
    dashboard for Rackspace
    Metrics](/how-to/create-a-grafana-dashboard-for-rackspace-metrics/).

     The Rackspace Metrics Query API is currently in
     Limited Availability.

### Grant users access to Rackspace Metrics

You don't need to register to access data in Rackspace Metrics that has
been collected through Rackspace Monitoring. The data is already available
to users through the Query API. However, you must have the appropriate role to
access data through the Query API.

To obtain access to the Rackspace Metrics Ingestion API, sign up through
the [Early Access
program](https://developer.rackspace.com/docs/metrics/v2/early-access-program/).

### Add appropriate roles

Rackspace Metrics is not available in the [Rackspace Cloud Control
Panel](https://mycloud.rackspace.com/). When you sign up for
the Early Access program, Rackspace Metrics-related roles are added to your
users automatically. If you see permission-related issues in testing,
[contact us at metrics-ea@rackspace.com](mailto:metrics-ea@rackspace.com).

**Note:** For information on the roles that may access the Rackspace Metrics
API, see [Role-based access control
(RBAC)](https://developer.rackspace.com/docs/metrics/v2/general-api-info/role-based-access-control/). For more information about role-based access control,
see [Learn about Role-Based Access Control
(RBAC)](/how-to/overview-role-based-access-control-rbac).

### Access Rackspace Metrics

You can access Rackspace Metrics through simple REST API endpoints. The
following list provides some examples of tools that can send HTTP requests and
capture the output:

- [cURL](http://curl.haxx.se/): A command-line tool.
- [Chrome Advanced REST Client](https://advancedrestclient.com/): A REST
  client.

### Find more information

For more information about Rackspace Metrics, such as access
endpoints, how to determine your tenant ID and retrieve authentication
tokens, and supported request options, see the [Rackspace Metrics getting
started
guide](https://developer.rackspace.com/docs/metrics/v2/getting-started/)
and the [Rackspace Metrics general API
information](https://developer.rackspace.com/docs/metrics/v2/general-api-info/).

### Get help and provide feedback

During the Early Access program, support for Rackspace Metrics is
available by email only during regular business hours. If you have
further questions or suggestions, contact us at
<metrics-ea@rackspace.com>.
