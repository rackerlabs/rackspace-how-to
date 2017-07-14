---
permalink: rackspace-metrics-overview/
audit_date:
title: Rackspace Metrics overview
type: article
created_date: '2015-03-03'
created_by: Shane Duan
last_modified_date: '2016-12-19'
last_modified_by: Laura Santamaria
product: Rackspace Metrics
product_url: rackspace-metrics
---
**To sign up for Rackspace Metrics, go to <http://go.rackspace.com/metrics>.**

Rackspace Metrics is a multi-tenant software-as-a-service (SaaS) product
that offers a flexible and affordable platform for storing and serving
time-series metrics. It provides a REST API for metrics ingestion and
retrieval. In addition, it also provides out-of-box integration with
popular open source tools. The software that powers this service is an
open source project named Blueflood, which is built on top of [Apache Cassandra](http://cassandra.apache.org/). Rackspace Metrics is designed
to meet the functional and performance requirements of enterprise-scale
metrics.

### The growth of metrics

The number of applications that are built for the cloud and deployed in
the cloud is growing. Instead of having a monolithic design, these
applications have a distributed architecture and are deployed as
clusters of platform components. These components constantly communicate
with each other to form the business functions of the application. In
this distributed architecture, each platform component instance is an
independent process and can be monitored individually. As a result, the
size of the data collected by infrastructure-monitoring tools, such as
Rackspace Monitoring and Nagios, has grown exponentially.

That's where Rackspace Metrics comes in.

Rackspace Metrics focuses on changing the cost-structure of metrics
collection by replacing the storage component. Metrics storage is
challenging to manage because of its constantly growing size and
performance requirements. Rackspace Metrics meets this challenge by
aligning itself with popular open-source tools for data collection and
visualization. Users get the same experience with a familiar toolset
without the hassle of managing the metrics storage.

### Rackspace Metrics components

Rackspace Metrics consists of two components: **metrics ingestion** and
**metrics query**.

-   **Metrics ingestion**: Rackspace Metrics enables users to ingest
    metrics via a public API, the Ingestion API. Rackspace Metrics is
    integrated with popular open-source metrics collection system, such
    as StatsD, collectD and Logstash. Users who are new to Rackspace
    Metrics can start using Rackspace Metrics by changing only a few
    lines of configuration in their existing metrics collection systems.
    You can also choose to leave your existing metrics storage engine
    running for a while to compare against Rackspace Metrics.

    The Metrics Ingestion API is currently in the [Early Access Program](https://developer.rackspace.com/docs/metrics/v2/early-access-program/)
    (EAP).

-   **Metrics query**: Rackspace Metrics enables users to retrieve
    metrics data via a public API. Through its Query API, Rackspace
    Metrics supports metrics visualization in the Rackspace Cloud
    Control Panel and Rackspace Intelligence for data collected through
    Cloud Monitoring. In addition, Rackspace Metrics can also integrate
    with Graphite and Grafana. See the how-to article for details:
[Create a Grafana dashboard for Rackspace Metrics](/how-to/create-a-grafana-dashboard-for-rackspace-metrics/).

    The Rackspace Metrics Query API is currently in
    Limited Availability.

### How to grant users access to Rackspace Metrics

No registration is required to access data in Rackspace Metrics that has
been collected through Cloud Monitoring. The data is already available
to users through the Query API.  When accessing data through the Query
API, a user must have the appropriate role.

To obtain access to the Rackspace Metrics Ingestion API, sign up through
[Early Access Program](<http://go.rackspace.com/metrics>).

### How to add the appropriate roles

Currently Rackspace Metrics product is not available in [Rackspace Cloud Control Panel](https://mycloud.rackspace.com/).  When you sign up for
the EAP, Rackspace Metrics related roles will be added to your users
automatically. If you see permission-related issues in testing, please
let us know.

**Note:** The roles needed for accessing the Rackspace Metrics API are described
in <https://developer.rackspace.com/docs/metrics/v2/general-api-info/role-based-access-control/>.
For more information about role-based access control, see [Learn about Role-Based Access Control (RBAC)](/how-to/overview-role-based-access-control-rbac).

### How to access Rackspace Metrics

Users can access Rackspace Metrics via simple REST API end points. A
number of tools are available that can send HTTP requests and capture
the output, including the following ones:

-   cURL, a command-line tool, available at <http://curl.haxx.se/>
-   Chrome Advanced REST Client, available at
    <https://advancedrestclient.com/>

### Find more information

If you want more information about Rackspace Metrics, such as access
endpoints, how to determine your tenant ID and retrieve authentication
tokens, and supported request options, see the [Rackspace Metrics getting started guide](https://developer.rackspace.com/docs/metrics/v2/getting-started/)
and the [Rackspace Metrics general API information](https://developer.rackspace.com/docs/metrics/v2/general-api-info/).

### Get help and provide feedback

During the Early Access program, support for Rackspace Metrics will be
available via email only during regular business hours. If you have
further questions or a suggestion, contact us at
<metrics-ea@rackspace.com>.

Your feedback is a key ingredient of Rackspace's success. If you have
suggestions for enhancements to Rackspace Metrics, contact us at
<metrics-ea@rackspace.com>.
