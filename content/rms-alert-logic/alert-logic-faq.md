---
permalink: rms-alert-logic-faq/
title: Alert Logic Security Solutions FAQ
type: faq
audit_date: '2020-02-03'
created_date: '2020-02-03'
created_by: Stephanie Fillmon
last_modified_date: '2020-02-03'
last_modified_by: Stephanie Fillmon
product: Alert Logic Security Solutions
product_url: rms-alert-logic
---

#### What is a remote collector?

A remote collector collects, compresses, and encrypts log data from the
configured remote machines to send directly to Alert Logic. A remote collector
can only collect syslog data.


#### How is a node defined?

Alert Logic&reg; Security Solutions Essentials and Professional offerings are
licensed based on the number of nodes that are protected in your environment.
Nodes are defined as follows, depending on environment type.

*Cloud Environment Nodes*

For customers with Amazon Web Services (AWS) or Microsoft&reg; Azure&trade;
deployments, Alert Logic integrates with Cloud Provider APIs to determine
the number of AWS EC2 and/or Azure Virtual Machine instances in your defined
protected networks.

Individual Containers are not counted as nodes. Rather, Alert Logic counts
the underlying instances. Similarly, cloud services not deployed on instances
in your environment are not counted as nodes. If you stay below 100MB of log
data per licensed node per day, these additional sources are effectively
"free." If aggregate account usage exceeds an average of 100MB per node per
day, Alert Logic provides offerings to cover the additional data.

Node usage snapshots in AWS and Azure are taken hourly; all hourly measurements
are averaged to calculate usage for a given month.

*On Premise Environment Nodes*

Alert Logic identifies nodes for on-premises environments via two different
methods. First, hosts with successfully provisioned agents are always counted
as nodes. Even when a host has multiple IP addresses, it will be counted as a
single node.

Since not all hosts in your protected network may have an agent - such as
network devices, for example - discovery scans are also used to identify
nodes. Discovery scans are performed daily and will capture any device in a
protected network with a port open.

Node usage is calculated by de-duplicating agent and discovery scan results.
Daily node counts are averaged over a calendar month to determine usage.

#### How is log volume calculated?

Log Volume is the aggregate log volume per day for the cumulative number of nodes
within the covered environment. For example, if you have 10 nodes, you must be
below 1GB per day in volume regardless of which nodes are generating the logs.

#### How do I know where agents are deployed?

Log in to the [Alert Logic portal](https://invision.alertlogic.net) for an
overview of your assets.

#### How do I make changes to my environment?

You can self-serve most changes in the Alert Logic portal or reach out to
the Network Defense team for help.
