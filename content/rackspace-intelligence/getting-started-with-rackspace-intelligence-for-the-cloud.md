---
permalink: getting-started-with-rackspace-intelligence-for-the-cloud/
audit_date: '2018-10-24'
title: Getting started with Rackspace Intelligence for the cloud
type: article
created_date: '2015-10-20'
created_by: Constanze Kratel
last_modified_date: '2018-11-01'
last_modified_by: Kate Dougherty
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

**Note**: This guide is for Rackspace Intelligence on a standard cloud
account. If you have a dedicated account, see
[Getting started with Rackspace Intelligence for dedicated
accounts](/how-to/getting-started-with-rackspace-intelligence-for-dedicated-accounts).

Rackspace Intelligence provides a *dashboard* that shows actionable insights
into the health of your infrastructure. You can use these insights to improve
your system's performance and availability.

You can use Rackspace Intelligence to help you understand the following
kinds of entities:

-   Rackspace cloud servers
-   Rackspace cloud databases
-   Other entities that might be hosted by Rackspace or an another service

Rackspace Intelligence can gather and act on only the information that is
available to it. For example, if you define a website that is hosted outside of
Rackspace as an entity, then you might be able to place a check on its ping
time, but you probably won't be able to check the space available
in its file system.

### Access Rackspace Intelligence

Use the following steps to access Rackspace Intelligence:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

   If your account is configured to require it, you might need to perform
   additional steps to [lMulti-factor authentication from the Cloud Control
   Panel](/how-to/multi-factor-authentication-from-the-cloud-control-panel).

2. In the top navigation bar, click **Select a Product > Rackspace
   Intelligence**.

### Learn Rackspace Intelligence vocabulary

To fully use the features that Rackspace Intelligence offers, you
should familiarize yourself with the basic concepts about entity
monitoring and metrics. For more information, see [Learning the Rackspace
Intelligence
vocabulary](/how-to/learning-the-rackspace-intelligence-vocabulary).

### Explore the Rackspace Intelligence dashboard

Actions that you can perform in the user interface are grouped into four
sections: **Monitor**, **Alert**, **Suppress**, and **Visualize**. Within
each section, you can view details about the action. For more information, see
[Understanding the Rackspace Intelligence user
interface](/how-to/understanding-the-rackspace-intelligence-dashboard-user-interface).

### Begin working with a new entity

As soon as it becomes aware of an entity, Rackspace Intelligence can
discover and display basic status information about it. Rackspace
Intelligence can give you deeper insights about an entity if you
configure that entity to provide more information. For
suggestions on steps that you can take to maximize the information
available to Rackspace Intelligence, see [Preparing to use
Rackspace
Intelligence](/how-to/preparing-to-use-rackspace-intelligence).

### Manage how Rackspace Intelligence monitors your infrastructure

You can use the **Monitor**, **Alert**, **Suppress**, and **Visualize**
sections of the interface to identify infrastructure that you want to monitor
and examine events in your configuration.

#### Use the Rackspace Intelligence dashboard

You can use the Rackspace Intelligence dashboard to examine and manage
how Rackspace Intelligence interacts with your infrastructure. The
Rackspace Intelligence dashboard provides information about the
following items:

-   Entities monitored by Rackspace Intelligence
-   Monitoring agents
-   Open alerts
-   Current suppressed notifications
-   Notifications that were suppressed in the past

You can also use the Rackspace Intelligence dashboard to [generate
graphs](/how-to/rackspace-intelligence) to visualize infrastructure status.

#### Monitor entities

The [list of
entities](/how-to/monitoring-entities-with-rackspace-intelligence) identifies
all entities known to Rackspace Intelligence. While displaying the list
of known entities, you can perform management functions such
as [defining new
entities](/how-to/monitoring-entities-with-rackspace-intelligence#create-entities).

The **Monitor** section of the interface also displays information about
**Notifications** and **Notification Plans**.

#### Monitor open alerts

The [list of open
alerts](/how-to/monitoring-open-alerts-with-rackspace-intelligence) identifies
all entities that are currently in a status for which you have asked
Rackspace Intelligence to trigger alarms.

Depending on the [notification
plans](/how-to/working-with-rackspace-intelligence-notification-plans) that
you have defined, appropriate communications and actions might have
already occurred in response to these alerts. Examine the list directly to
investigate infrastructure status in context whether
or not you were automatically
[notified](/how-to/working-with-notifications-in-rackspace-intelligence)
about status changes.

### Change how Rackspace Intelligence communicates its findings

You can manage how you are notified of status changes, as well as which
notifications are suppressed.

You can also examine a log to investigate the changes that occurred while
notifications were suppressed.

#### Report infrastructure status

When Rackspace Intelligence detects a status change, it can report its
findings by sending email or a text message. Rackspace Intelligence can
also respond to a status change by executing a policy that is defined
by a
[webhook](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#webhooks-and-capability-urls).

To customize how Rackspace Intelligence responds when it detects a
status change, perform the following actions:

- Define [notifications](/how-to/working-with-notifications-in-rackspace-intelligence)
  . Ensure that you also provide contact details as part of this process.
- Define [notification
  plans](/how-to/working-with-rackspace-intelligence-notification-plans).
  Ensure that you also define the notifications that you want to perform,
  and under which circumstances.

#### Suppress reporting of infrastructure status

Rackspace Intelligence enables you to [suppress
notifications](/how-to/working-with-notification-suppressions-in-rackspace-intelligence) when notifications are temporarily inappropriate, such as during
scheduled maintenance activity.

#### Examine the suppression log

To investigate the alerts that the system muted but that ordinarily would have
prompted notifications, you can [examine the suppression
log](/how-to/examining-the-log-of-alerts-suppressed-by-rackspace-intelligence).

### View what Rackspace Intelligence sees

The information in this section shows you how to view the information that
Rackspace Intelligence sees.

#### Visualize infrastructure status

Rackspace Intelligence can report its findings visually through the following
types of graphs:

-   **[Basic
    graphs](/how-to/viewing-basic-graphs-of-activity-in-rackspace-intelligence)**: These predefined graphs enable you to observe changes in the status of
    an entity that occurred within a specific time range.

-   **[Custom
    graphs](/how-to/creating-custom-graphs-of-activity-in-rackspace-intelligence)**: These graphs enable you to compare multiple entities and multiple
    metrics.

### Create checks and alarms for your entities

The information in this section shows you how to create checks and alarms for
your entities.

#### Create and manage checks and alarms

Rackspace Intelligence provides a wizard that enables you to [create
monitoring
checks](/how-to/working-with-checks) that
collect metric data for your infrastructure. You can [set up
alarms](/how-to/working-with-alarms) for
your checks to receive notifications when certain metric data meet criteria.
You can also perform management functions, such as [editing your
checks](/how-to/working-with-checks) and [editing your
alarms](/how-to/working-with-alarms).
