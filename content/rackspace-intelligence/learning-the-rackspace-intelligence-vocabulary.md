---
permalink: learning-the-rackspace-intelligence-vocabulary/
audit_date:
title: Learning the Rackspace Intelligence vocabulary
type: article
created_date: '2015-07-28'
created_by: Constanze Kratel
last_modified_date: '2015-08-18'
last_modified_by: Kyle Laffoon
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

To tell Rackspace Intelligence which aspects of your configuration to
monitor for you, you define your objectives in the following terms:

-   *Entities* to be monitored

    For example, you can define a cloud server as an entity.

-   *Checks* that focus on a particular aspect of an entity's behavior

    For example, a check can monitor a cloud server's RAM usage.

-   *Alarms* that define the limits of the entity's behavior

    For example, alarm criteria identify whether RAM usage is in one of
    the following states: OK, WARNING, or CRITICAL.

-   *Alerts* that announce when a monitored entity has triggered an
    alarm

    For example, an alert reports that RAM usage has reached the
    CRITICAL level.

-   *Notification plans* that define how to communicate alerts

    For example, a notification plan requests notification of the help
    desk and the on-call system administrator.

-   *Notifications* that define the contact information used in
    notification plans

    For example, notifications to the on-call system administrator are
    sent as text messages to a specific telephone number.

-   *Visualizations* that present data meaningfully
 
    For example, a RAM usage graph shows growth leading up to the
    triggered alarm.

["Single Pane of Glass" for Your IT
Ops](http://www.rackspace.com/blog/cloud-monitoring/) discusses these
concepts in the context of Cloud Monitoring. Rackspace Intelligence acts
as a dashboard to help you interact with data collected by Cloud
Monitoring.
