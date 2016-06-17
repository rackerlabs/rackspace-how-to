---
permalink: rackspace-monitoring-checks-and-alarms/
audit_date:
title: Rackspace Monitoring checks and alarms
type: article
created_date: '2013-08-16'
created_by: Jim Culbreath
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---
A *check* specifies the parts or pieces of the server that you want to collect metrics about and how you want to do it. In other words, a check returns a group of related metrics. Metrics groups help you collect any data that you want. For example, you can use the **agent.cpu** check to collect the CPU utilization-related metrics from your server.

Because a check does not trigger any alerts by itself, collecting more data is almost always a good option. We recommend setting up as many checks as relevant to your server even before you know what alerts you want.

Rackspace Monitoring uses *alarms* to analyze the data that is collected by a check. The alarm criteria contains the logic to process this data and convert the alarm into one of the three states: OK, WARNING, and CRITICAL.

### Where to configure checks and alarms

You can configure monitoring checks and alarms in teh following web portals:

- The common checks are displayed along with the cloud servers in the Cloud Control panel.  For more information, see [Creating a monitoring check using the cloud control panel](https://support.rackspace.com/how-to/creating-a-monitoring-check-using-the-cloud-control-panel/)
- The complete list of checks can be configured in Rackspace Intelligence. For more information, see [Working with checks](https://support.rackspace.com/how-to/working-with-checks/)

The major groups of checks are remote check, agent checks, and hostinfo checks. The following section describes the useful details about the remote checks. For more information about all the check types, see the [Check types reference](https://developer.rackspace.com/docs/rackspace-monitoring/v1/developer-guide/#check-types-reference) section of the Rackspace Monitoring API documentation.

### Remote checks

Remote checks monitor an entity’s Internet connectivity, and can be performed from multiple monitoring zones. These zones are deployed in the six data centers around the globe, and you can choose the zones from which to perform a remote check. Each selected monitoring zone performs the configured remote check, and the collected data from each monitoring zone is used to evaluate the alarm criteria. You receive notifications only if the observations from the monitoring zones reach quorum on the resulting alarm state. As a result, you can filter out cases where a single monitoring zone is having an isolated issue connecting to your server.

#### Consistency level

The system determines the alarm state through quorum-based voting from the monitoring zones. This is specified in the alarm criteria as **consistencyLevel**, an important attribute that is typically left with a value of **QUORUM** (the default) unless there is a specific reason to change it. The other two values for this setting are **ONE** and **ALL**. For more information about alerting policies and consistency levels, see [Alert policies](https://developer.rackspace.com/docs/rackspace-monitoring/v1/developer-guide/#alert-policies).

#### Consecutive count

You can also tune the sensitivity level of the alarms by setting the **consecutiveCount** attribute. For example, if you want to run the check every minute, but want to be notified only if the monitoring zones can't ping the server three times in a row (which is three minutes if your check period is 60 seconds), you can add `":set consecutiveCount=3"` to the beginning of the alarm criteria to achieve the desired result.

#### Recommended monitoring zones

You should also think about choosing the right monitoring zones for your server. The monitoring zones initiate remote checks from the data center in which they are deployed. Checks are not executed from your users' browsers, so it is still different from Real User Monitoring (RUM). However, the checks are fairly accurate in detecting cross-region connectivity.

From the metrics that Rackspace has collected in the system, we did noticed, that the three data centers in the US (IAD, DFW and ORD) generally have better connections among themselves, and this is also the case for the other three non-US data centers (HKG, LON, and SYD). The following table shows our recommendation for how to determine which monitoring zones to choose for servers deployed in each data center.

| Data center where server is deployed | Recommended monitoring zones |
| --- | --- |
| SYD | SYD, HKG, ORD |
| HKG | HKG, SYD, IAD |
| IAD | IAD, ORD, DFW |
| ORD | ORD, IAD, DFW |

### Email notifications

Email notifications are designed to be actionable and readily understandable. In the notifications, older observations not included in the calculation are dimmed. As a result, you always see the number of observations that is consistent with the configuration of the checks, and can identify the ones that contributed to the notification.

The time window in which an observation is included is determined based on the consecutive count defined in the alarm and the period configured on the check. The formula is `period x 1.5 x consecutiveCount`. Because the default period is 60 seconds and the default consecutive count is 1, only the observations from the configured monitoring zones within the past 90 seconds would contribute to the decision of the resulting alarm state.

Remote checks are generally noisier than agent checks because of external factors that can’t be controlled by Rackspace Monitoring. With the combination of these settings, we believe you can tune your monitoring configuration to the level that suits you.
