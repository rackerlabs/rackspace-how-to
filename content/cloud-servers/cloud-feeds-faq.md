---
permalink: cloud-feeds-faq/
audit_date:
title: Cloud Feeds FAQ
type: article
created_date: '2014-07-31'
created_by: David Hendler
last_modified_date: '2016-09-09'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Get quick answers to common questions about the Rackspace Cloud
Feeds service.

#### Who can use Cloud Feeds?

All Rackspace customers with a Cloud services account can use Cloud
Feeds.

#### How much does Cloud Feeds cost?

Cloud Feeds is available at no charge.

#### How do I grant access to Cloud Feeds?

For information about how to add Cloud Feeds to individual users on your
Cloud account, see [Cloud Feeds overview](/how-to/cloud-feeds-overview).

#### What can I use Cloud Feeds for?

During the Early Access Program, Cloud Feeds has limited functionality
and event notifications. Additional features will be added as
development continues, and some existing functionality might change.

The following table shows the kind of information, in the form of
events, that you can receive for various Rackspace Cloud services.

| Service                        | Feed name          | Events                                              |
|--------------------------------|--------------------|-----------------------------------------------------|
| Cloud Backup                   | /backup/events     | Bandwidth Usage, License Usage, Storage Usage       |
| Cloud Big Data                 | /bigdata/events    | Hadoop Cluster Usage                                |
| Cloud Block Storage            | /cbs/events        | Volume Usage                                        |
| Cloud Databases                | /dbaas/events      | Database Memory and Disk Usage                      |
| Cloud DNS                      | /dns/events        | Domain Create and Delete Events                     |
| Cloud Files                    | /files/events      | Bandwidth Usage, Storage Usage                      |
| Cloud Identity                 | /identity/events   | User Status Events                                  |
| Cloud Load Balancers           | /lbaas/events      | Load Balancer, Usage System, Status Events          |
| Cloud Monitoring               | /monitoring/events | Monitoring Usage                                    |
| Cloud Queues                   | /queues/events     | Bandwidth Usage, System Usage                       |
| Cloud Servers | /servers/events    | Bandwidth Usage, Server Usage, System Status Events |

Event notifications are stored for up to three days so they can be
retrieved when convenient. Events are published in XML format. At this
time most events are related to usage, with few system and security
events.

#### What features will be available in the future?

We plan to provide the following features in future releases:

-   Additional feeds and event types
-   Archiving
-   Support for JSON-formatted event notifications
-   Support for CADF-formatted event notifications
-   Daily usage summary for usage-related events
-   Feed aggregation across data centers
-   Near real-time latency

#### Where is Cloud Feeds available?

Cloud Feeds is available in the following regions:

-   Chicago (ORD)
-   Dallas-Fort Worth (DFW)
-   Hong Kong (HKG)
-   London (LON)
-   Northern Virginia (IAD)
-   Sydney (SYD)

#### What is the Early Access Program?

The Early Access Program lets customers use and give feedback on our
products before a final version is released. This program ensures that
our features align with customer business needs. Additional features
will be added as development continues, and some existing functionality
available during Early Access might change.

#### What are the Terms of Service?

During the Early Access period, the Cloud Feeds Terms of Service are
available at <http://www.rackspace.com/information/legal/testterms>.
When the Early Access Program is over, the Terms of Service will revert
to the standard Cloud Terms of Service.
