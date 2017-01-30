---
permalink: monitoring-cloud-databases-in-the-cloud-control-panel/
audit_date:
title: Monitoring Cloud Databases in the Cloud Control Panel
type: article
created_date: '2014-04-14'
created_by: Neha Verma
last_modified_date: '2016-06-13'
last_modified_by: Kyle Laffoon
product: Cloud Databases
product_url: cloud-databases
---

Monitoring is included with Cloud Databases to help you manage the
health of your instances. Monitoring checks and alarms can be configured
using the [Cloud Control Panel](https://mycloud.rackspace.com/) or the
[Cloud Monitoring
API](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/).

*Monitoring checks* describe the metrics being monitored, and monitoring
alarms are actions that can be triggered when a check meets specified
criteria. For example, a check for memory utilization records memory use
on an instance. An alarm could be configured to trigger and send an
email when the memory check shows free memory has dropped below a
specified level.

The checks and alarms that are set up by default on a Cloud Databases
instance are described in the following sections.


### Checks

Monitoring checks are listed on the details page of a Cloud Databases
instance in the Cloud Control Panel.

<img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbmonitoringchecks.png %}" width="370" height="274" />

Click the name of a check to view a graph of the check's results over
time and any alarms configured for that check.

The following monitoring checks are preconfigured for Cloud Databases
instances.


#### CPU check

The graph for the CPU check displays how much of its available
processing power the instance uses. It also displays minimum, maximum,
and average CPU usage for that period.

<img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbcpugraph.png %}" width="571" height="231" />

#### File system check

The graph for the File system check displays disk usage for the Cloud
Databases instance. The **Total** value represents the total disk space
available to the instance, and this value can change if the instance is
resized.

<img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbfilesystemgraph.png %}" width="561" height="229" />

#### Load average check

The graph for the load average check displays your instance's load
average on a per-minute basis. Whereas the CPU usage graph displays
moment-to-moment fluctuations in CPU use, the load average graph
reflects overall CPU usage.

<img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbloadgraph.png %}" width="567" height="221" />

#### Memory check

The graph for the memory check displays your instance's memory use
(RAM). The **Total** value represents the total memory available to the
instance, and the **Actual Used** value represents the amount of memory
in use.

<img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbmemorygraph.png %}" width="561" height="226" />

#### Network check

The graph for the Network check displays inbound and outbound network
traffic in kilobytes per second.

<img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbnetworkgraph.png %}" width="473" height="185" />

#### MySQL check

