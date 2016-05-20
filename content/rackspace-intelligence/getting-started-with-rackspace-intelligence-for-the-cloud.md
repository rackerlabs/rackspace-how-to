---
permalink: getting-started-with-rackspace-intelligence-for-the-cloud/
audit_date:
title: Getting started with Rackspace Intelligence for the cloud
type: article
created_date: '2015-10-20'
created_by: Constanze Kratel
last_modified_date: '2016-01-26'
last_modified_by: Rose Coste
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

**Note**: This guide is for Rackspace Intelligence on a standard cloud
account. If you have a dedicated account, click
[here](/how-to/getting-started-with-rackspace-intelligence-for-dedicated-accounts)
for the applicable getting started guide.

Rackspace Intelligence provides a data panel, called a *dashboard*, that
shows actionable insights into infrastructure health. You can use these
insights to improve system performance and availability.

The Rackspace Intelligence dashboard performs different functions than
control panels such as the Cloud Control Panel. You use a control panel
to create the actual entities, such as cloud servers and cloud
databases. For entities that already exist and are known to Rackspace
Intelligence, you use the Rackspace Intelligence dashboard to monitor
and visualize the status of the entities.

You can use Rackspace Intelligence to help you understand the following
kinds of entities:

-   Rackspace cloud servers
-   Rackspace cloud databases
-   Other entities, which need not be hosted at Rackspace and need not
    be servers or databases

Only data available to Rackspace Intelligence can be gathered and acted
on. For example, if you define a website that is hosted outside
Rackspace as an entity, then you might be able to usefully place a check
on its ping time, but you probably won't to be able to check the space
available in its file system.

**Note**: Early publications about Rackspace Intelligence referred to it
as *Cloud* Intelligence. Because the service is meant to be useful for
both cloud and dedicated devices, it is now
named *Rackspace* Intelligence. The Rackspace Intelligence team is working
to add support for dedicated accounts.

### Before you begin using Rackspace Intelligence

You can use Rackspace Intelligence most effectively if you prepare
yourself by learning its terminology and exploring its user interface.

#### Learn Rackspace Intelligence vocabulary

To be able to fully use the features Rackspace Intelligence offers, you
need to familiarize yourself with the basic concepts about entity
monitoring and metrics. See [Learning the Rackspace Intelligence
vocabulary](/how-to/learning-the-rackspace-intelligence-vocabulary) for
more details.

#### Explore the Rackspace Intelligence user interface

Actions that you can perform in the user interface are grouped into four
sections:  **Monitor**, **Suppress**, **Notify**, **Visualize**. Within
each section, you can drill down to get details. See [Understanding the
Rackspace Intelligence user
interface](/how-to/understanding-the-rackspace-intelligence-dashboard-user-interface) for
more details.

### Every time you use Rackspace Intelligence

If you have a Rackspace cloud account, you are authorized to use
Rackspace Intelligence.

Before you can use [Rackspace
Intelligence](https://intelligence.rackspace.com/), you must be logged
in to your [Cloud Control Panel](https://mycloud.rackspace.com/)
account. [Log in to Rackspace
Intelligence](/how-to/logging-in-to-the-rackspace-intelligence-dashboard)
explains how that works.

### When you begin working with a new entity

As soon as it becomes aware of an entity, Rackspace Intelligence can
discover and display basic status information about it. Rackspace
Intelligence can give you deeper insights about an entity if you
configure that entity to provide more information. See [Preparing to use
Rackspace
Intelligence](/how-to/preparing-to-use-rackspace-intelligence) for
suggestions on steps that you can take to maximize the information
available to Rackspace Intelligence.

### When you manage how Rackspace Intelligence monitors your infrastructure

You can use the **Monitor**, **Suppress**, **Notify**,
and **Visualize** sections of the interface to identify infrastructure to be
monitored and examine events in your
configuration.

#### Use the Rackspace Intelligence dashboard

You can use the Rackspace Intelligence dashboard to examine and manage
how Rackspace Intelligence interacts with your infrastructure. The
Rackspace Intelligence dashboard provides information about the
following items:

-   Entities monitored by Rackspace Intelligence
-   Open alerts
-   Notifications
-   Notification plans
-   Current suppressed notifications
-   Notifications that were suppressed in the past

You can also use the Rackspace Intelligence dashboard to [generate
graphs](/how-to/rackspace-intelligence) to
visualize infrastructure status.

#### Monitor entities

The [list of
entities](/how-to/monitoring-entities-with-rackspace-intelligence) identifies
all entities known to Rackspace Intelligence. While displaying the list
of known entities, you can perform management functions such
as [defining new
entities](/how-to/monitoring-entities-with-rackspace-intelligence#create-entities).

#### Monitor open alerts

The [list of open
alerts](/how-to/monitoring-open-alerts-with-rackspace-intelligence) identifies
all entities that are currently in a status for which you have asked
Rackspace Intelligence to trigger alarms. Depending on the [notification
plans](/how-to/working-with-rackspace-intelligence-notification-plans) that
you have defined, appropriate communications and actions might have
already occurred in response to these alerts. Examining the list
directly means that, whether or not you were
automatically [notified](/how-to/working-with-notifications-in-rackspace-intelligence) of
a status change, you can investigate infrastructure status in context.

### When you change how Rackspace Intelligence communicates its findings

You can manage how you are notified of status changes.
You can also manage  
which notifications are suppressed.
You can examine a log to investigate changes that occurred while
notifications were suppressed.

#### Report infrastructure status

When Rackspace Intelligence detects a status change, it can report its
findings by sending email or a text message. Rackspace Intelligence can
also respond to a status change by executing a policy that was defined
by
a [webhook](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#webhooks-and-capability-urls).

To customize how Rackspace Intelligence responds when it detects a
status change, perform the following actions:

-   Define [notifications](/how-to/working-with-notifications-in-rackspace-intelligence),
    providing contact details
-   Define [notification
    plans](/how-to/working-with-rackspace-intelligence-notification-plans),
    defining which notifications to perform under which circumstances

#### Suppress reporting of infrastructure status

Rackspace Intelligence enables you to [suppress
notifications](/how-to/working-with-notification-suppressions-in-rackspace-intelligence) for
cases when notifications are temporarily inappropriate, such as during
scheduled maintenance activity.

#### Examine the suppression log

To investigate alerts that were muted but ordinarily would have prompted notifications, you
can [examine the suppression
log](/how-to/examining-the-log-of-alerts-suppressed-by-rackspace-intelligence).


### When you want to see what Rackspace Intelligence sees*

#### Visualize infrastructure status

Rackspace Intelligence can report its findings visually with predefined
or custom graphs:

-   With [basic
    graphs](/how-to/viewing-basic-graphs-of-activity-in-rackspace-intelligence),
    you can observe changes in the status of an entity during a
    time range.
-   With [custom
    graphs](/how-to/creating-custom-graphs-of-activity-in-rackspace-intelligence),
    you can compare multiple entities and multiple metrics.

### When you want to create checks and alarms for your entities

#### Create and manage checks and alarms

Rackspace Intelligence provides a wizard that lets you [create
monitoring
checks](/how-to/working-with-checks) to
collect metric data for your infrastructure. You can [set up
alarms](/how-to/working-with-alarms) for
your checks to get notified when certain metric data meet criteria. You
can also perform management functions, such as [editing your
checks](/how-to/working-with-checks) and
[editing your
alarms](/how-to/working-with-alarms).