Graphs that report metrics for the MySQL datastore running on your instance
are available in the Cloud Control Panel under **Monitoring Alerts**. This area
links to our [Rackspace Intelligence site](https://intelligence.rackspace.com/),
currently in beta.

### Alarms

You can set up custom alarms that will trigger notifications when
defined criteria are met for monitored metrics. By default Cloud
Databases instances have an alarm configured to send an email alert when
disk space is low.

**Note:** You might need to add **alerts@cloudmonitoring.rackspace.com**
to your contacts list to prevent email alerts from being marked as spam.

#### Creating alarms

You can view and create alarms from a check's details page.

1.  On the details page for the Cloud Databases instance, click the name
    of the check for which you want to create an alarm.
2.  In the **Alarms** section at the bottom of the page, click the
    **Create Alarm button**.
3.  In the **Alarm Name** field, enter a name for the alarm.
4.  Select the contact who will receive notifications from the alarm.

    By default this value is set to the technical contact on
    your account.

5.  In the **Alarm Criteria** field, enter the criteria for the alarm.
    To view example criteria, click **Example Alarm**.

    The metrics available for use as criteria are listed in the
    Available Metrics section of the alarm editing screen. A description
    of each metric is provided in the Agent Check Types section of the
    Cloud Monitoring API documentation.

    The language used to define criteria for alarms is documented in the
    [Alert Triggering and
    Alarms](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-tech-ref-info/alert-triggers-and-alarms)
    section of the Cloud Monitoring API documentation. Clicking Example
    Alarm under the criteria field will let you view example criteria
    for the check.

    <img src="{% asset_path cloud-databases/monitoring-cloud-databases-in-the-cloud-control-panel/dbcpualarm.png %}" width="407" height="546" />

#### Editing alarms

To change the alarm name, alert recipient, or alarm criteria, click the
gear icon next to an existing alarm and select **Edit Criteria**.

### Alarm criteria examples

The following sections provide example criteria for each of the Cloud
Databases checks.

These examples define criteria for *Warning*, *Critical*, and OK
statuses. By default, Warning and Critical statuses cause the text of
the returned status to be emailed to the technical contact for your
account. You can define more complex notification plans by using the
[Cloud Monitoring
API](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/).

For all of the alarms, the available metrics are displayed in the alarm
creation dialog box and are explained in the [Cloud Monitoring API
documentation](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#agent-check-types).


### CPU alarms

The following criteria returns a Warning status when CPU usage is above
90% and a Critical status when CPU usage is above 95%.

    if (metric['usage_average'] > 95)
           return new AlarmStatus(CRITICAL, 'CPU usage is #usage_average%, above your
        critical threshold of 95%');

        if (metric['usage_average'] > 90)
           return new AlarmStatus(WARNING, 'CPU usage is #usage_average%, above your description of the example code
        warning threshold of 90%');

        return new AlarmStatus(OK, 'CPU usage is #usage_average%, below your warning
           threshold of 90%');

### File system alarms

A monitoring alarm is included by default for this check. The criteria
for the Low Disk Space alarm will return a warning status when disk
usage exceeds 90% of total space available and a critical status when
disk usage exceeds 95% of total space available.

    if (percentage(metric['used'], metric['total']) > 90) {
           return new AlarmStatus(CRITICAL, "Disk usage is above your critical threshold of
          90%");
         }

         if (percentage(metric['used'], metric['total']) > 80) {
           return new AlarmStatus(WARNING, "Disk usage is above your warning threshold of
        80%");
         }

        return new AlarmStatus(OK, "Disk usage is below your warning threshold of 80%");

### Load average alarms

The time period used to calculate load average for the load average
alarm can be set to 1 minute, 5 minutes, or 15 minutes.

    if (metric['5m'] > 1.5) {
           return new AlarmStatus(CRITICAL, '5 minute load average is #5m, above your
          critical threshold of 1.5');
          }

        if (metric['5m'] > 1) {
           return new AlarmStatus(WARNING, '5 minute load average is #5m, above your
        warning threshold of 1');
        }

        return new AlarmStatus(OK, '5 minute load average is #5m, below your warning
        threshold of 1');

### Memory alarms

    if (percentage(metric['actual_used'], metric['total']) > 90) {
           return new AlarmStatus(CRITICAL, "Memory usage is above your critical threshold
         of 90%");
         }

        if (percentage(metric['actual_used'], metric['total']) > 80) {
           return new AlarmStatus(WARNING, "Memory usage is above your warning threshold of
        80%");
        }

        return new AlarmStatus(OK, "Memory usage is below your warning threshold of 80%");

### Network alarms

    if (rate(metric['rx_bytes']) > 24903680) {
           return new AlarmStatus(CRITICAL, "Network receive rate on eth0 is above your
         critical threshold of 24903680B/s");
         }

        if (rate(metric['rx_bytes']) > 18350080) {
           return new AlarmStatus(WARNING, "Network receive rate on eth0 is above your
        warning threshold of 18350080B/s");
        }

        return new AlarmStatus(OK, "Network receive rate on eth0 is below your warning
           threshold of 18350080B/s");

### MySQL alarms

The following criteria returns a Warning status when the number of open
connections is above 400 and returns a Critical status when the number
of open connections is above 500.

    if (metric['threads.connected'] > 500) {
           return new AlarmStatus(CRITICAL, 'Total number of threads connected are #
        { threads.connected}, above your critical threshold of 500');
        }

        if (metric['threads.connected'] > 400) {
           return new AlarmStatus(WARNING, 'Total number of threads connected are #
        {threads.connected}, above your warning threshold of 400');
        }

        return new AlarmStatus(OK, 'Total number of threads connected are #
        {threads.connected}, below your warning threshold of 400');

Explanations of the available metrics are located in the MySQL
documentation for the relevant server status variables.
